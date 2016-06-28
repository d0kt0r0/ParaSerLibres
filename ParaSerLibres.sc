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
			text = text ++ textFragment;
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

	*initclass {
		editCollector = FragmentCollector.new;
		evalCollector = FragmentCollector.new;
	}

	*sembrar {
		netAddr = NetAddr.new("127.0.0.1",8000);
		Document.current.keyUpAction = {
			this.transmitEdit(Document.current.string);
		};
		thisProcess.interpreter.codeDump = { |x|
			this.transmitEval(x);
		};
	}

	*transmitEdit { |x|
		var y = x.clump(500);
		y.collect({|z,i| netAddr.sendMsg("/edit",i,y.size,z);});
	}

	*transmitEval { |x|
		var y = x.clump(500);
		y.collect({|z,i| netAddr.sendMsg("/eval",i,y.size,z);});
	}

	*cosechar {
		netAddr = NetAddr.new("127.0.0.1",8001);
		OSCdef(\edit,{ |m,t,a,p|
			this.receivedEdit(m[1],m[2],m[3]);
		},"/edit").permanent_(true);
		OSCdef(\eval,{ |m,t,a,p|
			this.receivedEdit(m[1],m[2],m[3]);
		},"/eval").permanent_(true);
	}

	*receivedEdit { |n,count,text|
		if(editCollector.cojer(n,count,text),{
			Document.current.string_(editCollector.text);
		});
	}

	*receivedEval { |n,count,text|
		if(evalCollector.cojer(n,count,text),{
			text.interpret;
		});
	}

}
