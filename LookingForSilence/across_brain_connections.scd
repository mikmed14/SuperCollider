


s.boot;
s.options.memSize=2*1024*1024;
s.reboot;




38.midicps;
(
SynthDef(
	\abcsaw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3 = Mix.ar(LFSaw.ar((freq).midicps * [1, 1, 2,  2,2.01], 0, 1*[ 0.1, 0.2, 1, 1, 1 ]));
		sig3=BPF.ar(sig3, 180*SinOsc.kr(0.66, -2.9, 3.95 ,4));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 1.6, 1.7, -6),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1000);
	sig=HPF.ar(sig, 30);
 Out.ar(bus,Pan2.ar(sig*2.5 ,0));
 Out.ar(0,Pan2.ar(sig*1.2 ,0));

}).add;
)


(
SynthDef(
	\abcsaw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq).midicps * [1.001, 0.5,  1, 2.01]));
	//	sig3=BPF.ar(sig3, 80*SinOsc.kr(0.2, -2.5, 8 ,8.05), 1);
		sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.4, -2.2, 1,1.05));
		sig3=sig3*EnvGen.kr(Env.perc(1.9999, 3, 3, 0),   doneAction: 2); //20-0.02
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


Out.ar(bus,Pan2.ar(sig*13 ,0));
	Out.ar(0,Pan2.ar(sig*1.2 ,0));//10-1.5

}).add;
)





//OCCHIO AL VOLUME


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
	deltimes = [191, 153, 145, 187] * 0.00006*SinOsc.kr(2.5, 0, 0.5, 0.8) - ControlDur.ir;


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

		var freqvect2=[1, 1,   36, 1,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 36, 1,
	1, 1,   36, 1,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 36, 1,

	1, 1,   36, 1,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 1, 36,
	1, 1,   36, 1,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 1, 36,


	1, 1,   36, 1,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 36, 1,
	1, 1,   36, 1,  36, 1,  1, 1,  36, 1,  1, 1,  36, 1, 36, 1,

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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("abcsaw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);
			Synth.new("abcsaw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

		}
		);

	k6 = Synth.new( "abcdelay7", [bus: bus2.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
w.play;



(
var volume;
volume=Volume.new;
volume.volume=(-30);
)

s.record;

z.stop;


s.record;


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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("abcsaw5", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	k6 = Synth.new( "abcdelay7", [bus: bus2.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;
z.play;

s.record;


k.play;

w.stop;
z.stop;





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

		Out.ar(0,Pan2.ar(sig*3.83,0));
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
SynthDef(\noiselow, {arg out=0,  freq=400, amp=0.2, dur, bus ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1000);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*1.5, -0.2));
 Out.ar(bus,Pan2.ar(sig*0.10 ,0.2));



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
	deltimes = [121, 143, 165, 157] * 0.00085 - ControlDur.ir;
	//deltimes = [181, 183, 155, 177] * 0.0001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.2, 3, -3) ,  doneAction: 2);
	output=LPF.ar(output, 3500);
	Out.ar(0,Pan2.ar(output*2 ,0));

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
SynthDef(
	\saw4, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq.midicps*SinOsc.kr(64, 0, 0.01, 2));
		//sig=sig+LFSaw.ar((freq+12).midicps*SinOsc.kr(64, 0, 0.01, 2));

//sig3 = Mix.ar(LFSaw.ar((freq).midicps * [1,1,  1,1.01]));
	//	sig = sig3+Mix.ar(LFSaw.ar((freq+12).midicps * [1,1,  1,1.01]));

		sig=sig*EnvGen.kr(Env.perc(3, 8.5, 3.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 800*SinOsc.kr(10.065, -2.5, 1.65 ,4.05));
		 sig3=LPF.ar(sig3, 1600);
		sig3=HPF.ar(sig3, 800);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*1.75 ,-0.2));

}).add;
)




(
SynthDef(
	\saw8, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq.midicps*SinOsc.kr(64, 0, 0.01, 2));
		sig=sig+LFSaw.ar((freq+12).midicps*SinOsc.kr(64, 0, 0.01, 2));
//sig3 = Mix.ar(LFSaw.ar((freq).midicps * [1,2,  2,2.01]));
	//	sig3 = sig3+Mix.ar(LFSaw.ar((freq-12).midicps * [1,1,  1,1.01]));


		sig=sig*EnvGen.kr(Env.perc(2, 8.5, 3.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 1800*SinOsc.kr(10.065, -2.5, 1.65 ,2.05));
		 sig3=LPF.ar(sig3, 3500);
		sig3=HPF.ar(sig3, 800);

//Out.ar(bus,Pan2.ar(sig3*0.00112 ,0));
		Out.ar(0,Pan2.ar(sig3*0.55 ,0.2));

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
SynthDef(\noise5, {arg out=0,  freq=600, amp=0.2, dur ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq-500);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, 1, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.85, -0.2));




}).add;
)





(
SynthDef(\noise6, {arg out=0,  freq=400, amp=0.2, dur ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq*SinOsc.kr(1, 0, 0.6, 1));

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.6, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.65, -0.2));




}).add;
)



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
//var bus=Bus.audio(s,2);


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
n.stop;








(
SynthDef(
	\sine2, {|freq, amp, bus|
		var sig, sig2, sig3;


sig = Mix.ar(SinOsc.ar((freq).midicps * [2, 3.9999, 4.001, 4.01], 0, 1*[ 0.1, 0.1, 0.1, 0.1, 1, 1 ]));



sig=sig*EnvGen.kr(Env.perc(0.2, 6, 3.7, 0),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 558*SinOsc.kr(0.001, -2.2, 1.4 ,1.5));
    sig3=LPF.ar(sig3, 2000);
	sig3=HPF.ar(sig3, 300);


	//	Out.ar(0,Pan2.ar(sig3*1.2013 ,0.2));
		Out.ar(bus,Pan2.ar(sig3/2 , 0.2));

}).add;
)








s.boot;
/*
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
		if(freqvect[i]==1,  {0 }, {Synth.new("sine2", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]); //sine2

			Synth.new( "ambdelay2", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
j.play;


//STOP J

j.stop;
*/


(
SynthDef(
	\sine111, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);



		sig3 = Mix.ar(SinOsc.ar((freq).midicps * [1, 2.0,  0.999,0.99, 2.01, 2.02, 4]  , 1*[0.5, 0.9, 1.1, 1.4, 2, 0.7, 0.3]));
	//	sig3=SinOsc.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 2600*SinOsc.kr(0.1, -2, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.4, 0.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2400);
	sig=HPF.ar(sig, 250);


		Out.ar(bus,Pan2.ar(sig3/150 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)


(
SynthDef(\delay4411, {arg bus, d=0.00007;
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
output=output*EnvGen.kr(Env.perc(1, 1.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 1800);
output=HPF.ar(output, 300);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(


	l=Routine({
	var delta;
	var freqvect=[


        67, 63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,

		       67, 63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,
		67,63, 60, 63,



		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,




		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,
		67,63, 58, 63,

		62,  58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,



				62,  58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,
		62, 58, 55,  58,

		63,  60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,


			63,  60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,
		63, 60, 56, 60,





	];




	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=14.4/256;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("sine111", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]); //sine2

			Synth.new( "delay4411", [bus: bus2.index]);
		} );

	//


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});


)
l.play;
l.stop;








(
SynthDef(
	\sine3, {|freq, amp, bus|
		var sig, sig2, sig3;


		//sig = Mix.ar(SinOsc.ar((freq+12).midicps * [1, 0.9999, 2.001, 2, 0.99, 4.01, 4.02, 4.03], 1*[0.1, 0.3, 1, 1.4, 2.5, 1.66, 0.6, 0.27] ));
		sig = Mix.ar(SinOsc.ar((freq+12).midicps * [1, 0.9999, 2.001, 2, 0.99, 4.01, 4.02, 4.03], 1*[1, 1.15, 1.12, 1.17, 1.16, 1.15, 1.19, 1.11 ] ));



sig=sig*EnvGen.kr(Env.perc(0.02, 3, 2.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2058*SinOsc.kr(0.01, -2.2, 1.4 ,1.5));
    sig3=LPF.ar(sig3, 7500);
	sig3=HPF.ar(sig3, 1000);


	//	Out.ar(0,Pan2.ar(sig3*1.2013 ,0.2));
		Out.ar(bus,Pan2.ar(sig3/12.5 , 0.2));

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
	deltimes = [181, 123, 130, 177] * (0.00008) - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.4, 2.7, 0) ,  doneAction: 2);
//output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output ,0));

}).add;
)


(


	k=Routine({
	var delta;
	var freqvect=[
    60, 55, 1,  55,    60, 62, 63, 67,    1, 65, 1, 65,   63, 62, 63, 55,
	58, 55, 1, 55, 	58, 55, 58, 60 ,   1, 58, 1, 58,   56, 55, 56, 51






	];




	var bus22=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("sine3", [freq: freqvect[i], amp: 1 , bus: bus22.index, osc: [1, 0.8, 0.5, 0.6, ].choose]); //sine2

			Synth.new( "ambdelay2", [bus: bus22.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
k.play;


//STOP J

k.stop;


// STOP B e C
b.stop;
c.stop;


//STOP M e N

m.stop;
n.stop;



//cambia aumenta freq fino a 1000-1500

(
SynthDef(
	\abcsaw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3 = Mix.ar(LFSaw.ar((freq).midicps * [1, 1, 2,  2,2.01], 0, 1*[ 0.1, 0.2, 1, 1, 1 ]));
		sig3=BPF.ar(sig3, 680*SinOsc.kr(1.5, -2.9, 3.95 ,4));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 0.55, 0.55, -6),   doneAction: 2);//0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);0

		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2000);
	sig=HPF.ar(sig, 30);
 Out.ar(bus,Pan2.ar(sig*28.5 ,0));
 Out.ar(0,Pan2.ar(sig*1.2 ,0));

}).add;
)



// cambia qua!!

(
SynthDef(
	\abcsaw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, 120*SinOsc.kr(0.01, -2.3, 4 ,4.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 1.5, 1.5, -8),   doneAction: 2); //20-0.02
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


Out.ar(bus,Pan2.ar(sig*12 ,0));
	Out.ar(0,Pan2.ar(sig*4 ,0));//10-1.5

}).add;
)

//aggiungi saw16
/*

(
SynthDef(
	\saw16, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;






		sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3 = Mix.ar(SinOsc.ar((freq+12).midicps * [1,  2, 2.01, 1, 0.9999, 4.007], 2));
		sig3=BPF.ar(sig3, 2580*SinOsc.kr(0.01, -1.5, 0.95 ,1));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 3.5, 1.7, -4),   doneAction: 2);//0.02



sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 800*SinOsc.kr(5, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 1200);
	sig=HPF.ar(sig, 850);


	//Out.ar(bus,Pan2.ar(sig*1.85 ,0.2));
	  Out.ar(0,Pan2.ar(sig*6 ,-0.2));

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
	sig = sig * [0.33, 0.27, 0.25, 0.33];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.00005 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.1, 1.6, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 3500);  //1500
	Out.ar(0,Pan2.ar(output/10 ,0.2));

}).add;
)




(
SynthDef(
	\sine1111, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);



sig3 = Mix.ar(SinOsc.ar((freq+12).midicps * [ 2, 2.01, 2.01, 4.01]  ));
	//	sig3=SinOsc.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 1600*SinOsc.kr(0.1, -2, 1.04 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(1, 0.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2400);
	sig=HPF.ar(sig, 150);


		Out.ar(bus,Pan2.ar(sig3/200 ,0));
Out.ar(0,Pan2.ar(sig*2 ,0));

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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine1111", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	//k6 = Synth.new( "delay8", [bus: bus2.index]);


    i= if( i>=511, {0}, {i+1});

		 delta.yield;
	}


});


)

a.play;

a.stop;

*/



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

n.stop;
m.stop;






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
m.play;

v.stop;






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





(


	k=Routine({
	var delta;
	var freqvect=[
    60, 55, 1,  55,    60, 62, 63, 67,    1, 65, 1, 65,   63, 62, 63, 55,
	58, 55, 1, 55, 	58, 55, 58, 60 ,   1, 58, 1, 58,   56, 55, 56, 51






	];




	var bus22=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.8/4;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("sine3", [freq: freqvect[i], amp: 1 , bus: bus22.index, osc: [1, 0.8, 0.5, 0.6, ].choose]); //sine2

			Synth.new( "ambdelay2", [bus: bus22.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
k.play;





//---------------------------------------------------------------------------------------------------------------------------//

s.record;




x.stop;
p.stop;




b.stop;
k.stop;



v.stop;
n.stop;
m.stop;


l.stop;
z.stop;
w.stop;
Synth.new("bass2", [freq: 30, amp: 0.75 ]);
s.stopRecording;