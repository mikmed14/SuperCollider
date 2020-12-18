
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;






(
SynthDef(
	\peassaw7, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1,  1.00701]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 270*SinOsc.kr(5, 0, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.1, 3.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 5800);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*8.5 ,0));

}).add;
)


(


	c=Routine({
	var delta;
	var freqvect=[


		75, 73, 1, 72, 73, 68, 1, 73,
		72, 68, 65, 72, 68, 1, 1, 72,

		75, 73, 1, 80, 77, 73,  1, 72,
		73, 72, 68, 72, 68, 1, 1, 72



	];



	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.8;
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


(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.009, 1.008, 2.001, 2.007, 2.003, 4.001, 4.007] , [0, 0, 0, 0, -2, -2, -2, -2] ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 570*SinOsc.kr(0.01, 2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.5, 2.5, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1000);
	sig=HPF.ar(sig, 250);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*1 ,0));

}).add;
)


(


	b=Routine({
	var delta;
	var freqvect=[


		66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70,
		66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70,

		66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70,
		66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70, 66, 70, 73, 70,


		68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72,
		68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72,

		68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72,
		68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72, 68, 72, 75, 72,



	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=3.2/32;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
s.record;
b.stop;


(
SynthDef(
	\abcsaw, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007, 2.001, 2.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (80.midicps)*SinOsc.kr(0.01, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 6, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1000);
	sig=HPF.ar(sig, 50);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)



(


	z=Routine({
	var delta;


	var freqvect4=[



		58, 1,  60,1,  61,1,  68,1,
		58, 1, 60,1,  61,1,  68,1,
		70, 1,  68, 1,  63, 1,  61, 1,
		60, 1,  1, 1,  1, 1,   61, 60









	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.4;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
b.play;
s.record;


z.stop;







(
SynthDef(
	\saw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 50*SinOsc.kr(0.4, osc, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 7.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 400);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3*2 ,0));
//Out.ar(0,Pan2.ar(sig/4 ,0));

}).add;
)


(
SynthDef(\delay4, {arg bus, d=0.00007;
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
	sig = sig * [0.42, 0.43, 0.47, 0.47];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [111, 153, 130, 177] * 0.00007*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2)- ControlDur.ir;
	//deltimes = [101, 153, 145, 187] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.001, 10.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 1200);
output=HPF.ar(output, 20);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output*2 ,-0.2));

}).add;
)


(


	x=Routine({
	var delta;
	var freqvect=[


30, 30, 32, 32






	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=3.2;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: ~bus1.index, osc: [-2, -1.9, -1.8, -1.7, -1.6, -1.5 ].choose]);} );

		Synth.new( "delay4", [bus: ~bus1.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose]);


    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});


)
x.play;

x.stop;





(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*4.844, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)

(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+4500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*3.044, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0));




}).add;
)



(

	n=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 1,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 0,           2, 1,   1, 2,   1, 0,   2, 0 ,




		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 1,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 2,   1, 2,          1, 1,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 2,   1, 1,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 1,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 0,           2, 1,   1, 2,   1, 0,   2, 0 ,


			2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 0,   1, 0,           2, 0,   1, 2,   1, 1,   2, 0 ,

		2, 1,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 2,   1, 2,          1, 1,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 2,   1, 1,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 1,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 0,           2, 1,   1, 2,   1, 0,   2, 0 ,




			2, 0,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 1,   2, 0,   1, 0,  2, 0,          1, 0,   1, 0,   2, 2,   1, 2,          1, 1,   2, 0,   1, 0,   1, 0,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 0,   2, 2,   1, 1,  2, 0,          1, 0,   1, 0,   2, 0,   1, 0,          1, 0,   2, 0,   1, 2,   1, 1,           2, 0,   1, 0,   1, 0,   2, 0 ,

		2, 1,   2, 1,   2, 1,  2, 2,          1, 2,   1, 1,   2, 1,   1, 2,          1, 2,   2, 1,   1, 2,   1, 2,           2, 1,   1, 2,   1, 1,   2, 1 ,






	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.1;
		freq=freqvect[i];


		//k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		switch( freqvect[i],
			0, {0},
			1, { Synth(\noise1 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ; },
			2, {Synth(\noise2 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			3, {Synth(\noise3 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			4, {Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;}



		);



		//});


    i= if( i>=511, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;
d.play;

n.stop;



c.stop;

n.stop;

x.stop;
z.stop;
b.stop;
