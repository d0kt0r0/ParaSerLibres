FragmentCollector {

	var expected;
	var <text;

	init {
		expected=0;
		text="";
	}

	cojer { |n,count,textFragment|
		if(n!=expected,{
			"ERROR: fragment out of sequence".postln;
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

	classvar netAddr;
	classvar editCollector;
	classvar evalCollector;
	classvar <mainBus;
	classvar mainBusObject;
	classvar firstRead;

	*initClass {
		firstRead = false;
		editCollector = FragmentCollector.new;
		evalCollector = FragmentCollector.new;
	}

	*synths {
		var path;
		mainBusObject = Bus.audio(Server.default,8);
		mainBus = mainBusObject.index;
		path = (Platform.userExtensionDir ++ "/ParaSerLibres/Synths.scd").standardizePath;
		thisProcess.interpreter.executeFile(path);
		Server.default.freeAll;
		if(Server.default.options.numOutputBusChannels == 10, {
			SynthDef(\out,{
				var multi = In.ar(mainBus,8)*(-9.dbamp);
				var stereo = Splay.ar(multi)*(-3.dbamp);
				multi = Compander.ar(multi,multi,thresh:-10.dbamp,slopeAbove:1/20);
				stereo = Compander.ar(stereo,stereo,thresh:-10.dbamp,slopeAbove:1/10);
				Out.ar(0,stereo);
				Out.ar(2,multi);
			}).play(addAction:\addToTail);
			"10-channel config: 8 channels main output + 2 channels stereo output".postln;
		});
		if(Server.default.options.numOutputBusChannels == 2, {
			SynthDef(\out,{
				var multi = In.ar(mainBus,8)*(-9.dbamp);
				var stereo = Splay.ar(multi)*(-3.dbamp);
				stereo = Compander.ar(stereo,stereo,thresh:-10.dbamp,slopeAbove:1/10);
				Out.ar(0,stereo);
			}).play(addAction:\addToTail);
			"2-channel config: stereo mix of 8 channels only".postln;
		});
	}

	*pdefs {
		var path = (Platform.userExtensionDir ++ "/ParaSerLibres/Pdefs.scd").standardizePath;
		var file = File.new(path,"r");
		Document.current.text = file.readAllString;
	}

	*sembrar { |reinit=false|
		this.synths;
		netAddr = NetAddr.new("127.0.0.1",8000);
		if(reinit,{
			var y;
			this.pdefs;
			y = Document.current.string.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/edit",i,y.size,z,NetAddr.langPort);});
			this.sembrarHooks;
		},{
			netAddr.sendMsg("/sembrar",NetAddr.langPort);
			OSCdef(\sembrar,{ |m,t,a,p|
				if(editCollector.cojer(m[1],m[2],m[3]),{
					Document.current.text = editCollector.text;
					this.sembrarHooks;
				});
			},"/sembrar").permanent_(true);
		});
	}

	*sembrarHooks {
		Document.current.keyUpAction = {
			var y = Document.current.string.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/edit",i,y.size,z,NetAddr.langPort);});
			netAddr.sendMsg("/cursor",Document.current.selectionStart,NetAddr.langPort);
		};
		thisProcess.interpreter.codeDump = { |x|
			var y = x.clump(500);
			y.collect({|z,i| netAddr.sendMsg("/eval",i,y.size,z,NetAddr.langPort);});
		};
	}

	*cosechar {
		firstRead = true;
		this.synths;
		netAddr = NetAddr.new("127.0.0.1",8001);

		OSCdef(\edit,{ |m,t,a,p|
			if(editCollector.cojer(m[1],m[2],m[3]),{
				Document.current.text = editCollector.text;
				if(firstRead,{
					firstRead = false;
					editCollector.text.asString.interpret.postln;
				});
			});
		},"/edit").permanent_(true);

		OSCdef(\eval,{ |m,t,a,p|
			if(evalCollector.cojer(m[1],m[2],m[3]),{
				evalCollector.text.asString.interpret.postln;
			});
		},"/eval").permanent_(true);

		OSCdef(\cursor,{ |m,t,a,p|
			Document.current.selectRange(m[1]);
		},"/eval").permanent_(true);

		SkipJack.new( {
			netAddr.sendMsg("/read",NetAddr.langPort);
		},5, clock: SystemClock);

		netAddr.sendMsg("/read",NetAddr.langPort);
	}

}
