s.scope;


///1
/////////////////////////////////////////////////////////////////////////SYNTHS
(
/////1
//////////////////////////////high noises
//highnoise 1
//a
(
SynthDef(\hn1a, {|vol=1|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.5);
		filt=RHPF.ar(sig, LFDNoise3.kr(0.25).range(10000, 3000), LFDNoise3.kr(0.25).range(0.01, 2) );
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 1), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.05), LFDNoise3.kr(0.125).range(0.1, 2.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn1a=Synth(\hn1a)

/////2
//b
(
SynthDef(\hn1b, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
		filt=RLPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.1, 60)).range(200, 4000), LFDNoise3.kr(4.7).range(0.001, 2) );
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 1), 1);
		pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(0.1, LFDNoise3.kr(0.5).range(1, 15)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn1b=Synth(\hn1b)

/////3
//c
(
SynthDef(\hn1c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=PinkNoise.ar(0.25);
	filt=RLPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.125).range(0.01, 10)).range(10000, 800), LFDNoise3.kr(4.7).range(0.001, 2) )+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.0125).range(0.1, 3)).range(50, 200), LFDNoise3.kr(0.125).range(0.001, 8.0), LFDNoise3.kr(0.125).range(0.001, 1.0), 0.125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 1), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 10.0), LFDNoise3.kr(0.125).range(0.1, 40.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn1c=Synth(\hn1c)

////4
//highnoise 2
//a
(
SynthDef(\hn2a, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
	filt=RHPF.ar(sig, LFDNoise3.kr(0.27).range(1000, 3000), LFDNoise3.kr(0.7).range(0.001, 2));
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 1), 1);
		pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.5).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.25).range(0.1, 25.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn2a=Synth(\hn2a)

////5
//b
(
SynthDef(\hn2b, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
	filt=RLPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.1, 5)).range(500, 1000), LFDNoise3.kr(0.2).range(0.001, 2));
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.5).range(0.1, 0.5), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.125).range(0.1, 3.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn2b=Synth(\hn2b)

////6
//c
(
SynthDef(\hn2c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=PinkNoise.ar(0.25);
	filt=RLPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.01, 10)).range(1000, 200), LFDNoise3.kr(4.7).range(0.001, 2))+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.1, 4)).range(150, 200), LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.001, 2.0), 0.125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 0.5), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.5).range(0.0, 1.75), vol, LFDNoise3.kr(0.15).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 1.0), LFDNoise3.kr(0.125).range(0.1, 40.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn2c=Synth(\hn2c)

//highnoise 3
/////7
//a
(
SynthDef(\hn3a, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
			filt=RHPF.ar(sig, LFDNoise3.kr(0.25).range(4000, 13000), LFDNoise3.kr(0.25).range(0.01, 2) );
			rev=FreeVerb.ar(filt, 0.5, 0.2);
		pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(1.25).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.1), LFDNoise3.kr(0.125).range(0.1, 0.3)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn3a=Synth(\hn3a)

///////8
//b
(
SynthDef(\hn3b, {|vol=0.2|
	var  sig, rev, env, filt, pan, out;
	sig=BrownNoise.ar(0.5);
	filt=RHPF.ar(sig, LFDNoise3.kr(0.25).range(8000, 200), LFDNoise3.kr(0.25).range(0.01, 1) );
			rev=FreeVerb.ar(filt, 0.2, 0.2);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.1), LFDNoise3.kr(0.125).range(0.1, 1.3)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn3b=Synth(\hn3b)

///////9
//c
(
SynthDef(\hn3c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
	filt=RLPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.1).range(0.01, 1)).range(1000, 500), LFDNoise3.kr(0.1).range(0.001, 1) )+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.0125).range(0.1, 1)).range(150, 200), LFDNoise3.kr(0.125).range(0.001, 0.02), LFDNoise3.kr(0.15).range(0.001, 0.02), 0.15);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 0.5), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.1).range(0.0, 1.75), vol, LFDNoise3.kr(0.2).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 4.0), LFDNoise3.kr(0.125).range(1.0, 4.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn3b=Synth(\hn3b)

///////10
//highnoise 4
//a
(
SynthDef(\hn4a, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.125);
		filt=RHPF.ar(sig,  LFDNoise3.kr(0.027).range(3000, 4000), 0.1);
			rev=FreeVerb.ar(filt, 0.7, 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(1.5).range(0.001, 1.0), LFDNoise3.kr(0.125).range(0.5, 2.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn4a=Synth(\hn4a)

///////11
//b
(
SynthDef(\hn4b, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=PinkNoise.ar(0.5);
	filt=RHPF.ar(sig, LFDNoise3.kr(0.25).range(10000, 300), LFDNoise3.kr(0.25).range(0.01, 2) );
	rev=FreeVerb.ar(filt, LFDNoise3.kr(0.5).range(0.1, 1.0), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(1.5).range(0.001, 1.0), LFDNoise3.kr(0.125).range(0.5, 5.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn4b=Synth(\hn4b)

///////12
//c
(
SynthDef(\hn4c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
	filt=RLPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.125).range(0.01, 1)).range(1000, 500), LFDNoise3.kr(0.1).range(0.001, 2) )+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.1, 1.0)).range(120, 220), LFDNoise3.kr(0.015).range(0.001, 2.0), LFDNoise3.kr(0.15).range(0.001, 2.0), 0.05);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.0125).range(0.1, 0.5), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.025).range(0.0, 1.75), vol, LFDNoise3.kr(0.025).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.1, 20.0)), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn4c=Synth(\hn4c)

//////////13
//highnoise 5
//a
(
SynthDef(\hn5a, {|vol=0.25, atk=0.01, rel=0.2|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
		filt=HPF.ar(sig, LFDNoise3.kr(2.5).range(2000, 8000));
			rev=FreeVerb.ar(filt, LFDNoise3.kr(2.5).range(0.1, 1.0), 1);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	           env=EnvGen.ar(Env.perc(atk, rel), doneAction:2);
	out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn5a=Synth(\hn5a)

//14
//b
(
SynthDef(\hn5b, {|vol=0.25, freq=2000,  atk=0.47, rel=4.7, mix=0.2|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
	filt=HPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.5).range(0.5, 20)).range(8000, 800));
			rev=FreeVerb.ar(filt, LFDNoise3.kr(2.5).range(0.1, 1.0), 1);
	             pan=PanAz.ar(8, rev, LFDNoise3.kr(0.5).range(0.0, 1.75), vol, LFDNoise3.kr(0.5).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 20.0), LFDNoise3.kr(0.5).range(0.1, 20.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);
//~hn5b=Synth(\hn5b)

//15
//c
(
SynthDef(\hn5c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
		filt=HPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.125).range(0.5, 20)).range(8000, 800))+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(1).range(0.1, 2.0)).range(500, 2000), LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.001, 2.0), 0.0125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.1, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 5.0), LFDNoise3.kr(0.5).range(0.1, 50.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn5c=Synth(\hn5c)

//16
//highnoise 6
//a
(
SynthDef(\hn6a, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=PinkNoise.ar(0.5);
		filt=HPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.125).range(0.5, 20)).range(4000, 7000))+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.1).range(0.1, 2.0)).range(50, 200), LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.001, 2.0), 0.125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.1, 1.0), 1);
	           pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.2), LFDNoise3.kr(0.5).range(0.01, 0.6)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn6a=Synth(\hn6a)

////17
//b
(
SynthDef(\hn6b, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
          filt=HPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.5, 2)).range(1000, 200))+Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.1).range(0.1, 1.0)).range(50, 100), LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.001, 2.0), 0.25);
	rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.1, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.1), LFDNoise3.kr(0.5).range(0.01, 1.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn6b=Synth(\hn6b)

////18
//c
(
SynthDef(\hn6c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.5);
		filt=Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(1.5).range(0.1, 50.0)).range(80, 180), LFDNoise3.kr(0.5).range(0.001, 6.0), LFDNoise3.kr(0.5).range(0.001, 5.0), 0.125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.1, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.1).range(0.0, 1.75), vol, LFDNoise3.kr(0.2).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 20.0), LFDNoise3.kr(0.5).range(0.01, 60.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn6c=Synth(\hn6c)

//19
//highnoise 7
//a
(
SynthDef(\hn7a, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
	filt=RHPF.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.1, 6)).range(200, 300), LFDNoise3.kr(1).range(0.001, 0.2));
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.5, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.2), LFDNoise3.kr(0.5).range(0.01, 0.3)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn7a=Synth(\hn7a)

//20
//b wild is the wind
(
SynthDef(\hn7b, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
	filt=RHPF.ar(sig, LFDNoise3.kr(2.5).range(200, 500), LFDNoise3.kr(2).range(0.001, 0.2));
			rev=FreeVerb.ar(filt, 0.5, 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.5).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 5.0), LFDNoise3.kr(0.5).range(0.01, 5.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn7b=Synth(\hn7b)

//21
//c
(
SynthDef(\hn7c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=BrownNoise.ar(0.25);
filt=RHPF.ar(sig, LFDNoise3.kr(1.5).range(200, 1500), LFDNoise3.kr(0.2).range(0.001, 0.2));
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.3).range(0.1, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 5.0), LFDNoise3.kr(0.5).range(0.01, 35.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn7b=Synth(\hn7b)

////22
//highnoise 8
//a
(
SynthDef(\hn8a, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.1);
	filt=RHPF.ar(sig, LFDNoise3.kr(0.25).range(5000, 5500), LFDNoise3.kr(0.1).range(0.001, 0.01));
			rev=FreeVerb.ar(filt, 0.5, 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.1).range(0.0, 0.02), LFDNoise3.kr(0.1).range(0.01, 0.1)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~hn8a=Synth(\hn8a)

//23
//b
(
SynthDef(\hn8b, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.1);
		filt=Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(0.25).range(0.1, 50.0)).range(400, 100), LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.001, 8.0), 0.125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.1, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.4).range(0.0, 1.75), vol, LFDNoise3.kr(0.3).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 20.0), LFDNoise3.kr(0.5).range(0.01, 60.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn8b=Synth(\hn8b)

//24
//c
(
SynthDef(\hn8c, {|vol=0.25|
	var  sig, rev, filt, env, pan, out;
	sig=WhiteNoise.ar(0.25);
		filt=Formlet.ar(sig, LFDNoise3.kr(LFDNoise3.kr(2).range(0.1, 20.0)).range(80, 180), LFDNoise3.kr(0.5).range(0.001, 10.0), LFDNoise3.kr(0.5).range(0.001, 10.0), 0.125);
			rev=FreeVerb.ar(filt, LFDNoise3.kr(0.15).range(0.1, 1.0), 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 30.0), LFDNoise3.kr(0.5).range(0.01, 80.0)), doneAction:2);
	               out=pan*env;
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~hn8c=Synth(\hn8c)

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//25
//drums
////pulsating
//a
(
SynthDef(\d1a, {| vol=0.25,  f1=138.59, f2=69.30, mix=0.2|
	var  sig, rev, filt, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 200);
			rev=FreeVerb.ar(filt, mix, 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 1.0), LFDNoise3.kr(1).range(0.01, 2.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~d1a=Synth(\d1a)

//26
//b
(
SynthDef(\d1b, {| vol=0.25,  f1=117.5, f2=235|
	var  sig, rev, filt, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 200);
			rev=FreeVerb.ar(filt, 0.2, 1);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.6).range(0.0, 1.75), vol, LFDNoise3.kr(0.3).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 1.0), LFDNoise3.kr(1).range(0.01, 3.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~d1b=Synth(\d1b)

//27
////drum 1
//a
(
SynthDef(\d2a, {|vol=0.25, f1=70, f2=140|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=RLPF.ar(sig, 100, LFDNoise3.kr(0.5).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.4, 0.2);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 1.0), LFDNoise3.kr(1).range(0.01, 3.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~d2a=Synth(\d2a)

//28
//b
(
SynthDef(\d2b, {|vol=0.1, f1=235, f2=470|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=RLPF.ar(sig, 270, 0.1, 0.3);
			rev=FreeVerb.ar(filt, 0.4, 0.2);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.5).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 5.0), LFDNoise3.kr(1).range(0.01, 5.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~d2b=Synth(\d2b)

//29
////low drum call
//a
(
SynthDef(\d3a, {| vol=0.25, f1=30, f2=70|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 150);
			rev=FreeVerb.ar(filt, 0.4, 0.2);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.2).range(0.0, 1.75), vol, LFDNoise3.kr(0.7).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 15.0), LFDNoise3.kr(1).range(0.01, 125.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~d3a=Synth(\d3a)

//30
//b
(
SynthDef(\d3b, {| vol=0.25, f1=30, f2=70|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 150);
			rev=FreeVerb.ar(filt, 0.5, 0.2);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.2)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d3b=Synth(\d3b)

//31
////high drum
//a
(
SynthDef(\d4a, {| vol=0.25, f1=100, f2=150|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=RLPF.ar(sig, 800,LFDNoise3.kr(0.5).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.4, 0.6);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.2)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d4a=Synth(\d4a)

//32
//b
(
SynthDef(\d4b, {| vol=0.25, f1=235, f2=117.5|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=RLPF.ar(sig, 100, LFDNoise3.kr(0.5).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.4, 0.6);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 30), LFDNoise3.kr(1).range(0.01, 100)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d4b=Synth(\d4b)

//33
/////////////////////////////////////////////////////////////////////// BASE DRUMS
////low drum 1
//a
(
SynthDef(\d5a, {|vol=0.25, f1=47, f2=94|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=RLPF.ar(sig, 650, LFDNoise3.kr(1).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.01, 0.5);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.2)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d5a=Synth(\d5a)

//34
//b
(
SynthDef(\d5b, {|vol=0.2, f1=47, f2=94|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]*LFDNoise3.kr(0.17).range(1, 1.47)));
		filt=RLPF.ar(sig, 470/2, LFDNoise3.kr(1).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.01, 0.5);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.5).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 30.0), LFDNoise3.kr(1).range(0.01, 80.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d5b=Synth(\d5b)

//35
////low drum 2
//a
(
SynthDef(\d6a, {|vol=0.25, f1=20, f2=37|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 650);
			rev=FreeVerb.ar(filt, 0.2, 0.5);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.5).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 17.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d6a=Synth(\d6a)

//36
//b
(
SynthDef(\d6b, {|vol=0.25, f1=35, f2=47|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 470);
			rev=FreeVerb.ar(filt, 0.2, 0.5);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 17.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d6b=Synth(\d6b)

////37
////low drum 3
//a
(
SynthDef(\d7a, {|vol=0.25, f1=60, f2=90|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]));
		filt=LPF.ar(sig, 200);
			rev=FreeVerb.ar(filt, 0.4, 0.2);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.4).range(0.0, 1.75), vol, LFDNoise3.kr(0.8).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.5)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d7a=Synth(\d7a)

////38
//b
(
SynthDef(\d7b, {|vol=0.5, f1=60, f2=90|
	var  sig, rev, filt, env, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]*4*LFDNoise3.kr(0.43).range(0.235, 0.7)));
		filt=LPF.ar(sig, 300);
			rev=FreeVerb.ar(filt, 0.4, 0.2);
pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 20.0), LFDNoise3.kr(1).range(0.01, 90.5)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
);

//~d7b=Synth(\d7b)

/////39
/////////////////////////////////////////////////////////////////////////////SNARE
//snare 1
//a
(
SynthDef(\s1a, {| vol=0.25, freq=470, rq=0.1, atk=0.01, rel=0.1|
	var  sig, filt, pan, out;
	sig=WhiteNoise.ar(0.9);
	filt=RLPF.ar(sig, freq, rq).distort*LFDNoise3.kr(0.047).range(0, 4);
pan=PanAz.ar(8, filt, LFDNoise3.kr(0.6).range(0.0, 1.75), vol, LFDNoise3.kr(0.6).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~s1a=Synth(\s1a)

///40
//b
(
SynthDef(\s1b, {| vol=0.25, freq=235,  atk=0.01, rel=0.1|
	var  sig, filt, pan, out;
	sig=WhiteNoise.ar(0.9);
		filt=RLPF.ar(sig, LFDNoise3.kr(0.125).range(1000, 200), LFDNoise3.kr(4.7).range(0.001, 2)).distort*2;
pan=PanAz.ar(8, filt, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~s1b=Synth(\s1b)

///41
/////////////////////////////////////////////////////////////////////////////KICK
//a
(
SynthDef(\kicka, {| vol=0.25, f1=47, f2=60, dist=6, cut=230, atk=0.01, rel=0.1|
	var  sig, filt, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]).distort*dist);
		filt=LPF.ar(sig, 600, 1);
pan=PanAz.ar(8, filt, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~kicka=Synth(\kicka)

///42
//b

(
SynthDef(\kickb, {| vol=0.25, f1=47, f2=60, dist=4 atk=0.01, rel=0.5|
	var  sig, filt, pan, out;
	sig=Mix.new(VarSaw.ar([f1, f2]).distort*dist);
		filt=LPF.ar(sig, 800, 1);
pan=PanAz.ar(8, filt, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~kickb=Synth(\kickb)

///////////43
//robomelody
//a
/////careful with the volume (DynKlank is delicate), don't exceed the suggested vol!
(
SynthDef(\robo1a, {|vol=0.02|
	var  sig, rev, dklank, env, pan, out;
	sig=BrownNoise.ar(0.3);
		dklank=Limiter.ar(DynKlank.ar(`[[TRand.kr(180, 90, Dust.ar(0.7)),TRand.kr(1000, 2000, Dust.ar(10)), TRand.kr(2000, 3000, Dust.ar(20)), TRand.kr(3000, 5000, Dust.ar(10))], [Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220)], [0.5, 0.5, 0.5, 0.5]], sig), 0.8, 0.00007);
			rev=FreeVerb.ar(dklank, 0.1, 0.2);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.linen(0.01, 0.2, 0.1), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~rma=Synth(\robo1a)

///////////44
//b
/////careful with the volume (DynKlank is delicate), don't exceed the suggested vol!
(
SynthDef(\robo1b, {|vol=0.02|
	var  sig, rev, dklank, env, pan, out;
	sig=BrownNoise.ar(0.3);
		dklank=Limiter.ar(DynKlank.ar(`[[TRand.kr(100, 300, Dust.ar(0.9)),TRand.kr(235, 5000, Dust.ar(0.6)), TRand.kr(2000, 3000, Dust.ar(20)), TRand.kr(3000, 5000, Dust.ar(10))], [Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220)], [0.5, 0.5, 0.5, 0.5]], sig), 0.8, 0.00007);
			rev=FreeVerb.ar(dklank, 0.1, 0.2);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.5).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.linen(LFDNoise3.kr(0.5).range(0.001, 20), 0.2, LFDNoise3.kr(1).range(2, 125.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~rmb=Synth(\robo1b)

///////////45
//c
/////careful with the volume (DynKlank is delicate), don't exceed the suggested vol!
(
SynthDef(\robo1c, {|vol=0.02|
	var  sig, rev, dklank, env, pan, out;
	sig=BrownNoise.ar(0.3);
		dklank=Limiter.ar(DynKlank.ar(`[[TRand.kr(100, 520, Dust.ar(3)),TRand.kr(300, 600, Dust.ar(5)), TRand.kr(100, 1000, Dust.ar(0.5)), TRand.kr(3000, 5000, Dust.ar(10))], [Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220), Line.kr(0.3, 0.000, 220)], [0.5, 0.5, 0.5, 0.5]], sig), 0.8, 0.00007);
			rev=FreeVerb.ar(dklank, 0.1, 0.2);
	pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0), 0.5);
	out=pan*EnvGen.ar(Env.linen(LFDNoise3.kr(0.5).range(0.001, 20), 0.2, LFDNoise3.kr(1).range(2, 85.0)), doneAction:2);
		Out.ar(ParaSerLibres.mainBus, out);
}).add
		);

//~rmc=Synth(\robo1c)

);

///3
///////////////////////////////////////////////////////////////////PDEFS
(

///hn1
Pdef(\uno, Pbind(\instrument, \hn1a, \dur, Prand([0.25, 0.136, 1, 20, 5, 0.25, 0.125, 47, 7, 8, 20, 0.5, 0.5, 0.5, 120, 0.125, 1, 1, 1, 1, 0.5, 0.5, 0.5, 0.25, 0.125, 0.5, 0.125, 7, 30, 23, 16, 17, 1, 0.125, 0.125, 0.125, 0.5, 0.5, 170, 200, 0.125, 0.25, 0.25, 0.25, 300, 1, 2, 3, 4, 5, 10, 025, 0.25, 0.40], inf), \vol, Prand([0.1, 0, 0.01, 0, 0.3, 0.2, 0.4, 0.6, 1, 0.5, 0.7, 0.5, 0.5, 0.5, 0.5], inf))).play;

Pdef(\dos, Pbind(\instrument, \hn1b, \dur, Prand([0.5, 1, 20, 47, 100, 7, 9, 1, 3, 0.2, 0.5, 0.7, 5, 7, 2, 40, 120, 0.2, 47, 22, 70, 30, 300, 1, 2, 0.5, 0.7, 10, 3, 4.5, 0.25], inf), \vol, Prand([0.1, 0, 0.01, 0.04, 0.05, 0.1, 0.25, 0.15, 0.2, 0.26, 0.18, 0.1, 0.3], inf))).play;

Pdef(\tres, Pbind(\instrument, \hn1c, \dur, Prand([300, 120, 40, 25, 3.5, 17, 30.0, 7, 0.15, 0.25, 20, 0.136, 0.657, 7, 5, 10, 30, 44, 3], inf), \vol, Prand([0.0, 0.14, 0.2, 0.07, 0.3, 0.1, 0.2, 0.01, 0.08, 0.16, 0.05, 0.2, 0.1, 0.2], inf))).play;

////hn2
Pdef(\cuatro, Pbind(\instrument, \hn2a, \dur, Prand([0.5, 4, 20, 10, 200, 0.345, 17, 40, 1, 1, 2, 2, 5, 7, 9, 25, 32, 60, 3, 2, 40, 1.125, 100, 240], inf), \vol, Prand([0.1, 0.12, 0.2, 0.2, 0.17, 0.05, 0.1, 0.2, 0.001, 0.02, 0.07], inf))).play;

Pdef(\cinco, Pbind(\instrument, \hn2b, \dur, Prand([0.5, 0.345, 40, 42, 37, 10, 0.035, 1, 1, 2, 2, 5, 200, 40, 0.125, 3, 18, 2, 40, 0.01, 0.125, 10, 20, 2, 1, 1, 1.5, 170, 280, 5, 7], inf), \vol, Prand([0.01, 0.13, 0.1, 0.2, 0.01, 1, 0.25, 0.1, 0.16, 0.24, 0.01, 0.002, 0.05], inf))).play;

Pdef(\seis, Pbind(\instrument, \hn2c, \dur, Prand([0.5, 0.345, 4, 7, 10, 15, 3, 180, 50, 100, 10, 8, 4, 24, 12, 120, 60, 9, 22, 11, 7, 4, 40,  200], inf), \vol, Prand([0.0, 0.1, 0.25, 0.23, 0.05, 0.5, 0.5, 0.01, 0.02, 0.23, 0.18], inf))).play;

////hn3
Pdef(\siete, Pbind(\instrument, \hn3a, \dur, Prand([0.25, 0.54, 0.63, 1.2, 4, 7, 10, 20, 7, 8, 11, 30, 28, 9, 12, 0.25, 0.25, 0.25, 0.25, 47, 184, 300, 3, 5, 2, 0.25, 0.125, 0.125, 0.125, 0.125, 0.25, 0.25, 0.25, 50, 65, 22, 0.25, 0.25, 0.0125, 0.0125, 0.5, 0.5, 0.125, 0.125, 100]/10, inf),  \vol, Prand([0.01, 0.25, 0.01, 0.05, 0.01, 0.02, 0.03, 0.1, 0.2, 0, 0.25, 0.23, 0.24,  0.1, 0.15, 0.05, 0.12, 0.18], inf))).play;

Pdef(\ocho, Pbind(\instrument, \hn3b, \dur, Prand([0.25, 0.54, 0.63, 1.2, 3, 20, 50, 180, 50, 0.125, 120, 300, 0.150, 2, 4, 30, 240, 400, 100, 27, 0.5, 0.125, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5], inf), \vol, Prand([0.01, 0.05, 0.1, 0.05, 0.1, 0.15, 0.12, 0.13, 0.04, 0.15, 0.2, 0.25, 0.1, 0.2, 0.16, 0, 0.14, 0.18], inf))).play;

Pdef(\nueve, Pbind(\instrument, \hn3c, \dur, Prand([0.25, 0.54, 0.63, 1.2, 4, 0.125, 0.25, 0.25, 0.125, 0.0125, 120, 30, 10, 4, 3, 1, 10, 1, 1, 0.5, 0.5, 0.5, 7, 240, 30, 10, 2, 6, 2, 3, 240, 500], inf), \vol, Prand([0.1, 0.2, 0.13, 0.14, 0.15, 0.25, 0.11, 0.01, 0.09, 0.02, 0.005, 0.05], inf))).play;

////hn4
Pdef(\diez, Pbind(\instrument, \hn4a, \dur, Prand([0.25, 0.54, 0.63, 47, 1.2, 20, 10, 12, 300, 22, 1, 1, 0.5, 0.25, 3, 0.125, 120, 500, 1, 2, 0.5, 0.5, 0.25, 0.125, 3, 5, 2, 2, 1, 7, 12, 24, 7.4, 40], inf), \vol, Prand([0.1, 0.25, 0.1, 0.15, 0.1, 0.2, 0.13, 0.14, 0.01, 0.05, 0.17, 0.23], inf))).play;

Pdef(\once, Pbind(\instrument, \hn4b, \dur, Prand([0.25, 0.54, 0.63, 3 , 1.2, 20, 10, 12, 100, 22, 1, 1, 0.5, 0.25, 3, 0.125, 0.0125, 240, 0.0125, 0.125, 0.25, 0.5, 1, 1, 2, 4, 7, 40, 60, 240, 400], inf), \vol, Prand([0.1, 0.25, 0.1, 0.15, 0.1, 0.2, 0.13, 0.14, 0.01, 0.16], inf))).play;

Pdef(\doce, Pbind(\instrument, \hn4c, \dur, Prand([25, 24, 63, 3 , 1.2, 20, 10, 12, 100, 22, 1, 5, 0.5, 0.25, 3, 8, 10, 12, 24, 32, 65, 120, 300, 18, 40, 0.25, 0.5, 1, 1, 2, 4, 7], inf), \vol, Prand([0.1, 0.25, 0.1, 0.15, 0.1, 0.2, 0.13, 0.14, 0.001, 0.05, 0.06], inf))).play;

////hn5
Pdef(\trece, Pbind(\instrument, \hn5a, \dur, Prand([0.25, 0.125, 0.125, 0.125, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.54, 0.63, 3 , 1.2, 20, 10, 12, 100, 22, 1, 1, 0.5, 0.25, 3, 3, 5, 10, 12, 24, 0.125, 0.125, 0.126, 0.127, 0.124, 0.1, 0.2, 0.3, 0.25, 0.25, 0.4, 32, 18, 40, 0.25, 0.5, 1, 1, 2, 4, 7, 50, 30, 40, 60, 180, 300, 600], inf), \vol, Prand([0.1, 0.15, 0.1, 0.25, 0.1, 0.2, 0.13, 0.14, 0.05, 0.09], inf))).play;

Pdef(\catorce, Pbind(\instrument, \hn5b, \dur, Prand([0.5, 0.5, 0.5, 0.25, 0.25, 0.125, 1, 2, 3 , 1.2, 20, 10, 12, 100, 22, 1, 10, 25, 3, 3, 5, 10, 12, 24,  32, 18, 40, 5, 8, 10, 240, 120, 1, 1, 2, 4, 7, 50, 30, 40, 300, 600], inf), \vol, Prand([0.1, 0.2, 0.1, 0.15, 0.1, 0.18, 0.13, 0.14, 0.01, 0.05, 0.12], inf))).play;

Pdef(\quince, Pbind(\instrument, \hn5c, \dur, Prand([ 12, 20, 10, 25, 100, 22, 10, 10, 25, 13, 6, 9, 8, 10, 11, 24,  32, 18, 5, 8, 10, 240, 120, 1, 2, 4, 7, 50, 30, 80, 120, 180, 20, 100, 40, 300, 600], inf), \vol, Prand([0.1, 0.25, 0.1, 0.15, 0.1, 0.2, 0.13, 0.14, 0, 0.01, 0.05], inf))).play;

////hn6
Pdef(\dieciseis, Pbind(\instrument, \hn6a, \dur, Prand([ 0.125, 0.125, 0.25, 0.25, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 2, 2, 2, 2, 3, 4, 5, 10, 12, 24, 38, 46, 64, 120, 240], inf), \vol, Prand([0.1, 0.15, 0.12, 0.25, 0.14, 0.2, 0.13, 0.04, 0, 0.005, 0.05], inf))).play;

Pdef(\diecisiete, Pbind(\instrument, \hn6b, \dur, Prand([ 0.125, 0.125, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 2, 2, 2, 2, 3, 4, 5, 10, 12, 24, 38, 46, 64, 120, 240], inf), \vol, Prand([0.1, 0.25, 0.1, 0.25, 0.1, 0.2, 0.23, 0.24, 0], inf))).play;

Pdef(\dieciocho, Pbind(\instrument, \hn6c, \dur, Prand([ 1, 5, 6, 10, 12, 18, 24, 32, 40, 68, 120, 360, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.25, 0.14, 0.2, 0.23, 0.15, 0, 0.005, 0.02, 0.05, 0.14, 0.09], inf))).play;

////h7
Pdef(\diecinueve, Pbind(\instrument, \hn7a, \dur, Prand([0.0125, 0.125, 0.125, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2 ,2 ,2, 3, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 8, 10, 10, 10, 20, 20, 20, 30, 40, 60, 120, 240, 320, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.15, 0.14, 0.2, 0.23, 0.15, 0, 0.17, 0.005, 0.05, 0.09], inf))).play;

Pdef(\veinte, Pbind(\instrument, \hn7b, \dur, Prand([ 1, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 120, 360, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.15, 0.14, 0.2, 0.23, 0.15, 0, 0.05, 0.09, 0.11], inf))).play;

Pdef(\ventiuno, Pbind(\instrument, \hn7c, \dur, Prand([ 1, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 120, 360, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.2, 0.14, 0.2, 0.23, 0.15, 0, 0.005, 0.05, 0.09], inf))).play;

////h8
Pdef(\ventidos, Pbind(\instrument, \hn8a, \dur, Prand([ 0.001, 0.001, 0.001, 0.01, 0.01, 0.01, 0.1, 0.1, 0.1, 0.125, 0.125, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 8, 8, 8, 8, 8, 12, 12, 12, 24, 24, 28, 28, 32, 64, 120, 240, 480, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.25, 0.14, 0.2, 0.23, 0.15, 0.01, 0.05, 0.09, 1, 0], inf))).play;

Pdef(\ventitres, Pbind(\instrument, \hn8b, \dur, Prand([ 1, 5, 6, 10, 12, 15, 18, 24, 32, 40, 45, 50, 68, 120, 360, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.15, 0.24, 0.2, 0.23, 0.18, 0, 0.05, 0.09, 0.11], inf))).play;

Pdef(\venticuatro, Pbind(\instrument, \hn8c, \dur, Prand([ 1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf), \vol, Prand([0.1, 0.25, 0.13, 0.25, 0.24, 0.2, 0.23, 0.25, 0, 0.05, 0.09, 0.1, 0.2], inf))).play;

////d1
Pdef(\venticinco, Pbind(\instrument, \d1a, \dur, Prand([ 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

Pdef(\ventiseis, Pbind(\instrument, \d1b, \dur, Prand([ 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

////d2
Pdef(\ventisiete, Pbind(\instrument, \d2a, \dur, Prand([ 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 70, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 70, 140, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

Pdef(\ventiocho, Pbind(\instrument, \d2b, \dur, Prand([ 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 70, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*3/4,  inf), \f2, Prand([146.8, 73.4, 70, 140, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*3/4,  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

////d3
Pdef(\ventinueve, Pbind(\instrument, \d3a, \dur, Prand([ 0.5, 0.5, 1 ,1, 2, 2, 4, 5, 5,  3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 70, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*4/3,  inf), \f2, Prand([146.8, 73.4, 70, 140, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*4/3,  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

Pdef(\treinta, Pbind(\instrument, \d3b, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

////d4
Pdef(\trentayuno, Pbind(\instrument, \d4a, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*2,  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

Pdef(\treintaydos, Pbind(\instrument, \d4b, \dur, Prand([ 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 1, 2, 5, 6, 10, 20, 30, 60, 55, 47, 52, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

////d5
Pdef(\treintaytres, Pbind(\instrument, \d5a, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600]*4/3, inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*4/3,  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;


Pdef(\treintaycuatro, Pbind(\instrument, \d5b, \dur, Prand([ 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.15, 0.2, 0.12, 0.2, 0.13, 0, 0.05, 0.09, 0.2, 0.11], inf))).play;

////d6
Pdef(\treintaycinco, Pbind(\instrument, \d6a, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11, 0.15], inf))).play;


Pdef(\treintayseis, Pbind(\instrument, \d6b,  \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.25, 0.2, 0.12, 0.23, 0.13, 0, 0.05, 0.09, 0.2, 0.11, 0.15], inf))).play;

////d7
Pdef(\treintaysiete, Pbind(\instrument, \d7a, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600]*3/4, inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*3/4,  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.2, 0.3, 0.5], inf))).play;

Pdef(\teintayocho, Pbind(\instrument, \d7b, \dur, Prand([ 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600], inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.1, 0.2, 0.13, 0.5, 0.2, 0.12, 0.3, 0.13, 0.4, 0.05, 0.09, 0.2, 0.11, 0.25, 0.4, 0.55], inf))).play;


////snare
Pdef(\treintaynueve, Pbind(\instrument, \s1a,  \dur, Prand([0.25, 0.54, 0.63, 1.2, 4, 7, 10, 20, 7, 8, 11, 30, 28, 9, 12, 0.25, 0.25, 0.25, 0.25, 47, 184, 300, 3, 5, 2, 0.25, 0.125, 0.125, 0.125, 0.125, 0.25, 0.25, 0.25, 50, 65, 22, 0.25, 0.25, 0.0125, 0.0125, 0.5, 0.5, 0.125, 0.125, 100]/10, inf),  \vol, Prand([0.1, 0.25, 0.1, 0.05, 0.1, 0.02, 0.03, 0.1, 0.2, 0, 0.25, 0.23, 0.24,  0.1, 0.15, 0.5, 0.12, 0.18], inf))).play;


Pdef(\cuarenta, Pbind(\instrument, \s1b, \dur, Prand([0.25, 0.54, 0.63, 1.2, 4, 7, 10, 20, 7, 8, 11, 30, 28, 9, 12, 0.25, 0.25, 0.25, 0.25, 47, 184, 300, 3, 5, 2, 0.25, 0.125, 0.125, 0.125, 0.125, 0.25, 0.25, 0.25, 50, 65, 22, 0.25, 0.25, 0.0125, 0.0125, 0.5, 0.5, 0.125, 0.125, 100]/10, inf),  \vol, Prand([0.1, 0.25, 0.1, 0.05, 0.1, 0.02, 0.03, 0.1, 0.2, 0, 0.25, 0.23, 0.24,  0.1, 0.15, 0.5, 0.12, 0.18], inf))).play;

////kick
Pdef(\cuarentayuno, Pbind(\instrument, \kicka, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600]*3/4, inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*3/4,  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.2, 0.3, 0.5], inf))).play;

Pdef(\cuarentaydos, Pbind(\instrument, \kickb, \dur, Prand([0.0125, 0.0125, 0.0125, 0.2, 0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 3, 3, 3,  0.25, 0.25, 0.25, 0.25, 0.25, 0.125, 0.0125, 0.5, 0.5, 0.5, 0.5, 0.3, 0.4, 0.1, 0.4, 0.6, 0.2, 0.6 ,1, 2, 3, 4, 5, 6, 10, 12, 18, 24, 32, 40, 50, 68, 60, 80, 140, 400, 120, 360, 600]*3/4, inf),  \f1, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257]*3/4,  inf), \f2, Prand([146.8, 73.4, 73.4, 146.8, 73.42, 200, 150, 146.8, 73.42, 200, 150, 200, 144, 150, 257],  inf),\vol, Prand([0.2, 0.3, 0.25, 0.1], inf))).play;

////robo melody
Pdef(\cuarentaytres, Pbind(\instrument, \robo1a, \dur, Prand([0.25, 0.25, 0.125, 0.25, 0.15, 0.25, 0.136, 1, 20, 5, 0.25, 0.125, 47, 7, 8, 20, 0.5, 0.5, 0.5, 120, 0.125, 1, 1, 1, 1, 0.5, 0.5, 0.5, 0.25, 0.125, 0.5, 0.125, 7, 30, 23, 16, 17, 1, 0.125, 0.125, 0.125, 0.5, 0.5, 170, 200, 0.125, 0.25, 0.25, 0.25, 300, 1, 2, 3, 4, 5, 10, 025, 0.25, 0.40], inf), \vol, Prand([0.01, 0.01, 0.015, 0.02, 0.005, 0.01], inf))).play;

Pdef(\cuarentaycuatro, Pbind(\instrument, \robo1b, \dur, Prand([0.25, 0.25, 0.125, 0.25, 0.15, 0.25, 0.136, 1, 20, 5, 0.25, 0.125, 47, 7, 8, 20, 0.5, 0.5, 0.5, 120, 0.125, 1, 1, 1, 1, 0.5, 0.5, 0.5, 0.25, 0.125, 0.5, 0.125, 7, 30, 23, 16, 17, 1, 0.125, 0.125, 0.125, 0.5, 0.5, 170, 200, 0.125, 0.25, 0.25, 0.25, 300, 1, 2, 3, 4, 5, 10, 025, 0.25, 0.40], inf), \vol, Prand([0.01, 0.01, 0.015, 0.02, 0.005, 0.01], inf))).play;

Pdef(\cuarentaycinco, Pbind(\instrument, \robo1c, \dur, Prand([ 0.25, 0.136, 1, 20, 5, 0.25, 0.125, 47, 7, 80, 20, 0.5, 0.5, 0.5, 120, 200, 1, 1, 1, 400, 0.5, 0.5, 0.25, 0.125, 0.5,12, 70, 30, 23, 16, 17, 100, 0.125, 0.125, 0.125, 0.5, 0.5, 170, 200, 50, 60, 0.25, 0.25, 300, 1, 2, 3, 4, 5, 10, 025, 0.25, 600], inf), \vol, Prand([0.01, 0.01, 0.015, 0.02, 0.005, 0.01], inf))).play;

)












		