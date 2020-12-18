
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;


~bus1=Bus.audio(s,2);
~bus6=Bus.audio(s,2);



(
SynthDef(
	\peassaw5, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.001, 1.005, 2.01, 2.005, 2.005, 2.02]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 570*SinOsc.kr(0.8, -2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.5, 2.6, 1.7, -0),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2400);
	sig=HPF.ar(sig, 500);


		Out.ar(bus,Pan2.ar(sig3/250 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)


(
SynthDef(\peasdelaya, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
	var input, output, delrd, sig, deltimes;

	// Choose which sort of input you want by (un)commenting these lines:
	//input = Pan2.ar(PlayBuf.ar(2, b, loop: 0), -0.5); // buffer playback, panned halfway left
	//input = SoundIn.ar([0,1]); // TAKE CARE of feedback - use headphones
	//input = Dust2.ar([0.1, 0.01]); // Occasional clicks
    input=In.ar(bus);
	// Read our 4-channel delayed signals back from the feedback loop
	delrd = LocalIn.ar(4);

	// This will be our eventual output, which will also be recirculated
	output = input + delrd[[0,1]];

	// Cross-fertilise the four delay lines with each other:
	sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
	sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
	// Attenutate the delayed signals so they decay:
//	sig = sig * [0.6, 0.27, 0.233, 0.83];
	sig = sig * [0.33, 0.37, 0.25, 0.53];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.00005 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 6.4, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 1500);
	output=HPF.ar(output, 300);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)



(


	a=Routine({
	var delta;
	var freqvect=[
42, 49, 46, 42 , 49, 42, 46, 49, 42, 49, 46, 42 , 49, 42, 46, 49,
		42, 49, 46, 42 , 49, 42, 46, 49, 42, 49, 46, 42 , 49, 42, 46, 49,

37, 44, 41, 37, 44, 37, 41, 44,		 37, 44, 41, 37, 44, 37, 41, 44,
		37, 44, 41, 37, 44, 37, 41, 44,		 37, 44, 41, 37, 44, 37, 41, 44,

39, 46, 42, 39, 46, 39, 42, 46, 		39, 46, 42, 39, 46, 39, 42, 46,
		39, 46, 42, 39, 46, 39, 42, 46, 		39, 46, 42, 39, 46, 39, 42, 46,

34, 41, 37, 34, 41, 34, 37, 41,   34, 41, 37, 34, 41, 34, 37, 41,
		34, 41, 37, 34, 41, 34, 37, 41,   34, 41, 37, 34, 41, 34, 37, 41,

35, 42, 39, 35, 42, 35, 39, 42,   35, 42, 39, 35, 42, 35, 39, 42,
		35, 42, 39, 35, 42, 35, 39, 42,   35, 42, 39, 35, 42, 35, 39, 42,

30, 37, 34, 30, 37, 30, 34, 37,		30, 37, 34, 30, 37, 30, 34, 37,
		30, 37, 34, 30, 37, 30, 34, 37,		30, 37, 34, 30, 37, 30, 34, 37,

		34, 41, 37, 34, 41, 34, 37, 41,   34, 41, 37, 34, 41, 34, 37, 41,
		34, 41, 37, 34, 41, 34, 37, 41,   34, 41, 37, 34, 41, 34, 37, 41,

		35, 42, 39, 35, 42, 35, 39, 42,   35, 42, 39, 35, 42, 35, 39, 42,
		35, 42, 39, 35, 42, 35, 39, 42,   35, 42, 39, 35, 42, 35, 39, 42,

	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/16;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw5", [freq: freqvect[i], amp: 1 , bus: ~bus1.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			k6 = Synth.new( "peasdelaya", [bus: ~bus1.index]);
		} );

	//


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});


)
a.play;
a.stop;

s.record;


(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




       sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.001, 1.007, 1.01]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 370*SinOsc.kr(0.8, -2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 2.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 400);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*1.5 ,0));

}).add;
)



(
SynthDef(
	\peassaw7, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.001, 1.007, 1.01]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 170*SinOsc.kr(0.8, -2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 2.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 400);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*2 ,0));

}).add;
)


(


	b=Routine({
	var delta;
	var freqvect=[
1, 1, 1, 58, 1, 1, 56, 54 ,
		1, 1, 1, 58, 1, 1, 56, 54,
		1, 1, 1, 58, 1, 1, 56, 54 ,
		1, 1, 1, 58, 1, 1, 56, 54 ,

	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;




(


	c=Routine({
	var delta;
	var freqvect=[
54, 54, 54, 1, 1, 54, 1, 1,
		54, 54, 54, 1, 1, 54, 1, 1,

		51, 51, 51, 1, 1, 51, 1, 1,
		51, 51, 51, 1, 1, 51, 1, 1,


	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("peassaw7", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

		//	k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
c.play;
b.play;

c.stop;
b.stop;





(
SynthDef(
	\peassaw8, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.001, 1.005, 2.01, 2.005, 2.005, 2.02]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 570*SinOsc.kr(0.02, -2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.1, 5.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1800);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig/1 ,0));

}).add;
)

(


	e=Routine({
	var delta;
	var freqvect=[
        58, 1, 1, 1, 1, 1, 54, 1 ,
		56, 1, 1, 1, 1, 1, 61, 63,
		1, 1, 1, 58, 1, 1, 54, 1 ,
		51, 1, 1, 1, 1, 1, 63, 61 ,


		1, 1, 1, 54, 1, 1, 58, 1 ,
		54, 1, 1, 49, 1, 1, 65, 66,
		1, 1, 1, 65, 1, 1, 61, 1 ,
		63, 1, 1, 61, 1, 1, 59, 1 ,

	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw8", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
e.play;
e.stop;



(
SynthDef(
	\peasine, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(SinOsc.ar(((freq+24).midicps) * [1, 1.01, 1.005, 1.0075, 2.015, 2.005, 2.009, 2.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 770*SinOsc.kr(0.1, -2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.2, 4.6, 1.7, 0),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1400);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/300 ,0));
Out.ar(0,Pan2.ar(sig/1.3 ,-0.2));

}).add;
)

(


	g=Routine({
	var delta;
	var freqvect=[
		1, 49, 1, 44, 1, 46, 1,  41,
		1, 42, 1, 37, 1, 41,1,  42

	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peasine", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
g.play;
g.stop;





(
SynthDef(
	\peassaw9, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+24).midicps) * [1, 1.001, 1.005, 1.0075, 1.0088, 2.01, 2.007, 2.00085, 2.004, 2.009]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 1570*SinOsc.kr(1, -2.5, 1.95 ,2.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 3.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 4400);
	sig=HPF.ar(sig, 1750);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig/2 ,0.2));

}).add;
)

(


	f=Routine({
	var delta;
	var freqvect=[
       73, 73, 70, 73, 68, 1, 70, 73,
		66, 70, 66, 65, 66, 65, 61, 63,
        63, 65, 66, 70, 66, 65, 61, 58,
		65, 61, 65, 66, 66, 63, 66, 68
	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/2;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw9", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
f.play;
f.stop;




(
SynthDef(
	\peasine2, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(SinOsc.ar(((freq+24).midicps) * [1, 1.01, 1.005, 1.0075, 2.015, 2.005, 2.009, 2.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 770*SinOsc.kr(0.1, -2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 3.6, 1.7, 0),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1400);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/300 ,0));
Out.ar(0,Pan2.ar(sig/1.8 ,0.2));

}).add;
)

(


	h=Routine({
	var delta;
	var freqvect=[
		1/*49*/, 1, 1, 53, 54, 53, 49, 44,
		46, 1, 1,  49, 51, 49, 44,  46,
		42, 1, 1,  44, 46,  42, 37, 42,
		41, 1, 1,  42, 39, 41, 42, 1 //46

	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/2;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peasine2", [freq: freqvect[i], amp: 1 , osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
h.play;
h.stop;






(
SynthDef(
	\bass, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);



sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.01, 1.005, 0.999]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 100*SinOsc.kr(0.005, -1.7, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.2, 4.6, 7.7, 0),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 100);
	sig=HPF.ar(sig, 50);


		//Out.ar(bus,Pan2.ar(sig3*0.05 ,0));
Out.ar(0,Pan2.ar(sig/1.5 ,0));

}).add;
)



(


	z=Routine({
	var delta;
	var freqvect=[


42, 1, 37, 1, 39, 1, 34, 1,
		35, 1, 30,1,  34, 1,  35, 1






	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("bass", [freq: freqvect[i], amp: 1 , osc: [-2, -1.9, -1.8, -1.7, -1.6, -1.5 ].choose]);} );

		//Synth.new( "delaybass", [bus: ~bus1.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose]);


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
z.stop;


(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.744, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*1.244, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,-0.2));




}).add;
)

(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+3500)*SinOsc.kr(2, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.844, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,-0.2));




}).add;
)

(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+3000));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.78, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.844, pan));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)

(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+4000));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.28, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.344, 0));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.3));




}).add;
)


(

	m=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



1, 1, 1, 1,   2, 1, 1, 2,    1,2 ,1, 1,  2, 1, 1, 2,
1, 1, 1, 1,   2, 1, 1, 2,    1,2 ,2, 1,  2, 1, 1, 2,
1, 1, 1, 1,   2, 1, 1, 2,    1,2 ,1, 1,  2, 1, 1, 2,
1, 1, 1, 1,   2, 2, 1, 2,    1,2 ,1, 1,  2, 1, 1, 2

	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose, bus: ~bus6.index ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
m.stop;

(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

		var freqvect=[

2, 1, 2, 1,  1, 1, 2, 1,      1, 1, 2, 1,  1, 1, 2, 1,
2, 1, 2, 1,  1, 1, 2, 1,      1, 1, 1, 2,  1, 1, 2, 1,
2, 1, 2, 1,  1, 1, 2, 1,      1, 1, 2, 1,  1, 1, 2, 1,
2, 1, 2, 1,  1, 1, 2, 1,      2, 1, 2, 2,  1, 1, 2, 1,






	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq:[500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose, bus: ~bus6.index ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;
m.play;
o.play;
n.stop;
m.stop;
r.stop;




(

	o=Routine({
	var delta;
	var freq;

	var k23=0;

		var freqvect=[

1, 1, 2, 1






	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise3 , [freq:[500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose, bus: ~bus6.index ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
o.play;
o.stop;



(

	p=Routine({
	var delta;
	var freq;

	var k23=0;

		var freqvect=[

1, 1, 2, 1,
		1, 1, 2, 1,
		1, 1, 2, 1,
		1, 1, 2, 2






	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/8;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise2 , [freq:[500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose, bus: ~bus6.index ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
p.play;
p.stop;


(

	q=Routine({
	var delta;
	var freq;

	var k23=0;

		var freqvect=[

2, 2, 2, 2






	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise1 , [freq:[500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose, bus: ~bus6.index ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)

q.play;
p.play;
o.play;
m.play;
n.play;


q.stop;






(
SynthDef(
	\bass2, {|freq, amp, bus|
		var sig, sig2, sig3;



		//sig=Saw.ar(freq, amp);
		//sig=sig*EnvGen.kr(Env.perc(5, 5, 5, 1), doneAction: 2);
        //sig = sig+SinOsc.ar(freq/4*EnvGen.kr(Env.perc(0.1, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		//sig = sig+SinOsc.ar(freq/3*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		//sig = sig+SinOsc.ar(freq/2*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		 // sig = sig+SinOsc.ar(freq*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		//sig = sig+SinOsc.ar(freq*EnvGen.kr(Env.perc(0.01, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );

		sig2=BPF.ar(WhiteNoise.ar(1.8,0), 100)*EnvGen.kr(Env.perc(0.1, 0.75, 1.5, -8),   doneAction: 2);
		//sig=sig+sig2;
		sig=sig*EnvGen.kr(Env.perc(0.01, 0.25, 1.5, -8),   doneAction: 2);

	  sig=LPF.ar(sig, 500);
		sig=HPF.ar(sig, 30);
//	sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*0.788,0.2));


}).add;
)



(


	r=Routine({
	var delta;
	var freqvect=[


		 35,1, 1, 35,   1, 1, 35, 1,   1, 1,  35, 1,   35, 35, 1, 1,








	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{
      // k1.free;
		//k2.free;
		//k3.free;
		//k4.free;
		delta=1.8/8;
		freq=freqvect[i];

		//Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

		if (freqvect[i]==1,{ 0},{ Synth(\bass2 , [freq:35 , amp: a*2]   ); }) ;

		i= if( i>=(15), {0}, {i+1});

		 delta.yield;
	}


});
)
r.play;


r.stop;

p.stop;

o.stop;

q.stop;

m.stop;
n.stop;
r.stop;


a.stop;
b.stop;
c.stop;
e.stop;
f.stop;
g.stop;
h.stop;
z.stop;


s.stopRecording;