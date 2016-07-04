

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
	pan=PanAz.ar(8, rev, 0, vol, 2);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.05), LFDNoise3.kr(0.125).range(0.1, 2.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			 pan=Pan2.ar(rev, 0, vol);
		//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(0.1, LFDNoise3.kr(0.5).range(1, 15)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 10.0), LFDNoise3.kr(0.125).range(0.1, 40.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
		//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.25).range(0.1, 25.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.125).range(0.1, 3.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 1.0), LFDNoise3.kr(0.125).range(0.1, 40.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
		//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.1), LFDNoise3.kr(0.125).range(0.1, 0.3)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
		//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.1), LFDNoise3.kr(0.125).range(0.1, 1.3)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 4.0), LFDNoise3.kr(0.125).range(1.0, 4.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(1.5).range(0.001, 1.0), LFDNoise3.kr(0.125).range(0.5, 2.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			 pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.125).range(0.0, 1.75), vol, LFDNoise3.kr(0.125).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(1.5).range(0.001, 1.0), LFDNoise3.kr(0.125).range(0.5, 5.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 2.0), LFDNoise3.kr(0.5).range(0.1, 20.0)), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			 pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	           env=EnvGen.ar(Env.perc(atk, rel), doneAction:2);
	out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 20.0), LFDNoise3.kr(0.5).range(0.1, 20.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			 pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 5.0), LFDNoise3.kr(0.5).range(0.1, 50.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.2), LFDNoise3.kr(0.5).range(0.01, 0.6)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.1), LFDNoise3.kr(0.5).range(0.01, 1.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 20.0), LFDNoise3.kr(0.5).range(0.01, 60.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 0.2), LFDNoise3.kr(0.5).range(0.01, 0.3)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
				pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 5.0), LFDNoise3.kr(0.5).range(0.01, 5.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
				pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 5.0), LFDNoise3.kr(0.5).range(0.01, 35.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
	pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.1).range(0.0, 0.02), LFDNoise3.kr(0.1).range(0.01, 0.1)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 20.0), LFDNoise3.kr(0.5).range(0.01, 60.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
                env=EnvGen.ar(Env.perc(LFDNoise3.kr(0.5).range(0.001, 30.0), LFDNoise3.kr(0.5).range(0.01, 80.0)), doneAction:2);
	               out=pan*env;
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 1.0), LFDNoise3.kr(1).range(0.01, 2.0)), doneAction:2);
		Out.ar(0, out);
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
			pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 1.0), LFDNoise3.kr(1).range(0.01, 3.0)), doneAction:2);
		Out.ar(0, out);
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
			 pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 1.0), LFDNoise3.kr(1).range(0.01, 3.0)), doneAction:2);
		Out.ar(0, out);
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
			   pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 5.0), LFDNoise3.kr(1).range(0.01, 5.0)), doneAction:2);
		Out.ar(0, out);
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
			   pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 15.0), LFDNoise3.kr(1).range(0.01, 125.0)), doneAction:2);
		Out.ar(0, out);
}).add
		);

//~d3a=Synth(\d3a)

//30
//b
(
SynthDef(\d3b, {| vol=0.25, f1=30, f2=70|
	var  sig, rev, filt, env, pan, out;
	sig=VarSaw.ar([f1, f2]);
		filt=LPF.ar(sig, 150);
			rev=FreeVerb.ar(filt, 0.5, 0.2);
			 pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.2)), doneAction:2);
		Out.ar(0, out);
}).add
);

//~d3b=Synth(\d3b)

//31
////high drum
//a
(
SynthDef(\d4a, {| vol=0.25, f1=100, f2=150|
	var  sig, rev, filt, env, pan, out;
	sig=VarSaw.ar([f1, f2]);
		filt=RLPF.ar(sig, 800,LFDNoise3.kr(0.5).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.4, 0.6);
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.2)), doneAction:2);
		Out.ar(0, out);
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
			 pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 30), LFDNoise3.kr(1).range(0.01, 100)), doneAction:2);
		Out.ar(0, out);
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
	sig=VarSaw.ar([f1, f2]);
		filt=RLPF.ar(sig, 650, LFDNoise3.kr(1).range(0.001, 1));
			rev=FreeVerb.ar(filt, 0.01, 0.5);
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.2)), doneAction:2);
		Out.ar(0, out);
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
			  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 30.0), LFDNoise3.kr(1).range(0.01, 80.0)), doneAction:2);
		Out.ar(0, out);
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
			  	  pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 17.0)), doneAction:2);
		Out.ar(0, out);
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
			   pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 17.0)), doneAction:2);
		Out.ar(0, out);
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
			    pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 0.1), LFDNoise3.kr(1).range(0.01, 0.5)), doneAction:2);
		Out.ar(0, out);
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
			    pan=Pan2.ar(rev, 0, vol);
//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(LFDNoise3.kr(1).range(0.001, 20.0), LFDNoise3.kr(1).range(0.01, 90.5)), doneAction:2);
		Out.ar(0, out);
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
		pan=Pan2.ar(filt, 0, vol);
//pan=PanAz.ar(8, filt, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(0, out);
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
			  pan=Pan2.ar(filt, 0, vol);
//pan=PanAz.ar(8, filt, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(0, out);
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
			  pan=Pan2.ar(filt, 0, vol);
//pan=PanAz.ar(8, filt, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(0, out);
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
			 pan=Pan2.ar(filt, 0, vol);
//pan=PanAz.ar(8, filt, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.perc(atk, rel), doneAction:2);
		Out.ar(0, out);
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
			 pan=Splay.ar(rev, LFDNoise3.kr(0.02).range(0.1, 1.0), vol, LFDNoise3.kr(0.1).range(-1.0, 1.0));
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.linen(0.01, 0.2, 0.1), doneAction:2);
		Out.ar(0, out);
}).add
		);

//~rm=Synth(\robo1a)n

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
			 pan=Splay.ar(rev, LFDNoise3.kr(0.02).range(0.1, 1.0), vol, LFDNoise3.kr(0.1).range(-1.0, 1.0));
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.linen(LFDNoise3.kr(0.5).range(0.001, 20), 0.2, LFDNoise3.kr(1).range(2, 125.0)), doneAction:2);
		Out.ar(0, out);
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
			 pan=Splay.ar(rev, LFDNoise3.kr(0.02).range(0.1, 1.0), vol, LFDNoise3.kr(0.1).range(-1.0, 1.0));
	//pan=PanAz.ar(8, rev, LFDNoise3.kr(0.25).range(0.0, 1.75), vol, LFDNoise3.kr(0.25).range(1.0, 6.0));
	out=pan*EnvGen.ar(Env.linen(LFDNoise3.kr(0.5).range(0.001, 20), 0.2, LFDNoise3.kr(1).range(2, 85.0)), doneAction:2);
		Out.ar(0, out);
}).add
		);

//~rmc=Synth(\robo1c)

);













		