FragmentCollector {

	var expected;
	var <text;

	init {
		expected=0;
		text="";
	}

	cojer { |n,count,textFragment|
		if(n!=expected,{
			// "ERROR: fragment out of sequence".postln;
			expected = 0;
			text = "";
			^false;
		},
		{
			text = if(n==0,textFragment,text++textFragment);
			if(n<(count-1),{
				expected = expected + 1;
				^false;
			},
			{
				expected = 0;
				^true;
			});
		});
	}
}


ParaSerLibres {

	// public class variables
	classvar <>fftBuffer;
	classvar <>nodePath;
	classvar <>server;
	classvar >password;
	classvar <mainBus;

	// private variables
	classvar netAddr;
	classvar editCollector;
	classvar evalCollector;
	classvar mainBusObject;
	classvar firstRead;
	classvar oldText;
	classvar editCount;

	*initClass {
		firstRead = false;
		editCount = 0;
		editCollector = FragmentCollector.new;
		evalCollector = FragmentCollector.new;
		nodePath = "node";
	}

	*node {
		|cmd|
		fork {
			"pkill -f cosechar.js".systemCmd;
			0.3.wait;
			"pkill -f sembrar.js".systemCmd;
			0.3.wait;
			cmd = "cd " ++ Platform.userExtensionDir.escapeChar($ ) ++ "/ParaSerLibres && " ++ nodePath ++ " " ++ cmd;
			cmd.runInTerminal;
		}
	}

	*nodeSembrar {
		if(server.isNil || password.isNil,{
			"ERROR: Either or both of ParaSerLibres.server and/or ParaSerLibres.password have not been set".postln;
		},{
			this.node("sembrar.js ws://" ++ server ++ " " ++ password);
		});
	}

	*nodeCosechar {
		if(server.isNil,{
			"ERROR: ParaSerLibres.server has not been set".postln;
		},{
			this.node("cosechar.js ws://" ++ server);
		});
	}

	*synths {
		var path;
		mainBusObject = Bus.audio(Server.default,8);
		mainBus = mainBusObject.index;
		path = (Platform.userExtensionDir ++ "/ParaSerLibres/Synths.scd").standardizePath;
		thisProcess.interpreter.executeFile(path);
		Server.default.freeAll;
		if(Server.default.options.numOutputBusChannels >= 10, {
			SynthDef(\out,{
				var multi = In.ar(mainBus,8)*(-9.dbamp);
				var stereo = Splay.ar(multi)*(-3.dbamp);
				multi = Compander.ar(multi,multi,thresh:-10.dbamp,slopeAbove:1/20);
				stereo = Compander.ar(stereo,stereo,thresh:-10.dbamp,slopeAbove:1/10);
				Out.ar(0,stereo);
				Out.ar(2,multi);
			}).play(addAction:\addToTail);
			"ParaSerLibres 10-channel config: 2 channels stereo output + 8 channels main output".postln;
		});
		if(Server.default.options.numOutputBusChannels < 10, {
			SynthDef(\out,{
				var multi = In.ar(mainBus,8)*(-9.dbamp);
				var stereo = Splay.ar(multi)*(-3.dbamp);
				stereo = Compander.ar(stereo,stereo,thresh:-10.dbamp,slopeAbove:1/10);
				Out.ar(0,stereo);
			}).play(addAction:\addToTail);
			"ParaSerLibres 2-channel config: stereo mix of 8 channels only".postln;
		});
		if(fftBuffer.notNil,{
			this.fftSynth;
		});
	}

	*pdefs {
		var path = (Platform.userExtensionDir ++ "/ParaSerLibres/Pdefs.scd").standardizePath;
		var file = File.new(path,"r");
		var text = file.readAllString;
		if(Document.current.notNil,{Document.current.text = text;});
		text.interpret;
	}

	*sembrar { |reinit=false,doLaunchNode=true|
		this.synths;
		if(doLaunchNode,{this.nodeSembrar});
		netAddr = NetAddr.new("127.0.0.1",8000);
		if(Document.current.isNil,{
			"ERROR: sembrar not possible without open document".postln;
			^nil;
		});
		if(reinit,{
			var y;
			this.pdefs;
			y = Document.current.string.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/edit",i,y.size,z,NetAddr.langPort);});
			this.sembrarHooks;
		},{
			OSCdef(\sembrar,{ |m,t,a,p|
				if(editCollector.cojer(m[1],m[2],m[3]),{
					Tdef(\sembrar).stop;
					if(Document.current.notNil,{Document.current.text = editCollector.text});
					editCollector.text.interpret.postln;
					OSCdef(\sembrar).free;
					this.sembrarHooks;
				});
			},"/sembrar").permanent_(true);
			Tdef(\sembrar,{
				inf.do { netAddr.sendMsg("/sembrar",NetAddr.langPort); 0.25.wait; };
			}).play;
		});
	}

	*risembrar {
		netAddr.sendMsg("/sembrar",NetAddr.langPort);
	}

	*sembrarDiff {
		var y,d;
		if((editCount>=128)||(oldText.isNil), { // first time and every 128 keys send the full text regardless of diff
			// "sending clumped full document".postln;
			oldText = Document.current.string;
			y = Document.current.string.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/edit",i,y.size,z,NetAddr.langPort);});
			editCount = 0;
			^nil;
		});
		editCount = editCount + 1;
		d = this.diff; 		// otherwise look for simple diffs
		if(d.isNil,{^nil}); // do nothing if no difference
		if(d[0] == "insert",{
			// ("/insert " ++ d[1].asString ++ " " ++ d[2].asString).postln;
			d[2].class.postln;
			netAddr.sendMsg("/insert",d[1],d[2].asString,NetAddr.langPort);
			^nil;
		});
		if(d[0] == "delete",{
			// ("/delete " ++ d[1].asString).postln;
			netAddr.sendMsg("/delete",d[1],NetAddr.langPort);
			^nil;
		});
		if(d[0] == "multiple",{
			// "sending clumped full document".postln;
			y = Document.current.string.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/edit",i,y.size,z,NetAddr.langPort);});
			editCount = 0;
			^nil;
		});
	}

	*sembrarHooks {
		Document.current.keyUpAction = {
			this.sembrarDiff;
			fork {
				0.25.wait;
				netAddr.sendMsg("/cursor",Document.current.selectionStart,NetAddr.langPort);
			};
		};
		thisProcess.interpreter.codeDump = { |x|
			var y = x.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/eval",i,y.size,z,NetAddr.langPort);});
		};
	}

	*cosechar {
		var y;
		this.nodeCosechar;
		firstRead = true;
		this.synths;
		this.pdefs;
		netAddr = NetAddr.new("127.0.0.1",8001);

		OSCdef(\edit,{ |m,t,a,p|
			if(editCollector.cojer(m[1],m[2],m[3]),{
				if(Document.current.notNil,{ Document.current.text = editCollector.text });
				if(firstRead,{
					firstRead = false;
					Tdef(\cosecharInit).stop;
					editCollector.text.interpret.postln;
				});
			});
		},"/edit").permanent_(true);

		OSCdef(\eval,{ |m,t,a,p|
			if(evalCollector.cojer(m[1],m[2],m[3]),{
				evalCollector.text.interpret.postln;
			});
		},"/eval").permanent_(true);

		OSCdef(\cursor,{ |m,t,a,p|
			if(Document.current.notNil,{ Document.current.selectRange(m[1]) });
		},"/eval").permanent_(true);

		Tdef(\cosecharInit,{
			inf.do { netAddr.sendMsg("/read",NetAddr.langPort); 0.25.wait; }
		}).play;

		SkipJack.new( {
			netAddr.sendMsg("/read",NetAddr.langPort);
		},5, clock: SystemClock);

	}

	*fftSynth {
		SynthDef("fft", {
			var stereo, multi, suma, chain, ampL, ampR;
			stereo = In.ar(0,2);
			multi = In.ar(2,8);
			suma = A2K.kr(Amplitude.ar(multi.sum/8,0.005, 0.05));
			chain = FFT(fftBuffer.bufnum, multi.sum/8, wintype: 1);
			ampL = A2K.kr(Amplitude.ar(stereo[0], 0.005, 0.05));
			ampR = A2K.kr(Amplitude.ar(stereo[1], 0.005, 0.05));
			SendReply.kr(Impulse.kr(30),'/amp',values:[ampL,ampR]);
		}).play(addAction:\addToTail);
	}

	*charInserted { |a,b|
		// suppose that a single extra character has been inserted into b relative to a
		// if hypothesis is false return nil
		// if hypothesis is true return index of new character in b
		var firstDiff = nil, diffCount = 0;
		if(b.size != (a.size + 1),{^nil}); // if size not bigger by one, hypothesis is false
		for(0,a.size-1,{ |i| if( firstDiff.isNil && (b[i] != a[i]),{firstDiff=i})}); // find first difference
		if(firstDiff.isNil,{ ^a.size }); // if no diff in that range, then must be a single character appended
		for(firstDiff+1,a.size-1,{|i| if( b[i+1] != a[i],{ diffCount = diffCount+1 })}); // count remaining diffs
		if(diffCount == 0, { ^firstDiff }); // if no more diffs, then one diff was at first diff
		^nil; // otherwise, hypothesis is false
	}

	*charDeleted { |a,b|
		// suppose that a single character has been deleted from a to form b
		// if hypothesis is false return nil
		// if hypothesis is true return index of character deleted from a
		var firstDiff = nil, diffCount = 0;
		if(b.size != (a.size - 1),{^nil}); // if size not smaller by one, hypothesis is false
		for(0,b.size-1,{ |i| if( firstDiff.isNil && (b[i] != a[i]),{firstDiff=i})}); // find first difference
		if(firstDiff.isNil,{ ^a.size-1 }); // if no diff in that range, then deleted character must have been last of a
		for(firstDiff,b.size-1,{|i| if( b[i] != a[i+1],{ diffCount = diffCount+1 })}); // count remaining diffs
		if(diffCount == 0, { ^firstDiff }); // if no more diffs, then one diff was at first diff
		^nil; // otherwise, hypothesis is false
	}

	*diff {
		var x,newText;
		if(oldText.isNil,{
			oldText = Document.current.text;
			^nil;
		});
		newText = Document.current.text;
		if(newText == oldText,{^nil});
		x = this.charInserted(oldText,newText);
		if(x.notNil,{
			oldText = newText;
			^["insert",x,newText[x]];
		});
		x = this.charDeleted(oldText,newText);
		if(x.notNil,{
			oldText = newText;
			^["delete",x];
		});
		oldText = newText;
		^["multiple"];
	}

	*testDiff {
		Document.current.keyUpAction = {
			this.diff.postln;
		};
	}

}
