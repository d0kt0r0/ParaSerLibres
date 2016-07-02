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

	*initClass {
		editCollector = FragmentCollector.new;
		evalCollector = FragmentCollector.new;
	}

	*sembrar {
		netAddr = NetAddr.new("127.0.0.1",8000);
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
		netAddr = NetAddr.new("127.0.0.1",8001);

		OSCdef(\edit,{ |m,t,a,p|
			if(editCollector.cojer(m[1],m[2],m[3]),{
				Document.current.text = editCollector.text;
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
	}

}
