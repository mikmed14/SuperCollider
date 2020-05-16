s.boot;
s.reboot;
s.options.memSize=2*1024*1024;


(
SynthDef(
	\saw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);

		sig1=LFSaw.ar(freq.midicps, 0, 8.5, 0);
		sig1=BPF.ar(sig1, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
		sig1=sig1*EnvGen.kr(Env.perc(0.00008, 0.7, 1.7, -8),   doneAction: 2);



		//sig2=LFSaw.ar((freq+7).midicps, 0, 0.5, 0);
		//sig2=BPF.ar(sig2, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));



		sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 580*SinOsc.kr(0.4, -2.35, 3.95 ,4.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.0002, 0.9, 1.7, -4),   doneAction: 2);
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


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
	Out.ar(0,Pan2.ar(sig/5 ,0));

}).add;
)


(
SynthDef(\delay1, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.4, 0.40, 0.35, 0.33];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.000065 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.7, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 1000);
	output=HPF.ar(output, 100);
	Out.ar(0,Pan2.ar(output ,0));
	//Out.ar(0,output);

}).add;
)



(
SynthDef(
	\saw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 280*SinOsc.kr(0.2, -2.35, 1.95 ,2.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.0002, 0.7, 1.7, -2),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1800);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/200 ,0));
	Out.ar(0,Pan2.ar(sig/3.5 ,0));

}).add;
)

(


	a=Routine({
	var delta;
	var freqvect=[


		30, 30  ,30, 34, 30, 34,  1, 1,
	30, 30  ,	30, 34, 30, 34,  1, 1,
		30, 30  ,30, 34, 30, 34,  1, 1,
		30, 30  ,30, 34, 30, 34,  1, 1,
		30, 30  ,30, 34, 30, 34,  1, 1 ,
		30, 30  ,30, 34, 30, 34,  1, 1 ,
		30, 30  ,29, 37, 29, 37,  1, 1 ,
	30, 30  ,	29, 37, 29, 37,  1, 1,


		27, 27,27, 34, 27, 34,  1, 1,
		27, 27,27, 34, 27, 34,  1, 1,
		27, 27,27, 34, 27, 34,  1, 1,
	27, 27,	27, 34, 27, 34,  1, 1,

	27, 27,	27, 34, 27, 34,  1, 1,
	23, 23,	23, 34, 27, 34,  1, 1,
	23, 23,	23, 30, 23, 30,  1, 1,
	23, 23,	23, 30, 23, 30,  1, 1




	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.08;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			Synth.new( "delay1", [bus: bus2.index]);
		} );

	//


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
a.play;

a.stop;
s.record;

(


	b=Routine({
	var delta;
	var freqvect=[


30, 30, 30, 30, 30, 30, 29, 29,
		27, 27, 27, 27, 27, 23, 23, 23, 23,




	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.08*8;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			k6 = Synth.new( "delay1", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
a.play;

s.record;

(
var volume;
volume=Volume.new;
volume.volume=(-5);
)





(
SynthDef(
	\bass2, {|freq, amp, bus|
		var sig, sig2, sig3;




		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );

		sig2=BPF.ar(WhiteNoise.ar(1.8,0), 100)*EnvGen.kr(Env.perc(0.1, 1.75, 1.5, -8),   doneAction: 2);
		sig=sig+sig2;
		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.75, 1.5, -8),   doneAction: 2);

	   // sig=LPF.ar(sig, 1000);
		sig=HPF.ar(sig, 30);
		//sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*0.280,0));
	//	Out.ar(bus,Pan2.ar(sig,0));

}).add;
)

(


	c=Routine({
	var delta;
	var freqvect=[
35, 35, 35, 35




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
		delta=0.32/2;
		freq=freqvect[i];

		k1=Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

		i= if( i>=(3), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;

c.stop;




(
SynthDef(\noise55, {arg out=0,  freq=400, amp=0.2, dur , bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq-1000);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.15, -0.2));

Out.ar(bus,Pan2.ar(sig*0.01 ,0.2));


}).add;
)

(
SynthDef(\verbok0, {arg bus, d1=0.6, d2=0.27, d4=0.83, d3=0.233;
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
	deltimes = [101, 143, 165, 177] * 0.0015 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.95, 2.5, -3) ,  doneAction: 2);
	output=LPF.ar(output, 6000);
	output=HPF.ar(output, 4000);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[


1, 1, 1, 1, 1, 1, 1, 1,   1, 1, 1, 1, 1, 1, 1, 1,    2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1


	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=0.08/4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise55 , [freq:6500 , amp: a*2, bus:bus.index]);
			Synth.new("verbok0", [ bus: bus.index]);
		});


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});
)

m.play;


m.stop;



(
SynthDef(\noise1, {arg out=0,  freq=400, amp=0.2, dur ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+2000)*SinOsc.kr(2, 2, 0.5, 0.8));

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*1.5, -0.2));




}).add;
)

(
SynthDef(\noise2, {arg bus, freq, amp, dur;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1000)*SinOsc.kr(0.5, -2, 1.5, 1.8));

//	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.5, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur*0.5, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.81, -0.2));
    Out.ar(bus,Pan2.ar(sig*0.23 ,0.2));



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
	deltimes = [191, 163, 165, 177] * 0.00082 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
sig=sig*EnvGen.kr(Env.perc(0.01, 1, 3, -3) ,  doneAction: 2);

	Out.ar(0,Pan2.ar(sig*2 ,-0.2));

}).add;
)

(
SynthDef(\noise3, {arg out=0,  freq=400, amp=0.2, dur, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	//sig=BPF.ar(sig, freq+5000);
	sig=BPF.ar(sig, (freq)*SinOsc.kr(1, 2, 1, 1.2));
//	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur+0.5, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.45, -0.2));

//Out.ar(bus,Pan2.ar(sig*0.16 ,0.2));


}).add;
)



(
SynthDef(\noise4, {arg out=0,  freq=400, amp=0.2, bus, dur;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	//sig=BPF.ar(sig, freq+4000);
	sig=BPF.ar(sig, freq+3000);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*1.2, -0.2));
//Out.ar(bus,Pan2.ar(sig*0.12 ,0.2));



}).add;
)



(
SynthDef(\verbok, {arg bus, d1=0.6, d2=0.27, d4=0.83, d3=0.233;
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
	sig = sig * [d1+0.1, d2+0.2, d3+0.2, d4+0.1];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [141, 143, 195, 187] * 0.0025 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.9, 3, -3) ,  doneAction: 2);
	output=LPF.ar(output, 6000);
	output=HPF.ar(output, 3000);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(
		f=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;

//var bus=Bus.audio(s,2);




	var freq;
		var a=1.5;
	var i=0;
	var j=0;

var bus=Bus.audio(s,2);
	var bus2=Bus.audio(s,2);
	var bus3=Bus.audio(s,2);
	delta=0.08;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			//a= if (freqvect[i]==1,{ 0},{ 1 });




		case

		{ i==0} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==1} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus2.index  , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//Synth.new("verbok2", [ bus: bus2.index]);
		}
		{ i==2} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==3} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1,  bus: bus2.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			Synth.new("verbok2", [ bus: bus2.index]);
		}


			{ i==4} {b=Synth(\noise3 , [freq: [2836, 3162, 3598 ].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==5} {b=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==6} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==7} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);}

			{ i==8} {Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);  }
		{ i==9} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==10} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus.index , dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//Synth.new("verbok", [ bus: bus.index]);
			//f=Synth.new("verbok", [ bus: bus.index, d1:[0.2, 0.3, 0.4, 0.5].choose, d2:[0.2, 0.3, 0.4, 0.5].choose, d3:[0.2, 0.3, 0.4, 0.5].choose, d4:[0.2, 0.3, 0.4, 0.5].choose] );
		}
		{ i==11} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , bus: bus.index , dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose ]);
			//f=Synth.new("verbok", [ bus: bus.index, d1:[0.3, 0.4, 0.5, 0.6].choose, d2:[0.3, 0.4, 0.5, 0.6].choose, d3:[0.3, 0.4, 0.5, 0.6].choose, d4:[0.3, 0.4, 0.5, 0.6].choose ]);
		}

			{ i==12} {b=Synth(\noise1 , [freq: [2486, 3120, 3547].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==13} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==14} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==15} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose,  amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose ]); }






			{ i==16} {b=Synth(\noise2 , [freq: [2111, 3155, 3504].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==17} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus2.index  , dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			Synth.new("verbok2", [ bus: bus2.index]);
		}
		{ i==18} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==19} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1,  bus: bus2.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//Synth.new("verbok2", [ bus: bus2.index]);
		}


			{ i==20} {b=Synth(\noise2 , [freq: [2018, 3036, 3500].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==21} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==22} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==23} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);}

			{ i==24} {Synth(\noise2 , [freq: [2000, 3000, 3500, 4000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose , bus: bus.index ]);
			Synth.new("verbok2", [ bus: bus2.index]);
		}
		{ i==25} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==26} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//Synth.new("verbok2", [ bus: bus.index]);
		}
		{ i==27} {t=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000].choose, amp: 1 , bus: bus.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose ]);
		//Synth.new("verbok", [ bus: bus.index]);
		}

			{ i==28} {b=Synth(\noise4 , [freq: [2080, 3444, 3582].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==29} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==30} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==31} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose,  amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose ]); };




		  // b=Synth(\hola , [freq: (freqvect[i]).midicps, amp: a]);
		//	d=Synth(\hola , [freq: (freqvect[i]-5).midicps, amp: a]);
			//f=Synth(\hola, [freq: (freqvect[i]-12).midicps, amp: a]);
		//t=Synth(\hola , [freq: (freqvect[i]+7).midicps, amp: a]);

			//i= if( i>=7, {0}, {i+1});
 i= if( i>=31, {0}, {i+1});



	delta.yield;

	};

});

)

f.play;







(
SynthDef(
	\saw2bass1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/4*SinOsc.kr(64, 0, 0.01, 2));


		sig3=sig*EnvGen.kr(Env.perc(0.00001, 7, 2.5, -32),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );




		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 1000*SinOsc.kr(2.1, 3.25, 2 ,2.05));
		 sig3=LPF.ar(sig3, 6000);
		sig3=HPF.ar(sig3, 500);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.205 ,-0.2));

}).add;
)







Synth.new("saw2bass1", [freq: 35.midicps, amp: 1 ]);



(


	q=Routine({
	var delta;
	var freqvect=[73, 66, 70, 65, 66, 63];

	var busdelaynew=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.04;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("saw2bass1", [freq: freqvect.choose.midicps, amp: 1 , bus: busdelaynew.index]);} );

	//Synth.new( "delaynew", [bus: busdelaynew.index]);


    i= if( i>=5, {0}, {i+1});

		 delta.yield;
	}


});


)
q.play;
g.play;
q.stop;




(
SynthDef(
	\sine1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 1, 1.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -4),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*10, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq+19).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 5, 1, 0),   doneAction: 0);



sig=sig*EnvGen.kr(Env.perc(0.08, 7, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 258*SinOsc.kr(1.8, 2, 1.9 ,2.5));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 300);


		Out.ar(0,Pan2.ar(sig3*0.2813 ,0));
		Out.ar(bus,Pan2.ar(sig3/30 ,0));

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
	deltimes = [191, 153, 145, 187] * 0.0005 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.4, 1, 0) ,  doneAction: 2);
output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output ,0));

}).add;
)


(


	k=Routine({
	var delta;
	var freqvect=[
     54,1,  1, 1,  1, 1,   58, 1,
	1, 1,   1, 1,   54, 1,  1, 1,

		53, 1,  1, 1,  1, 1,   1, 1,
		1, 1,   1, 1,   1, 1,   54, 53,


		51, 1,    1, 1,   1, 1,   1, 1,

		1, 1,   1, 1,     46, 1,  1, 1,


		49,1 ,  1, 1,   1, 1,   47, 1,
		1, 1,  1, 1,   46, 1,  1, 1


	];




	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.16;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine1", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

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
SynthDef(
	\saw4, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.7, 10.5, 10.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 200*SinOsc.kr(0.065, -2, 3.65 ,4.05));
		 sig3=LPF.ar(sig3, 1600);
		sig3=HPF.ar(sig3, 200);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.385 ,0.1));

}).add;
)


(


	z=Routine({
	var delta;
	var freqvect=[1, 1,1, 1, 1, 1, 1, 1,   63,1, 1, 1, 1, 1, 1,  61 ,
		1, 1,1, 1, 1, 1, 1, 1,   63,1, 1, 1, 1, 1, 1,  66
	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.16*4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("saw4", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []])   ;} );

	//Synth.new( "delay", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;

z.stop;




(


	j=Routine({
	var delta;
	var freqvect=[
     58,1,  1, 1,  1, 1,   1, 1,
	1, 1,   1, 1,   1, 1,  1, 1,

		61, 1,  1, 1,  1, 1,   63, 1,
		1, 1,   1, 1,   1, 1,   1, 58,


		65, 1,    1, 1,   1, 1,   63, 1,

		1, 1,   1, 1,     65, 1,  1, 1,


		66,1 ,  1, 1,   1, 1,   65, 1,
		1, 1,  1, 1,   61, 1,  1, 1


	];




	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.16;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine1", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			k6 = Synth.new( "ambdelay", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
j.play;

j.stop;



(
SynthDef(
	\saw2, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 2));
		sig=sig+SinOsc.ar(freq*2*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.01, 3.5, 1.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 2800*SinOsc.kr(5.5, -2.5, 1.95 ,2.05));
		 sig3=LPF.ar(sig3, 5600);
		sig3=HPF.ar(sig3, 1800);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.185 ,-0.3));

}).add;
)

(


	h=Routine({
	var delta;
	var freqvect=[85, 83, 82, 78, 82, 78, 77, 73];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.16*4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("saw2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);} );

	//Synth.new( "delay", [bus: bus2.index]);


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});


)
h.play;

h.stop;





(
SynthDef(
	\saw3, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.01, 6.5, 6.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=sig;
		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 2200*SinOsc.kr(0.35, 2, 0.65 ,1.05));
		 sig3=LPF.ar(sig3, 4500);
		sig3=HPF.ar(sig3, 800);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.1505 ,-0.1));

}).add;
)




(


	l=Routine({
	var delta;
	var freqvect=[1, 1,1, 1, 1, 1, 77, 73,   70,1, 1, 70, 71, 70, 66,  73 ];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.16*4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("saw3", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);} );

	//Synth.new( "delay", [bus: bus2.index]);


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
l.play;

l.stop;








c.stop;
m.stop;
f.stop;

l.stop;


h.stop;
g.stop;
q.stop;


k.stop;
j.stop;

z.stop;



a.stop;
b.stop;



s.stopRecording;




(
SynthDef(
	\saw3, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.1, 6.5, 6.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=sig;
		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 1200*SinOsc.kr(1.35, 2, 0.55 ,1.05));
		 sig3=LPF.ar(sig3, 3000);
		sig3=HPF.ar(sig3, 200);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.15005 ,-0.1));

}).add;
)