


s.boot;
s.options.memSize=2*1024*1024;
s.reboot;


(
SynthDef(
	\saw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 280*SinOsc.kr(0.8, -2.5, 3.95 ,4));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 0.5, 1.7, -4),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1500);
	sig=HPF.ar(sig, 250);


Out.ar(bus,Pan2.ar(sig*0.8 ,0));
	  Out.ar(0,Pan2.ar(sig/10 ,0));

}).add;
)


(
SynthDef(
	\saw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);

		sig3=BPF.ar(sig3, 80*SinOsc.kr(0.08, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 0.5, 2, -4),   doneAction: 2);
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


//	Out.ar(bus,Pan2.ar(sig/1250 ,0));
	Out.ar(0,Pan2.ar(sig/3 ,0));

}).add;
)



(
SynthDef(\delay7, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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


	z=Routine({
	var delta;
	var freqvect=[1, 1,   38, 39,  38, 1,  1, 1,  38, 1,  1, 1,  38, 1, 38, 39,
	1, 1,   38, 39,  38, 1,  1, 1,  38, 1,  1, 1,  38, 1, 38, 39,

	1, 1,   38, 39,  38, 1,  1, 1,  38, 1,  1, 1,  38, 1, 38, 39,
	1, 1,   38, 39,  38, 1,  1, 1,  38, 1,  1, 1,  38, 1, 38, 39,


		1, 1,   38, 39,  38, 1,  1, 1,  38, 1,  1, 1,  38, 1, 38, 39,
	1, 1,   38, 39,  38, 1,  1, 1,  38, 1,  1, 1,  38, 1, 38, 39,

	1, 1,   36, 39,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 36, 39,
	1, 1,   36, 39,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 38, 39,
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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "delay7", [bus: bus2.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
a.play;

z.stop;





(


	w=Routine({
	var delta;
	var freqvect=[36, 36, 1, 1, 1, 1,  36, 1,   1, 1,   36, 1,   1, 36, 1, 1,
	36, 36, 1, 1, 1, 1,  36, 1,   1, 1,   36, 1,   1, 36, 1, 1,

	34, 34, 1, 1, 1, 1,  34, 1,   1, 1,   34, 1,   1, 34, 1, 1,

	34, 34, 1, 1, 1, 1,  34, 1,   1, 1,   34, 1,   1, 34, 1, 1,


	31, 31, 1, 1, 1, 1,  31, 1,   1, 1,   31, 1,   1, 31, 1, 1,
	31, 31, 1, 1, 1, 1,  31, 1,   1, 1,   31, 1,   1, 31, 1, 1,


	32, 32, 1, 1, 1, 1,  32, 1,   1, 1,   32, 1,   1, 32, 1, 1,
	32, 32, 1, 1, 1, 1,  32, 1,   1, 1,   32, 1,   1, 32, 1, 1,

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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "delay7", [bus: bus2.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;
z.play;
k.play;

w.stop;





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

		Out.ar(0,Pan2.ar(sig*0.48,0));
	//	Out.ar(bus,Pan2.ar(sig,0));

}).add;
)

(


	c=Routine({
	var delta;
	var freqvect=[
1, 35, 1, 35, 1, 35, 1, 35




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

		if (freqvect[i]==1 , {0},  {Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);});

		i= if( i>=(7), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;

c.stop;



(


	v=Routine({
	var delta;
	var freqvect=[35, 1, 35, 1, 35, 1, 35, 1




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

		if (freqvect[i]==1 , {0},  {Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);});

		i= if( i>=(7), {0}, {i+1});

		 delta.yield;
	}


});
)
v.play;

v.stop;



(
SynthDef(
	\sine1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*4.5, 0)*EnvGen.kr(Env.perc(0.001, 1, 1.7, -8),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -4),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*4, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+24).midicps, 0, amp, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.5, -4),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+19).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 5, 2, 0),   doneAction: 0);
				//sig=sig+SinOsc.ar( (freq+36).midicps, 0, amp*3, 0)*EnvGen.kr(Env.perc(0.001, 5, 0.15, -4),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq+31).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 5, 0.25, 0),   doneAction: 0);



sig=sig*EnvGen.kr(Env.perc(0.8, 10, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 158*SinOsc.kr(0.2, 2, 3.9 ,4.5));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 300);


		Out.ar(0,Pan2.ar(sig3*0.2513 ,0.2));
		Out.ar(bus,Pan2.ar(sig3/20 ,0.2));

}).add;
)






(
SynthDef(\ambdelay, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.5, 0.37, 0.45, 0.42];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.0006 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 7.4, 1, 0) ,  doneAction: 2);
output=HPF.ar(output, 2500);
	output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output ,0));

}).add;
)




(
SynthDef(
	\sine2, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*4.5, 0)*EnvGen.kr(Env.perc(0.001, 1, 1.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -4),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*4, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+24).midicps, 0, amp*3, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.5, -4),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+19).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 5, 2, 0),   doneAction: 0);
				//sig=sig+SinOsc.ar( (freq+36).midicps, 0, amp*3, 0)*EnvGen.kr(Env.perc(0.001, 5, 0.15, -4),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq+31).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 5, 0.25, 0),   doneAction: 0);



sig=sig*EnvGen.kr(Env.perc(0.3, 7, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 658*SinOsc.kr(0.1, 8, 0.9 ,1.5));
    sig3=LPF.ar(sig3, 1000);
	sig3=HPF.ar(sig3, 300);


		Out.ar(0,Pan2.ar(sig3*0.4013 ,0));
		Out.ar(bus,Pan2.ar(sig3/45 ,0));

}).add;
)

(
SynthDef(\ambdelay2, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.5, 0.37, 0.45, 0.42];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.0006 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 15.4, 1.7, 0) ,  doneAction: 2);
//output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output ,0));

}).add;
)





(


	k=Routine({
	var delta;
	var freqvect1=[
 48, 1, 1, 1, 1, 1, 1, 1,
		51, 1, 1, 50, 1, 1, 43, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		46, 1, 1, 1,  1, 1, 1, 1,


		41, 1, 1, 1,  1, 1, 1, 1,
		43, 1, 1, 46, 1, 1,  48, 1,
		1, 46, 1,  1,  39, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1



	];

	var freqvect=[
 48, 1, 1, 1, 1, 1, 1, 1,
		51, 1, 1, 50, 1, 1, 43, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		46, 1, 1, 1,  1, 1, 1, 1,


		41, 1, 1, 1,  1, 1, 1, 1,
		43, 1, 1, 46, 1, 1,  39, 1,
		1, 1, 1,  1,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1



	];


	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/8;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine1", [freq: freqvect[i]+24, amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			k6 = Synth.new( "ambdelay", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
k.play;

k.stop;




(


	j=Routine({
	var delta;
	var freqvect=[
51, 1, 1, 1, 1, 1, 1, 1,
		53, 1, 1, 51, 1, 1, 58, 1,
		1, 51, 1, 1,  50,1,  1,  1,
		1, 1, 1, 1,  1, 1, 1, 1,

		46, 1, 1, 1,   1, 1, 1, 1,
		41, 1, 1,  43, 1, 1, 46, 1,
		1, 39, 1, 1,  48, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1




	];




	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/8;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("sine2", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			Synth.new( "ambdelay2", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
j.play;
k.play;
j.stop;



(
SynthDef(
	\saw4, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq.midicps*SinOsc.kr(64, 0, 0.01, 2));
		//sig=sig+LFSaw.ar((freq+12).midicps*SinOsc.kr(64, 0, 0.01, 2));



		sig=sig*EnvGen.kr(Env.perc(2, 8.5, 3.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 700*SinOsc.kr(10.065, -2.5, 1.65 ,4.05));
		 sig3=LPF.ar(sig3, 1600);
		sig3=HPF.ar(sig3, 800);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.4 ,-0.2));

}).add;
)




(
SynthDef(
	\saw8, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq.midicps*SinOsc.kr(64, 0, 0.01, 2));
		sig=sig+LFSaw.ar((freq+12).midicps*SinOsc.kr(64, 0, 0.01, 2));



		sig=sig*EnvGen.kr(Env.perc(2, 8.5, 3.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 700*SinOsc.kr(10.065, -2.5, 1.65 ,4.05));
		 sig3=LPF.ar(sig3, 1600);
		sig3=HPF.ar(sig3, 400);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.3 ,0.2));

}).add;
)


(


	x=Routine({
	var delta;
	var freqvect=[1, 60, 1, 1,  1, 1, 1, 1,
		1, 58, 1, 1, 1, 1, 1, 1,
		1, 55, 1, 1,   1, 1, 1, 1,
		1, 51, 1, 1, 1, 1, 1, 1
	];

		var freqvect2=[1, 63, 1, 1,  1, 1, 1, 1,
		1, 62, 1, 1, 1, 1, 1, 1,
		1, 58, 1, 1,   1, 1, 1, 1,
		1, 55, 1, 1, 1, 1, 1, 1
	];


		var freqvect3=[1, 67, 1, 1,  1, 1, 1, 1,
		1, 65, 1, 1, 1, 1, 1, 1,
		1, 62, 1, 1,   1, 1, 1, 1,
		1, 58, 1, 1, 1, 1, 1, 1
	];


		var freqvect4=[1, 72, 1, 1,  1, 1, 1, 1,
		1, 70, 1, 1, 1, 1, 1, 1,
		1, 67, 1, 1,   1, 1, 1, 1,
		1, 63, 1, 1, 1, 1, 1, 1
	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {
			Synth.new("saw4", [freq: freqvect[i], amp: 1 , bus: bus2.index, pan: []]);
				Synth.new("saw4", [freq: freqvect2[i], amp: 1 , bus: bus2.index, pan: []]);
				Synth.new("saw4", [freq: freqvect3[i], amp: 1 , bus: bus2.index, pan: []]);
				Synth.new("saw4", [freq: freqvect4[i], amp: 1 , bus: bus2.index, pan: []]);



		}


		);

	//Synth.new( "delay", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
x.play;

x.stop;





(


	p=Routine({
	var delta;
	var freqvect=[1, 1, 1, 79,  1, 1, 1, 1,
		1, 1, 1, 86, 1, 1, 1, 1,
		1, 1, 1, 1,   1, 75, 1, 1,
		1, 1, 1, 1, 1, 70, 1, 1
	];



	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {
			Synth.new("saw8", [freq: freqvect[i], amp: 1 , bus: bus2.index, pan: []]);
				//Synth.new("saw4", [freq: freqvect2[i], amp: 1 , bus: bus2.index, pan: []]);
				//Synth.new("saw4", [freq: freqvect3[i], amp: 1 , bus: bus2.index, pan: []]);
				//Synth.new("saw4", [freq: freqvect4[i], amp: 1 , bus: bus2.index, pan: []]);



		}


		);

	//Synth.new( "delay", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
p.play;

p.stop;



(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[


1, 2



	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:5500 , amp: a*2]); });


    i= if( i>=1, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;

n.stop;



(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[


1, 1, 2, 1  ,1, 1,  2 , 1,  1, 1,  2, 1,   1,1,  2,2



	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise6 , [freq:8500 , amp: a*2]); });


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
n.play;

m.stop;







(
SynthDef(\noise5, {arg out=0,  freq=400, amp=0.2, dur ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, 1, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.45, -0.2));




}).add;
)


(
SynthDef(\noise6, {arg out=0,  freq=400, amp=0.2, dur ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.6, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.25, -0.2));




}).add;
)




(


	b=Routine({
	var delta;
	var freqvect11=[2, 2, 1, 2 ];
	var freqvect12=[2, 1, 2, 2 ];
	var freqvect13=[1, 2, 2, 1];
	var freqvect14=[1, 2, 1, 2];

	var freqvect15=[2, 1, 2, 1];
	var freqvect16=[1, 2, 2, 2];
	var freqvect17=[1, 1, 2, 2];

	var freqvect18=[2, 1, 1, 2];


	var freqvect;
var index, index2;
	var bus2=Bus.audio(s, 2);
	var freq;
	var delta1;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;



		delta=1.8/16;
	delta1=delta*4;
	loop{



			index=[1, 2, 3, 4, 5, 6, 7, 8, 9].choose;

			case
		{index==1}
			{freqvect=freqvect11}
		{index==2}
		   {freqvect=freqvect12}
		{index==3}
  		   {freqvect=freqvect13}
		{index==4}
	       {freqvect=freqvect14}
		{index==5}
	   	{freqvect=freqvect15}
		{index==6}
		{freqvect=freqvect16}
		{index==7}
		{freqvect=freqvect17}
		{index==8}
		{freqvect=freqvect18};



		i=0;




			(0..3).do({if(freqvect[i]==1,  {0 }, {Synth.new("noiselow", [freq: [1000, 1500, 2000, 2500].choose, dur: [0.3, 0.5, 0.7,0.4, 1 ].choose ,amp: 1 , bus: bus2.index, pan: []]);
				Synth.new("verbok2", [ bus: bus2.index]);
			} );  i=i+1; delta.yield})








	}



});


)
b.play;

b.stop;



(
SynthDef(\noiselow, {arg out=0,  freq=400, amp=0.2, dur, bus ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1000);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.7, -0.2));
Out.ar(bus,Pan2.ar(sig*0.040 ,0.2));



}).add;
)




(
SynthDef(\verbok2, {arg bus, d1=0.6, d2=0.27, d4=0.83, d3=0.233;
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
	sig = sig * [d1+0.1, d2+0.2, d3+0.2, d4+0.3];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.5, 3, -3) ,  doneAction: 2);
	output=HPF.ar(output, 500);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)







(
SynthDef(
	\saw16, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 280*SinOsc.kr(0.8, -2.5, 3.95 ,4));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 1.5, 1.7, -4),   doneAction: 2);//0.02


		sig1=LFSaw.ar((freq+24).midicps, 0, 3.5, 0);
		sig1=BPF.ar(sig1, 280*SinOsc.kr(0.8, -2.5, 3.95 ,4));
		sig1=sig1*EnvGen.kr(Env.perc(0.2, 1.5, 1.7, -4),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3500);
	sig=HPF.ar(sig, 450);


	Out.ar(bus,Pan2.ar(sig*0.65 ,0.2));
	  Out.ar(0,Pan2.ar(sig/10 ,0.2));

}).add;
)



(
SynthDef(\delay8, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
output=output*EnvGen.kr(Env.perc(0.01, 2.6, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 1500);
	Out.ar(0,Pan2.ar(output/100 ,0.2));

}).add;
)


(


	a=Routine({
	var delta;
	var freqvect=[

63, 63, 63, 63,  63, 63, 63, 63,   63, 63, 63, 63,  63, 63, 63, 63,
63, 63, 63, 63,  63, 63, 63, 63,   63, 63, 63, 63,  63, 63, 63, 63,

68, 68, 68, 68, 68, 68, 68, 68,  68, 68, 68, 68, 68, 68, 68, 68,
70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70,



65, 65, 65, 65, 65, 65, 65, 65,   65, 65, 65, 65, 65, 65, 65, 65,
65, 65, 65, 65, 65, 65, 65, 65,   65, 65, 65, 65, 65, 65, 65, 65,

58, 58, 58, 58, 58, 58, 58, 58,	 58, 58, 58, 58, 58, 58, 58, 58,
58, 58, 58, 58, 58, 58, 58, 58,	 58, 58, 58, 58, 58, 58, 58, 58,



62, 62, 62, 62, 62, 62, 62, 62,    62, 62, 62, 62, 62, 62, 62, 62,
62, 62, 62, 62, 62, 62, 62, 62,    62, 62, 62, 62, 62, 62, 62, 62,
55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
58, 58, 58, 58, 58, 58, 58, 58, 	58, 58, 58, 58, 58, 58, 58, 58,


51, 51, 51, 51, 51, 51, 51, 51,   51, 51, 51, 51, 51, 51, 51, 51,
51, 51, 51, 51, 51, 51, 51, 51,   51, 51, 51, 51, 51, 51, 51, 51,
56, 56, 56, 56, 56, 56, 56, 56,  56, 56, 56, 56, 56, 56, 56, 56,
55, 55, 55, 55, 55, 55, 55, 55,  55, 55, 55, 55, 55, 55, 55, 55,




63, 63, 63, 63,  63, 63, 63, 63,   63, 63, 63, 63,  63, 63, 63, 63,
63, 63, 63, 63,  63, 63, 63, 63,   63, 63, 63, 63,  63, 63, 63, 63,
70, 70, 70, 70, 70, 70, 70, 70,  70, 70, 70, 70, 70, 70, 70, 70,
72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72, 72,

65, 65, 65, 65, 65, 65, 65, 65,   65, 65, 65, 65, 65, 65, 65, 65,
65, 65, 65, 65, 65, 65, 65, 65,   65, 65, 65, 65, 65, 65, 65, 65,
58, 58, 58, 58, 58, 58, 58, 58,  58, 58, 58, 58, 58, 58, 58, 58,
62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62,

55, 55, 55, 55, 55, 55, 55, 55,  55, 55, 55, 55, 55, 55, 55, 55,
55, 55, 55, 55, 55, 55, 55, 55,  55, 55, 55, 55, 55, 55, 55, 55,
60, 60, 60, 60, 60, 60, 60, 60,   60, 60, 60, 60, 60, 60, 60, 60,
58, 58, 58, 58, 58, 58, 58, 58,  58, 58, 58, 58, 58, 58, 58, 58,

51, 51, 51, 51, 51, 51, 51, 51,   51, 51, 51, 51, 51, 51, 51, 51,
51, 51, 51, 51, 51, 51, 51, 51,   51, 51, 51, 51, 51, 51, 51, 51,
56, 56, 56, 56, 56, 56, 56, 56,  56, 56, 56, 56, 56, 56, 56, 56,
58, 58, 58, 58, 58, 58, 58, 58,	58, 58, 58, 58, 58, 58, 58, 58


];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/32;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw16", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "delay8", [bus: bus2.index]);


    i= if( i>=511, {0}, {i+1});

		 delta.yield;
	}


});


)

a.play;

a.stop;


s.record;


z.play;
w.play;

//attiva il primo saw





c.play;


b.play;


x.play;

p.play;

m.play;
n.play;

j.play;

j.stop;

b.stop;
c.stop;

a.play;



j.play;

m.stop;
n.stop;

v.play;

b.play;


x.stop;
p.stop;

a.stop;



v.stop;


j.stop;
b.stop;


n.stop;
m.stop;


z.stop;
w.stop;
Synth.new("bass2", [freq: 30, amp: 0.75 ]);
s.stopRecording;