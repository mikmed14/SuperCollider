s.boot;

s.reboot;
s.options.memSize=2*1024*1024;


~bus1=Bus.audio(s,2);
~bus2=Bus.audio(s,2);
~bus3=Bus.audio(s,2);
~bus4=Bus.audio(s,2);
~bus5=Bus.audio(s,2);
~bus6=Bus.audio(s,2);
~bus7=Bus.audio(s,2);

~bus1.free;
~bus2.free;
~bus3.free;
~bus4.free;
~bus5.free;
~bus6.free;
~bus7.free;


(
SynthDef(
	\saw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);

		sig1=LFSaw.ar(freq.midicps, 0, 8.5, 0);
		sig1=BPF.ar(sig1, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
		sig1=sig1*EnvGen.kr(Env.perc(0.00008, 0.7, 1.7, -8),   doneAction: 2);



		//sig2=LFSaw.ar((freq+7).midicps, 0, 0.5, 0);
		//sig2=BPF.ar(sig2, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));



		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 580*SinOsc.kr(0.8, -2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 0.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 800);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/6000 ,0));
Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)






(
SynthDef(\delay4, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	deltimes = [101, 153, 145, 167] * 0.00004*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2)- ControlDur.ir;
	//deltimes = [101, 153, 145, 187] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.001, 6.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 800);
output=HPF.ar(output, 20);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output*2 ,-0.2));

}).add;
)



(


	z=Routine({
	var delta;
	var freqvect=[

		36, 36, 43, 39, 43, 39, 36, 39, 43, 39,  36, 36,  39, 36, 43, 36,
		36, 36, 43, 39, 43, 39, 36, 39, 43, 39,  36, 36,  39, 36, 43, 36,
		36, 36, 43, 39, 43, 39, 36, 39, 43, 39,  36, 36,  39, 36, 43, 36,
		36, 36, 43, 39, 43, 39, 36, 39, 43, 39,  36, 36,  39, 36, 43, 36,

		34, 34, 43, 39, 43, 39, 34, 39, 43, 39,  34, 34,  39, 34, 43, 34,
			34, 34, 43, 39, 43, 39, 34, 39, 43, 39,  34, 34,  39, 34, 43, 34,
			34, 34, 43, 39, 43, 39, 34, 39, 43, 39,  34, 34,  39, 34, 43, 34,
			34, 34, 43, 39, 43, 39, 34, 39, 43, 39,  34, 34,  39, 34, 43, 34,







	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/16;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: ~bus1.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	 Synth.new( "delay4", [bus: ~bus1.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;


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
		//sig=sig+sig2;
		sig=sig*EnvGen.kr(Env.perc(0.01, 0.35, 0.35, -8),   doneAction: 2);

	  sig=LPF.ar(sig, 500);
		sig=HPF.ar(sig, 30);
//	sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*0.208,0.2));
	//	Out.ar(bus,Pan2.ar(sig,0));

}).add;
)

 35, 35, 35,35

(


	c=Routine({
	var delta;
	var freqvect=[


		 35, 35, 35,35








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
		delta=1.8/4;
		freq=freqvect[i];

		//Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

		if (freqvect[i]==1,{ 0},{ Synth(\bass2 , [freq:35 , amp: a*2]   ); }) ;

		i= if( i>=(3), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;
n.play;

c.stop;



(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(0.1, -2*SinOsc.kr(1.93, 0, 1, 1.7), 0.8, 1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 1.2, 2, -16), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.03944, 0));




}).add;
)

(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1000)*SinOsc.kr(3, 2.5, 1.4, 1.9));

	sig=sig*EnvGen.kr(Env.perc(0.04, 0.22, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.01244, 0.2));




}).add;
)

(
SynthDef(\noise7, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+(500*SinOsc.kr(0.01, 0, 1.6, 1.8)));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 2.2, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.0444, 0));




}).add;
)

Synth(\noise7 , [freq:2000 , amp: 1]);



(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 1, 2,




	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/(8*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq:1750 , amp: a*2]); });


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;



Synth(\noise7 , [freq:2000 , amp: 1]);





n.stop;




(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	2, 1, 2, 1,   2, 1, 2, 1,





	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/(8*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:1500 , amp: a*2]); });


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
n.play;

m.stop;


(
SynthDef(\noise6, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+2500)*SinOsc.kr(2, 2.5, 2, 2.1));

	sig=sig*EnvGen.kr(Env.perc(0.05, 0.15, 0.25, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.18044, 0));




}).add;
)



(

	o=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	1, 1, 2, 2,   1, 1, 2, 1,





	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=1.8/(8*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise6 , [freq:1500 , amp: a*2]); });


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
o.play;
m.play;

o.stop;
m.stop;





(
SynthDef(
	\sine111, {|freq, amp, bus, osc|
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


		Out.ar(bus,Pan2.ar(sig3/2500 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)


(
SynthDef(\delay441, {arg bus, d=0.00007;
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


	g=Routine({
	var delta;
	var freqvect=[


48, 55, 51,  48, 55, 48, 51, 55,
		48, 55, 51,  48, 55, 48, 51, 55,
		48, 55, 51,  48, 55, 48, 51, 55,
		48, 55, 51,  48, 55, 48, 51, 55,


		48, 55, 51,  48, 55, 48, 51, 55,
		48, 55, 51,  48, 55, 48, 51, 55,
		48, 55, 51,  48, 55, 48, 51, 55,
		48, 55, 51,  48, 55, 48, 51, 55,


50, 58, 53,   50, 58, 50, 53, 58,

50, 58, 53,   50, 58, 50, 53, 58,

50, 58, 53,   50, 58, 50, 53, 58,

50, 58, 53,   50, 58, 50, 53, 58,



		50, 58, 53,   50, 58, 50, 53, 58,

50, 58, 53,   50, 58, 50, 53, 58,

50, 58, 53,   50, 58, 50, 53, 58,

50, 58, 53,   50, 58, 50, 53, 58,







	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/16;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine111", [freq: freqvect[i], amp: 1 , bus: ~bus7.index, osc: [-1.5, -1.6, -1.7, -1.8, -1.9, -2, -2.1, -2.2, -2.3, -2.4, -2.5 ].choose]);} );

	 Synth.new( "delay441", [bus: ~bus7.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose ]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
g.play;


g.stop;









(
SynthDef(
	\sine1, {|freq, amp, bus|
		var sig, sig2, sig3;



		//sig=SinOsc.ar( freq.midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 1, 1.7, -8),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -4),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
	//	sig=sig+SinOsc.ar( (freq+24).midicps, 0, amp/2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
	//	sig=sig+SinOsc.ar( (freq+19).midicps, 0, amp/3, 0)*EnvGen.kr(Env.perc(0.001, 5, 1, 0),   doneAction: 0);

		sig = Mix.ar(SinOsc.ar((freq.midicps) * [1, 2, 1.01 ], [0,0,0] , amp*[1.5, 1.5, 0.33] ) *EnvGen.kr(Env.perc([0.001, 0.001, 0.001], [1, 5,5] , [1.7, 1,1] , [-8, -4, 0] )));

sig=sig*EnvGen.kr(Env.perc(0.08, 7, 7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 258*SinOsc.kr(1.8, 2, 1.9 ,2.5));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 300);


		Out.ar(0,Pan2.ar(sig3*0.00753 ,0));
		Out.ar(bus,Pan2.ar(sig3/800 ,0));

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
	deltimes = [191, 153, 145, 187] * 0.00042;
		//deltimes = [191, 153, 145, 187] *0.0004*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2) - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 7.4, 1, 0) ,  doneAction: 2);
output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output ,0));

}).add;
)


(


	f=Routine({
	var delta;
	var freqvect=[
     60,1,  1, 1,  1, 1,   1, 1,
	63, 1,   1, 62,   1, 1,  1, 1,

		60, 1,  1, 1,  1, 58,   1, 1,
		60, 1,   1, 65,   1, 63,   1, 62,


		1, 58,    1, 1,   1, 1,   1, 1,

		55, 1,   1, 58,     1, 1,  60, 1,


		1,1 ,  53, 1,   1, 1,   1, 1,
		51, 1,  1, 1,   1, 50,  1, 1


	];




	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/8;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine1", [freq: freqvect[i], amp: 1 , bus: ~bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);
			///Synth.new("sine2", [freq: freqvect[i]+7, amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			k6 = Synth.new( "ambdelay", [bus: ~bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
f.play;


f.stop;



(
SynthDef(\noiselow, {arg out=0,  freq=400, amp=0.2, dur, bus ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+750);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
Out.ar(0, Pan2.ar(sig*0.04, -0.3));
//    Out.ar(bus,Pan2.ar(sig*0.005500 ,0.2));



}).add;
)




(
SynthDef(\verbok22, {arg bus, d1=0.6, d2=0.27, d4=0.83, d3=0.233;
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
	//output = delrd[[0,1]];

	// Cross-fertilise the four delay lines with each other:
//	sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]  ];
sig = [output[0]+output[1],  delrd[2]-delrd[3]  , delrd[2]+delrd[3], delrd[2]-delrd[3]];
	sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];




	// Attenutate the delayed signals so they decay:
//	sig = sig * [0.6, 0.27, 0.233, 0.83];
	sig = sig * [d1+0.1, d2+0.2, d3+0.2, d4+0.3];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [101, 143, 165, 177] * 0.001*SinOsc.kr(0.05, -2, 0.2, 1) - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1, 3, -3) ,  doneAction: 2);
	output=HPF.ar(output, 1500);
	Out.ar(0,Pan2.ar(output ,SinOsc.kr(0.01, -2, 0.2, 0.5)));

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
	//var bus3=Bus.audio(s, 2);
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




			(0..3).do({if(freqvect[i]==1,  {0 }, {Synth.new("noiselow", [freq: [1000, 1500, 2000, 3000].choose, dur: [0.3, 0.5, 0.7,0.4, 1 ].choose ,amp: 1 , bus: ~bus3.index, pan: []]);
				Synth.new("verbok22", [ bus: ~bus3.index]);
			} );  i=i+1; delta.yield})








	}



});


)
b.play;

b.stop;

(
SynthDef(\noisehigh, {arg out=0,  freq=400, amp=0.2, dur, bus ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(0.1, -2, 0.3, 2.5) , 1.5);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur+0.2, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.0243, -0.3));
  // Out.ar(bus,Pan2.ar(sig*0.00100 ,0.2));



}).add;
)



(
SynthDef(\verbok23, {arg bus, d1=0.6, d2=0.27, d4=0.83, d3=0.233;
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
	deltimes = [171, 143, 145, 135] * 0.00185 - ControlDur.ir;


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


	a=Routine({
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
	//var bus4=Bus.audio(s, 2);
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




			(0..3).do({if(freqvect[i]==1,  {0 }, {Synth.new("noisehigh", [freq: [1000, 1500, 2000, 2500].choose, dur: [0.3 ].choose ,amp: 1 , bus: ~bus4.index, pan: []]);
				Synth.new("verbok23", [ bus: ~bus4.index]);
			} );  i=i+1; delta.yield})








	}



});


)
a.play;
b.play;
c.play;
n.play;
o.play;
m.play;
w.play;

a.stop;
b.stop;


w.stop;
c.stop;



(
SynthDef(\noise55, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10,  bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(3, 2.5, 1.4, 1.9));

	sig=sig*EnvGen.kr(Env.perc(0.04, 0.22, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.0364, 0));

		//Out.ar(bus, Pan2.ar(sig*0.00244, 0));




}).add;
)


(

	w=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,


			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,
			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,

			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,




			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,


			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,
			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,



			1, 1, 2, 2,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,





			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,


			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,
			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,
			1, 2, 2, 2,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,



			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,


			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,
			1, 1, 2, 1,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,
			1, 2, 1, 2,   1, 2, 2, 1,
		1, 1, 1, 1, 1, 1, 1, 2,





	];
	var a=1;
	var i=0;
//var bus33=Bus.audio(s,2);


	loop{

		delta=1.8/(8*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise55 , [freq:1375+[5, -5, 10, -10, -20, 30, 50, 100 ].choose , amp: a*2]);
			//Synth.new("verbok24", [ bus: bus33.index]);
		}
		);


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});
)
w.play;
c.play;

w.stop;



o.stop;
s.stopRecording;
s.reboot;












(
SynthDef(\delay444, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	deltimes = [101, 153, 145, 167] * 0.00004*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.14, 2.5, 1, 1.1), 2)- ControlDur.ir;
	//deltimes = [101, 153, 145, 187] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.001, 4.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 800);
output=HPF.ar(output, 20);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output*2 ,-0.2));

}).add;
)

(
SynthDef(
	\sawboh4, {|freq, amp, bus|
		var sig, sig2, sig3;

    sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2), 0, 2);
		sig = Mix.ar(LFSaw.ar(freq * [0.99, 1, 1.01, 2.02]));
		//sig=sig+SinOsc.ar(freq/1.5*SinOsc.kr(64, 0, 0.01, 2), 0, 0.3);
		//sig=sig+SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 2), 0, 0.5);

	sig=BPF.ar(sig, 3800*SinOsc.kr(0.025, -2, 0.65 ,0.95),3 );
		sig3=sig*EnvGen.kr(Env.perc(0.01, 4.5, 3.5, 0),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );




		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

//	sig=BPF.ar(sig, 3800*SinOsc.kr(0.015, -2, 0.65 ,0.95),2.5 );
		 sig3=LPF.ar(sig3, 2000);
		sig3=HPF.ar(sig3, 200);
//Out.ar(bus,Pan2.ar(sig3*0.00011112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.00385 ,0));

}).add;
)



(
SynthDef(
	\sawboh44, {|freq, amp, bus|
		var sig, sig2, sig3;

    sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2), 0, 2);
		sig = Mix.ar(LFSaw.ar(freq * [1, 1,  1,2.01]));
		//sig=sig+SinOsc.ar(freq/1.5*SinOsc.kr(64, 0, 0.01, 2), 0, 0.3);
		//sig=sig+SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 2), 0, 0.5);

	sig=BPF.ar(sig, 2800*SinOsc.kr(0.145, -2.5, 0.85 ,0.95),2 );
		sig3=sig*EnvGen.kr(Env.perc(0.01, 5.5, 3.5, 0),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );




		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

//	sig=BPF.ar(sig, 3800*SinOsc.kr(0.015, -2, 0.65 ,0.95),2.5 );
		 sig3=LPF.ar(sig3, 2000);
		sig3=HPF.ar(sig3, 200);
Out.ar(bus,Pan2.ar(sig3*0.00027112 ,-0.2));
		Out.ar(0,Pan2.ar(sig3*0.00345 ,0.1));

}).add;
)


(

//aggiungere note
	y=Routine({
	var delta;
	var freqvect=[

		67, 63, 62, 60, 1, 1, 1, 1, 1, 1, 1, 63, 1, 1, 65, 1,
		70, 67, 65, 63, 1, 1, 1, 1, 74, 1, 1, 75, 1, 1, 70, 1,
		70, 72, 70, 65, 1, 1, 1, 1, 74,1, 1, 1, 65, 1, 69, 1,
		70, 69, 65, 62 ,69, 1, 1, 1, 70, 1, 1, 1, 74, 1, 1, 1,


			67, 63, 62, 60, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 67, 65, 63, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 72, 70, 65, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 67, 69, 63 ,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,



			67, 63, 62, 60, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 67, 65, 63, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 72, 70, 65, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 65, 63, 62 ,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,



			67, 63, 62, 60, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 67, 65, 63, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 72, 70, 65, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		70, 67, 65, 62 ,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,



	];

//	var bus6=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/8;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {
			Synth.new("sawboh4", [freq: freqvect[i].midicps, amp: 1 , bus: ~bus6.index, pan: []]);
			Synth.new("sawboh44", [freq: freqvect[i].midicps, amp: 1 , bus: ~bus6.index, pan: []]);

		}

		);

	Synth.new( "delay444", [bus: ~bus6.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
y.play;
y.stop;
d.play;

s.record;

y.stop;
d.stop;




a.stop;
b.stop;


m.stop;
o.stop;

n.stop;
w.stop;
c.stop;

z.stop;
g.stop;
f.stop;

s.stopRecording;


s.record;

y.play;

f.play;

d.play;

g.play;

z.play;

m.play;
o.play;

c.play;
n.play;

w.play;

a.play;
b.play;


y.stop;
d.stop;

g.stop;

w.stop;

f.stop;

a.stop;
b.stop;

o.stop;

m.stop;

n.stop;

c.stop;

z.stop;






s.stopRecording;
