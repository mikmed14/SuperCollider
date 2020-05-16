s.boot;
s.reboot;
s.options.memSize=2*1024*1024;



(
var volume;
volume=Volume.new;
volume.volume=(-30);
)





(
SynthDef(
	\abcsaw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, 180*SinOsc.kr(0.35, -2.5, 8 ,8.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 2, 2, -8),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1500);
	sig=HPF.ar(sig, 50);


Out.ar(bus,Pan2.ar(sig*4 ,0));
	Out.ar(0,Pan2.ar(sig/0.6 ,0));//10-1.5

}).add;
)







(
SynthDef(\abcdelay7, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	deltimes = [191, 153, 145, 187] * 0.00004 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.6, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 2500);
	Out.ar(0,Pan2.ar(output/100 ,-0.2));

}).add;
)



(


	w=Routine({
	var delta;
	var freqvect=[45, 1, 1, 45, 1, 1, 45, 1,
	48, 1, 1, 48, 1, 1, 48, 1,
	43, 1, 1,  43, 1, 1, 43, 1,
	40, 1, 1, 40, 1, 1, 43, 1,

];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/12;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("abcsaw5", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "abcdelay7", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;

s.record;

z.play;

w.stop;
c.stop;
z.stop;

s.record;


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
		sig=sig;
		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.75, 1.5, -8),   doneAction: 2);

	   // sig=LPF.ar(sig, 1000);
		sig=HPF.ar(sig, 30);
		//sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*3.63,0));
	//	Out.ar(bus,Pan2.ar(sig,0));

}).add;
)

(


	c=Routine({
	var delta;
	var freqvect=[
35, 1, 35, 1, 35, 1, 35,1




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
		delta=1.8/6;
		freq=freqvect[i];

		if (freqvect[i]==1 , {0},  {Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);});

		i= if( i>=(7), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;

c.stop;





(
SynthDef(\noise4, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1000)*SinOsc.kr(2.5, -1, 2, 2.1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.8484, 0));
Out.ar(bus,Pan2.ar(sig*1.12 ,0.2));




}).add;
)

(
SynthDef(\verbok, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.5, 0.52, 0.45, 0.42];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [281, 293, 295, 297] * 0.00108 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.4, 2, -2) ,  doneAction: 2);
output=HPF.ar(output, 500);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[

1, 1, 1, 2, 1 ,1, 2, 1,
		1, 1, 1, 2, 1 ,1, 2, 1,
		1, 1, 1, 2, 1 ,1, 2, 1,
		1, 1, 1, 2, 1 ,1, 2, 1,
		1, 1, 1, 2, 1 ,1, 2, 1,
		1, 1, 1, 2, 1 ,1, 2, 1,
		1, 1, 1, 2, 1 ,1, 2, 1,
		2, 2, 1, 2, 1 ,1, 2, 2,



	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/12;
		freq=freqvect[i];


		 if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq:1500 , amp: a*2, bus: bus.index]);
		Synth.new("verbok", [ bus: bus.index]);
		});

	//	if (i==207 ,{    Synth.new("verbok", [ bus: bus.index]);  } );
		//	if (i==86 ,{    Synth.new("verbok", [ bus: bus.index]);  } );


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;
m.play;

n.stop;








(
SynthDef(\noise1, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(0.8, 1, 2, 2.1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4), doneAction:2);
	//Out.ar(out, Pan2.ar(sig*1.0484, 0));
	//Out.ar(bus,Pan2.ar(sig*0.312 ,0.2));




}).add;
)

(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[

2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,
		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,
		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,
		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,


		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,
		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,
		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1,
		2, 1, 1, 1,   2, 1,  1, 1,   2, 1, 1, 1,   2 , 1, 1, 1






	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/48;
		freq=freqvect[i];


		 if (freqvect[i]==1,{ 0},{ Synth(\noise1 , [freq:1500 , amp: a*2, bus: bus.index]);
		//Synth.new("verbok", [ bus: bus.index]);
		});

	//	if (i==207 ,{    Synth.new("verbok", [ bus: bus.index]);  } );
		//	if (i==86 ,{    Synth.new("verbok", [ bus: bus.index]);  } );


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
n.play;
c.play;

m.stop;



(
SynthDef(
	\abcsine6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);



sig3 = Mix.ar(SinOsc.ar((freq).midicps * [1, 2.03,  0.99,0.99, 2.01, 2.02]  ));
	//	sig3=SinOsc.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 600*SinOsc.kr(0.1, -2, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.4, 0.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1400);
	sig=HPF.ar(sig, 150);


		Out.ar(bus,Pan2.ar(sig3/150 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)


(
SynthDef(\sinedelay, {arg bus, d=0.00007;
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
	deltimes = [111, 153, 130, 177] * d*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2)- ControlDur.ir;
	//deltimes = [101, 153, 145, 187] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(1, 2.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 3800);
output=HPF.ar(output, 200);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(


	r=Routine({
	var delta;
	var freqvect1=[

		45,  43,  45, 52

];

		var freqvect2=[

52, 48,  52, 59
];

		var freqvect3=[


	57, 55,  57, 64
];

	var freqvect4=[

	57, 45, 52, 57,  45, 57, 52, 45,
	57, 45, 52, 57,  45, 57, 52, 45,
	57, 45, 52, 57,  45, 57, 52, 45,
	57, 45, 52, 57,  45, 57, 52, 45,

	55, 43, 48, 55, 43, 55, 48, 43,
	55, 43, 48, 55, 43, 55, 48, 43,
	55, 43, 48, 55, 43, 55, 48, 43,
	55, 43, 48, 55, 43, 55, 48, 43,


		57, 45, 52, 57,  45, 57, 52, 45,
	57, 45, 52, 57,  45, 57, 52, 45,
	57, 45, 52, 57,  45, 57, 52, 45,
	57, 45, 52, 57,  45, 57, 52, 45,


	52, 52, 59, 52,  52, 52, 59, 52,
	52, 52, 59, 52,  52, 52, 59, 52,
	52, 52, 59, 52,  52, 52, 59, 52,
	52, 52, 59, 52,  52, 52, 59, 52


	];

	var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/24;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect4[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

        Synth.new( "sinedelay", [bus: bussine.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
r.play;
w.play;

r.stop;




(
SynthDef(
	\abcsaw7, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
	sig3 = Mix.ar(LFSaw.ar((freq-12).midicps * [1,2,  2,1.999]));
		sig3=BPF.ar(sig3, 240*SinOsc.kr(1.2, 1.2, 2.95 ,3));//180
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 0.8, 1, -2),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3500);
	sig=HPF.ar(sig, 30);
Out.ar(bus,Pan2.ar(sig*8 ,0));
 Out.ar(0,Pan2.ar(sig*4.5 ,0));

}).add;
)


(


	z=Routine({
	var delta;
	var freqvect=[
	1, 52, 1, 1, 52, 1, 1, 52,
	1, 57, 1, 1, 57, 1, 1, 57 ,
	1, 55, 1, 1, 55, 1, 1, 55,
	1, 59, 1, 1, 59, 1, 1, 60
];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/12;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("abcsaw7", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "abcdelay7", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
w.play;

z.stop;


(
SynthDef(\noise2, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq)*SinOsc.kr(8, 1, 0.5, 0.6));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.6, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.9484, 0));
	//Out.ar(bus,Pan2.ar(sig*0.312 ,0.2));




}).add;
)

(

	o=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[

2, 2, 1, 1,  1, 2, 1, 2,






	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/12;
		freq=freqvect[i];


		 if (freqvect[i]==1,{ 0},{ Synth(\noise2 , [freq:1500 , amp: a*2, bus: bus.index]);
		//Synth.new("verbok", [ bus: bus.index]);
		});

	//	if (i==207 ,{    Synth.new("verbok", [ bus: bus.index]);  } );
		//	if (i==86 ,{    Synth.new("verbok", [ bus: bus.index]);  } );


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
o.play;
c.play;

o.stop;




(
SynthDef(
	\abcsaw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
	sig3 = Mix.ar(LFSaw.ar((freq-12).midicps * [1,2,  2,1.999]));
		sig3=BPF.ar(sig3, 500*SinOsc.kr(0.05, 2.5, 1.95 ,2));
		sig3=sig3*EnvGen.kr(Env.perc(0.3, 6, 1.7, -8),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2500);
	sig=HPF.ar(sig, 300);
//Out.ar(bus,Pan2.ar(sig*8 ,0));
 Out.ar(0,Pan2.ar(sig*2 ,0));

}).add;
)



(


	a=Routine({
	var delta;
	var freqvect1=[


		57, 1, 1, 1, 1, 1, 1, 57,
		1, 55, 1, 1,   1, 1, 1, 1,
		57, 1, 1, 1, 1, 1, 1, 53,
		1, 55, 1, 1,  52, 1, 1, 1,


57, 1, 1, 1, 1, 1, 1, 57,
		1, 55, 1, 1,   1, 1, 1, 1,
		57, 1, 1, 1, 1, 1, 1, 53,
		1, 55, 1, 1,  52, 1, 1, 1
];

		var freqvect2=[

		60 , 1, 1, 1, 1, 1, 1, 60,
		1, 59, 1, 1,   1, 1, 1, 1,
		60, 1, 1, 1, 1, 1, 1, 57,
		1, 59, 1, 1,  55, 1, 1, 1,


60 , 1, 1, 1, 1, 1, 1, 60,
		1, 59, 1, 1,   1, 1, 1, 1,
		60, 1, 1, 1, 1, 1, 1, 69,
		1, 67, 1, 1,  62, 1, 1, 1
];

		var freqvect3=[


		64, 1, 1, 1, 1, 1, 1, 64,
		1, 62, 1, 1,   1, 1, 1, 1,
		64, 1, 1, 1, 1, 1, 1, 67,
		1, 69, 1, 1,  62, 1, 1, 1,

64, 1, 1, 1, 1, 1, 1, 64,
		1, 62, 1, 1,   1, 1, 1, 1,
		64, 1, 1, 1, 1, 1, 1, 60,
		1, 62, 1, 1,  59, 1, 1, 1
];




	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/6;

		//freq=freqvect[i];
		if(freqvect1[i]==1,  {0 }, {Synth.new("abcsaw6", [freq: freqvect1[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		if(freqvect2[i]==1,  {0 }, {Synth.new("abcsaw6", [freq: freqvect2[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect3[i]==1,  {0 }, {Synth.new("abcsaw6", [freq: freqvect3[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	//k6 = Synth.new( "abcdelay7", [bus: bus2.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
a.play;
w.play;

a.stop;











(
SynthDef(\noise3, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1000)*SinOsc.kr(0.8, -1, 1, 2.1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.8, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*3.8484, 0));
	//Out.ar(bus,Pan2.ar(sig*0.312 ,0.2));




}).add;
)



(
SynthDef(\noise53, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1500)*SinOsc.kr(0.1, 1, 1, 2.1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 20.8, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*1.0484, 0));
	//Out.ar(bus,Pan2.ar(sig*0.312 ,0.2));




}).add;
)


Synth(\noise53 , [freq:500 , amp: 2, bus: 0]);

(

	p=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[

1, 1, 1, 1,  2, 1, 1, 1,

		1, 1, 1, 1,  2, 1, 1, 1,
		1, 1, 1, 1,  2, 1, 1, 1,
		1, 1, 1, 1,  2, 1, 1, 1,

		1, 1, 1, 1,  2, 1, 1, 1,
		1, 1, 1, 1,  2, 1, 1, 1,
		1, 1, 1, 1,  2, 1, 1, 1,
		1, 1, 1, 1,  2, 1, 2, 1,






	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/12;
		freq=freqvect[i];


		 if (freqvect[i]==1,{ 0},{ Synth(\noise3 , [freq:1500 , amp: a*2, bus: bus.index]);
		//Synth.new("verbok", [ bus: bus.index]);
		});

	//	if (i==207 ,{    Synth.new("verbok", [ bus: bus.index]);  } );
		//	if (i==86 ,{    Synth.new("verbok", [ bus: bus.index]);  } );


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
p.play;
Synth(\noise53 , [freq:500 , amp: 2, bus: 0]);




p.stop;


//MODIFICA ABCSAW7

(
SynthDef(
	\abcsaw7, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
	sig3 = Mix.ar(LFSaw.ar((freq-12).midicps * [1,2,  2,1.999]));
		sig3=BPF.ar(sig3, 240*SinOsc.kr(1.2, 1.2, 2.95 ,3));//180
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 0.8, 1, -2),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3500);
	sig=HPF.ar(sig, 30);
Out.ar(bus,Pan2.ar(sig*8 ,0));
 Out.ar(0,Pan2.ar(sig*4.5 ,0));

}).add;
)










(
SynthDef(
	\saw2bass2, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar((freq).midicps*SinOsc.kr(64, 0, 0.01, 2));
		//sig=sig+LFSaw.ar((freq+12).midicps*SinOsc.kr(64, 0, 0.01, 2));

//sig3 = Mix.ar(LFSaw.ar((freq).midicps * [1,1,  1,1.01]));
	//	sig = sig3+Mix.ar(LFSaw.ar((freq+12).midicps * [1,1,  1,1.01]));

		sig=sig*EnvGen.kr(Env.perc(0.003, 2.5, 3.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 1800*SinOsc.kr(10.065, -2.5, 1.65 ,4.05));
		 sig3=LPF.ar(sig3, 3600);
		sig3=HPF.ar(sig3, 800);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*2 ,0));

}).add;
)



(


	b=Routine({
	var delta;
	var freqvect=[76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
	1, 1,  67, 1,  71, 1, 79, 1,


		76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
	1, 1,  67, 1,  71, 1, 79, 1,

	//1
	76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
		1, 1,  67, 1,  71, 67, 71, 79,



		76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
	1, 1,  67, 1,  71, 1, 79, 1,



			76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
	1, 1,  67, 1,  71, 1, 79, 1,




		//2

	76, 79, 76, 74, 72 ,1, 71, 1,
		76, 79, 76, 74, 72 ,1, 71, 1,
		76, 79, 76, 74, 72 ,1, 71, 1,
		72, 1,  67, 1, 71, 1, 79,1,



			76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
	1, 1,  67, 1,  71, 1, 79, 1,





			76, 79, 76, 74, 72 ,1, 71, 1,
	72, 1, 67, 1,  74, 1, 72, 1,
	74, 1, 1, 72, 1, 1, 71, 1,
		1, 1,  67, 1,  71, 67, 71, 79,


	];


	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/12;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {
			Synth.new("saw2bass2", [freq: freqvect[i], amp: 1 , bus: bus2.index, pan: []]);




		}


		);

	//Synth.new( "delay", [bus: bus2.index]);


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;


b.stop;


//MODIFICA ABCSAW7

(
SynthDef(
	\abcsaw7, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
	sig3 = Mix.ar(LFSaw.ar((freq-12).midicps * [1,2,  2,1.999]));
		sig3=BPF.ar(sig3, 740*SinOsc.kr(1.2, 1.2, 1.95 ,2));//180
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 0.8, 1, -2),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3500);
	sig=HPF.ar(sig, 30);
Out.ar(bus,Pan2.ar(sig*8 ,0));
 Out.ar(0,Pan2.ar(sig*6.5 ,0));

}).add;
)






//METTI A POSTO ABCSAW7
(
SynthDef(
	\abcsaw7, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
	sig3 = Mix.ar(LFSaw.ar((freq-12).midicps * [1,2,  2,1.999]));
		sig3=BPF.ar(sig3, 240*SinOsc.kr(1.2, 1.2, 2.95 ,3));//180
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 0.8, 1, -2),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3500);
	sig=HPF.ar(sig, 30);
Out.ar(bus,Pan2.ar(sig*8 ,0));
 Out.ar(0,Pan2.ar(sig*4.5 ,0));

}).add;
)










(
var notes, on, off;
var buskey=Bus.audio(s,2);

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
    notes[num] = Synth(\abcsine6, [\freq, num,
        \amp, veloc * 0.00315, \bus, buskey.index]);
	Synth.new( "delay", [bus: buskey.index]);
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

q = { on.free; off.free; };
)






b.stop;


n.stop;
o.stop;
Synth(\noise53 , [freq:500 , amp: 2, bus: 0]);

m.stop;
p.stop;
c.stop;

a.stop;

r.stop;
z.stop;
a.stop;
w.stop;




s.stopRecording;
