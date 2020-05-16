
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;


[73, 66, 70, 65, 66, 63]

[54, 53, 51, 47]
[58, 58, 54, 51]
[61, 61, 58, 54]

[42, 34, 39, 35]



(
SynthDef(
	\peassaw2bass2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.01, 1.3, 1.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 500*SinOsc.kr(1.4, 3, 3.95 ,4.05));
		 sig3=LPF.ar(sig3, 5600);
		sig3=HPF.ar(sig3, 3800);


		Out.ar(0,Pan2.ar(sig3*2.84 ,-0.3));

}).add;
)


(


	y=Routine({
	var delta;
	var freqvect11=[46, 49, 46, 44];
	var freqvect12=[46, 49, 51, 49];
	var freqvect13=[46, 44, 46, 49];
	var freqvect14=[46, 44, 46, 51];

	var freqvect15=[49, 46, 49, 51];
	var freqvect16=[49, 51, 49, 46];
	var freqvect17=[49, 46, 51, 46];

	var freqvect18=[51, 49, 46, 49];
	var freqvect19=[51, 49, 46, 49];



	var freqvect21=[46, 49, 46, 44];
	var freqvect22=[46, 49, 51, 49];
	var freqvect23=[46, 44, 46, 49];
	var freqvect24=[46, 44, 46, 51];

	var freqvect25=[49, 46, 49, 51];
	var freqvect26=[49, 51, 49, 46];
	var freqvect27=[49, 46, 51, 46];

	var freqvect28=[51, 49, 46, 49];
	var freqvect29=[51, 49, 46, 49];

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



		delta=0.9/12;
	delta1=delta*4;
	loop{

		case {i<=3}
		{
			j=4;
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
		{freqvect=freqvect18}
		{index==9}
		{freqvect=freqvect19};


		j=0;




		(0..3).do({if(freqvect[j]==1,  {0 }, {Synth.new("peassaw2bass2", [freq: freqvect[j].midicps, amp: 1 , bus: bus2.index, pan: []]);} );  j=j+1; delta.yield})

		}



	{i>=3}


			{

			index=[1, 2, 3, 4, 5, 6, 7, 8, 9].choose;

			case {index==1}
			{freqvect=freqvect21}
		{index==2}
		   {freqvect=freqvect22}
		{index==3}
  		   {freqvect=freqvect23}
		{index==4}
	       {freqvect=freqvect24}
		{index==5}
	   	{freqvect=freqvect25}
		{index==6}
		{freqvect=freqvect26}
		{index==7}
		{freqvect=freqvect27}
		{index==8}
		{freqvect=freqvect28}
		{index==9}
		{freqvect=freqvect29};

		j=0;








		(0..3).do({if(freqvect[j]==1,  {0 }, {Synth.new("saw2bass2", [freq: freqvect[j].midicps, amp: 1 , bus: bus2.index, pan: []]);} );  j=j+1; delta.yield})


		};


		//delta1.yield;

	}
		//freq=freqvect[i];
		//k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw2bass1", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);} );

	//k6 = Synth.new( "delay7", [bus: bus2.index]);








});


)
y.play;

s.record;

y.stop;



(
SynthDef(
	\peasbass2, {|freq, amp, bus|
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
		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.75, 1.5, -8),   doneAction: 2);

	   // sig=LPF.ar(sig, 1000);
		sig=HPF.ar(sig, 30);
		//sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*0.58,0.2));
	//	Out.ar(bus,Pan2.ar(sig,0));

}).add;
)



(


	c=Routine({
	var delta;
	var freqvect=[
				35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,



			35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,



			35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,


			35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,



			35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,


				35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,



				35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 35, 1,


				35, 1, 1, 35,
		35,1, 35, 1,
		35,1, 1, 1,
		35, 1, 1, 1,




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
		delta=1.8/16;
		freq=freqvect[i];

		//k1=Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);
			if (freqvect[i]==1,{ 0},{ Synth(\peasbass2 , [freq:35 , amp: a*2]   ); }) ;

		i= if( i>=(16*8-1), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;
d.stop;

c.stop;


(
SynthDef(\peasnn, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq-50);

	sig=sig*EnvGen.kr(Env.perc(0.01, 0.15, 0.1, 0), doneAction:2);
	Out.ar(out, Pan2.ar(sig*28.944, 0));




}).add;
)


(


	p=Routine({
	var delta;
	var freqvect=[
				1, 1, 1, 1,





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
		delta=1.8/16;
		freq=freqvect[i];

		//k1=Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);
			if (freqvect[i]==2,{ 0},{ Synth(\peasnn , [freq:100 , amp: a*2]   ); }) ;

		i= if( i>=(16*8-1), {0}, {i+1});

		 delta.yield;
	}


});
)
p.play;
c.play;

p.stop;



(
SynthDef(\peasnoise3, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+3000);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig/2, 0));
Out.ar(bus,Pan2.ar(sig*0.212 ,0.2));



}).add;
)







(
SynthDef(\peasverbok, {arg bus, d4=0.6, d3=0.27, d1=0.63, d2=0.53;
	var input, output, delrd, sig, deltimes, out;

	// Choose which sort of input you want by (un)commenting these lines:
	//input = Pan2.ar(PlayBuf.ar(2, b, loop: 0), -0.5); // buffer playback, panned halfway left
	//input = SoundIn.ar([0,1]); // TAKE CARE of feedback - use headphones
	//input = Dust2.ar([0.1, 0.01]); // Occasional clicks
    input=In.ar(bus);
	// Read our 4-channel delayed signals back from the feedback loop
	out= FreeVerb.ar(input,0.3, 0.5, 0.3, 1, 0);
	out=out*EnvGen.kr(Env.perc(0.001, 2.5, 1, 0), doneAction: 2);

	// This will be our eventual output, which will also be recirculated

	// Cross-fertilise the four delay lines with each other:
	//sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
	//sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
	// Attenutate the delayed signals so they decay:
	//sig = sig * [0.63, 0.53, 0.27, 0.6];
//sig = sig * [d1+0.2, d2+0.25, d3+0.45, d4+0.4];
	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
//	deltimes = [101, 143, 165, 177] * 0.007 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	//LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
//output=output*EnvGen.kr(Env.perc(0.01, 1.65, 3, -4) ,  doneAction: 2);

	Out.ar(0,Pan2.ar(out*4 ,0.2));

}).add;
)


(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



		1, 1,  2, 1,  1,1,  2,1,  1,1,  2,1,  1,1,  2,1,
		1, 1,  2, 1,  1,1,  2,1,  1,1,  2,1,  1,1,  2,2,
			1, 1,  2, 1,  1,1,  2,1,  1,1,  2,1,  2,1,  2,2,
		1, 1,  2, 1,  1,1,  2,1,  2,2,  2,1,  2,2,  2,1,


	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/(8*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\peasnoise3 , [freq:1000 , amp: a*2, bus: bus.index]);
			Synth.new("peasverbok", [ bus: bus.index]);
		});


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;

m.stop;



(
SynthDef(\peasnoise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.244, 0));




}).add;
)


(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,


		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,


		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 2,
		1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1,
		1, 1, 1, 1,   2, 1, 1, 1



	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/(8*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\peasnoise4 , [freq:1500 , amp: a*2]); });


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;

n.stop;



(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);

		sig1=LFSaw.ar(freq.midicps, 0, 8.5, 0);
		sig1=BPF.ar(sig1, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
		sig1=sig1*EnvGen.kr(Env.perc(0.00008, 0.7, 1.7, -8),   doneAction: 2);



		//sig2=LFSaw.ar((freq+7).midicps, 0, 0.5, 0);
		//sig2=BPF.ar(sig2, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));



		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 580*SinOsc.kr(0.8, -2.5, 3.95 ,4.0));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 0.7, 0.7, -4),   doneAction: 2);
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


		Out.ar(bus,Pan2.ar(sig3/2 ,0));
	Out.ar(0,Pan2.ar(sig*3 ,0));

}).add;
)





(
SynthDef(
	\peassaw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);

		sig1=LFSaw.ar(freq.midicps, 0, 8.5, 0);
		sig1=BPF.ar(sig1, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
		sig1=sig1*EnvGen.kr(Env.perc(0.00008, 0.7, 0.7, -8),   doneAction: 2);



		//sig2=LFSaw.ar((freq+7).midicps, 0, 0.5, 0);
		//sig2=BPF.ar(sig2, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));



		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 580*SinOsc.kr(0.8, -2.5, 3.95 ,4.0));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 2.0, 2.0, -8),   doneAction: 2);
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


		Out.ar(bus,Pan2.ar(sig3/60 ,0));
	Out.ar(0,Pan2.ar(sig/1.8 ,0));

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
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)



(


	a=Routine({
	var delta;
	var freqvect=[


		39, 39, 39, 1,  1, 39, 39, 1,   1, 1, 39, 1, 1, 39, 39, 1,
		39, 39, 39, 1,  1, 39, 39, 1,   1, 1, 39, 1, 1, 39, 39, 1,

		35, 35, 35, 1,  1, 35, 35, 1,   1,  1, 35, 1, 1, 35, 35, 1,
		37, 37, 37, 1,  1, 37, 37, 1,   1, 1,  37, 1, 1,  37, 37, 1




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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw5", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);

			k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
a.play;

(


	z=Routine({
	var delta;
	var freqvect=[

		1, 1, 1, 46,  1, 1, 42, 1,  1, 46, 1, 1,  42, 1, 46, 1





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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

	//k6 = Synth.new( "delay7", [bus: bus2.index]);


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
a.play;

a.stop;
z.stop;



(
SynthDef(\peasnoise, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1000);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.815, 0));




}).add;
)

(

	k=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[

		2, 1, 2, 1, 2, 1, 2, 1,
		2, 1, 2, 1, 2, 1, 2, 1,
		2, 1, 2, 2, 2, 1, 2, 1,
		2, 1, 2, 1, 2, 1, 2, 2


	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=1.8/(16*2);
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\peasnoise , [freq:4000 , amp: a*2]); });


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});
)
k.play;

k.stop;



//AGGIUNGI

(
SynthDef(
	\peassaw5, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);

		sig1=LFSaw.ar(freq.midicps, 0, 8.5, 0);
		sig1=BPF.ar(sig1, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
		sig1=sig1*EnvGen.kr(Env.perc(0.00008, 0.7, 0.7, -8),   doneAction: 2);



		//sig2=LFSaw.ar((freq+7).midicps, 0, 0.5, 0);
		//sig2=BPF.ar(sig2, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));



		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 580*SinOsc.kr(0.8, -2.5, 3.95 ,4.0));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 2.0, 2.0, -8),   doneAction: 2);
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


		Out.ar(bus,Pan2.ar(sig3/60 ,0));
	Out.ar(0,Pan2.ar(sig/1.8 ,0));

}).add;
)






(
SynthDef(
	\peassaw2bass1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 3.5, 1.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.25, -2.5, 0.95 ,1.05));
		 sig3=LPF.ar(sig3, 5600);
		sig3=HPF.ar(sig3, 800);

Out.ar(bus,Pan2.ar(sig3*0.04112 ,0));
		Out.ar(0,Pan2.ar(sig3*1.215 ,-0.3));

}).add;
)




(
SynthDef(\peasdelay, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.4, 0.47, 0.45, 0.63];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.0006 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 4.4, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 4500);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)

(


	q=Routine({
	var delta;
	var freqvect=[73, 66, 70, 65, 66, 63];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.15;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("peassaw2bass1", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);} );

	Synth.new( "peasdelay", [bus: bus2.index]);


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
	\peasamb1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*3.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.0001, 3, 1.7, -8),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
	//	sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -2),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq+7).midicps, 0, amp/2, 0)*EnvGen.kr(Env.perc(1, 3, 1, -2),   doneAction: 2);



sig=sig*EnvGen.kr(Env.perc(1.8, 10, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 1380*SinOsc.kr(1.2, -3, 1.1 ,2));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 30);


	//	Out.ar(0,Pan2.ar(sig3*2.825 ,0));
		Out.ar(bus,Pan2.ar(sig3 ,0));

}).add;
)








(
SynthDef(
	\peasamb2, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*4.5, 0)*EnvGen.kr(Env.perc(0.001, 3
			, 1.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+24).midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.0001, 3, 1.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -2),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*5, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -2),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq+7).midicps, 0, amp/8, 0)*EnvGen.kr(Env.perc(0.001, 3, 1, -2),   doneAction: 2);



sig=sig*EnvGen.kr(Env.perc(1.8, 5, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2380*SinOsc.kr(0.2, -3, 2 ,2.1));
    sig3=LPF.ar(sig, 5000);
	sig3=HPF.ar(sig3, 30);


	//	Out.ar(0,Pan2.ar(sig3*1.3166 ,0));
		Out.ar(bus,Pan2.ar(sig3 ,0));

}).add;
)








(
SynthDef(
	\peasamb3, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.001, 1, 1.7, -8),   doneAction: 0);
		sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*4.5, 0)*EnvGen.kr(Env.perc(0.001, 2, 1.7, -4),   doneAction: 0);
		//sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*10, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq+19).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 5, 1, 0),   doneAction: 0);



sig=sig*EnvGen.kr(Env.perc(1.8, 7, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 380*SinOsc.kr(4.2, -3, 2.1 ,4));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 300);


	//	Out.ar(0,Pan2.ar(sig3*3.0313 ,0));
		Out.ar(bus,Pan2.ar(sig3 ,0));

}).add;
)

(
SynthDef(\peasambdelay, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output/2 ,-0.2));

}).add;
)




(

		d=Routine
		(
			{

	var bus3=Bus.audio(s, 2);
	var bus4=Bus.audio(s, 2);
	var bus5=Bus.audio(s, 2);
	var delta;
	var g=0;
	var b=0;
	var c=0;
	var v=0;
		var e=0;
		var f=0;

		var freqvect=[54, 53, 51, 47];
		var freqvect2=[58, 58, 54, 51];
		var freqvect3=[61, 61, 58, 54];

		var a=1.5;
	var i=0;
	var j=0;


	delta=1.8;

	loop {

		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });

g=if(freqvect[i]==1,  {0}, {Synth.new("peasamb1", [freq: freqvect[i], amp: 1 , bus: bus3.index]);} );
			b=if(freqvect[i]==1,  {0}, {Synth.new("peasamb2", [freq: freqvect2[i], amp: 1 , bus: bus3.index]);} );
			c=if(freqvect[i]==1,  {0}, {Synth.new("peasamb3", [freq: freqvect3[i], amp: 1 , bus: bus3.index]);} );
			v=if(freqvect[i]==1,  {0}, {Synth.new("peasambdelay", [ bus: bus3.index]);} );






 i= if( i>=3, {0}, {i+1});



	delta.yield;

	};

});

	)



d.play;
q.play;
d.stop;





(
SynthDef(
	\peassaw2bassend1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));
		sig=sig+LFSaw.ar(freq*2*SinOsc.kr(64, 0, 0.01, 1));
		//sig=sig+LFSaw.ar(freq*4.01*SinOsc.kr(64, 0, 0.002, 1));
		sig=sig+LFSaw.ar(freq*1.5*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.1, 13, 10, -8),   doneAction: 2);









		sig3=BPF.ar(sig3, 2000*SinOsc.kr(16, -1.5, 2.9 ,3.1));

		 sig3=LPF.ar(sig, 3500);
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.16258 ,0))

}).add;
)


(
SynthDef(
	\peassaw2bassend2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));
		sig=sig+LFSaw.ar(freq*3*SinOsc.kr(64, 0, 0.005, 1));
		sig=sig+LFSaw.ar(freq*2*SinOsc.kr(64, 0, 0.01, 1));
			//sig=sig+LFSaw.ar(freq*3*SinOsc.kr(64, 0, 0.0025, 1));
		sig=sig+LFSaw.ar(freq*7*SinOsc.kr(64, 0, 0.0035, 1));


		sig=sig*EnvGen.kr(Env.perc(0.1, 6.5, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 2000*SinOsc.kr(8.5, -1.5, 2.9 ,3.1));  //non piu di 3000
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*1.31458 ,0))

}).add;
)






(


	r=Routine({
	var delta;
	var freqvect=[75,1, 1, 1,   1, 77, 78, 87,   82, 1, 1, 1,    80,1,  78, 77 ];

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

		case
			{i==0}
	    	{
				Synth.new("peassaw2bassend1", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}


			{i==1}
	    	{
	b=0;
			}

					{i==2}
	    	{
	b=0;
			}

					{i==3}
	    	{
	b=0;
			}





					{i==4}
	    	{
	b=0;
			}

				{i==5}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

				{i==6}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

				{i==7}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}




				{i==8}
	    	{
				Synth.new("peassaw2bassend1", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

							{i==9}
	    	{
	b=0;
			}

							{i==10}
	    	{
	b=0;
			}

							{i==11}
	    	{
	b=0;
			}





					{i==12}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

									{i==13}
	    	{
	b=0;
			}

					{i==14}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}


					{i==15}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			};






    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
r.play;

r.stop;




(


	t=Routine({
	var delta;
	var freqvect=[75,1, 1, 1,    1, 75,77, 82,  78,  1, 1, 1,     77, 1, 73, 70];

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

		case
			{i==0}
	    	{
				//Synth.new("saw2bassend1", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				//Synth.new( "delay", [bus: bus2.index]);

			}


			{i==1}
	    	{
	b=0;
			}

					{i==2}
	    	{
	b=0;
			}

					{i==3}
	    	{
	b=0;
			}





					{i==4}
	    	{
	b=0;
			}

				{i==5}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

				{i==6}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

				{i==7}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}




				{i==8}
	    	{
				Synth.new("peassaw2bassend1", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

							{i==9}
	    	{
	b=0;
			}

							{i==10}
	    	{
	b=0;
			}

							{i==11}
	    	{
	b=0;
			}





					{i==12}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}

									{i==13}
	    	{
	b=0;
			}

					{i==14}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			}


					{i==15}
	    	{
				Synth.new("peassaw2bassend2", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);
				Synth.new( "peasdelay", [bus: bus2.index]);

			};






    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
t.play;
r.play;

t.stop;



(
SynthDef(\peasnoise5, {arg out=0, bus=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1, 0);
	sig=BPF.ar(sig, 1500);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.6, 2, -4), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.005, -0.2));

Out.ar(bus,Pan2.ar(sig*0.1836 ,0.2));


}).add;
)
(
SynthDef(\peasverbok2, {arg bus, d4=0.6, d3=0.27, d1=0.63, d2=0.53;
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
	//sig = sig * [0.63, 0.53, 0.27, 0.6];
sig = sig * [d1+0.2, d2+0.25, d3+0.45, d4+0.4];
	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.65, 3, -4) ,  doneAction: 2);

	Out.ar(0,Pan2.ar(output ,0.2));

}).add;
)
Synth(\noise5 , [amp: 1]);







(

	l=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	1500, 1500, 1500, 1500


	];
	var a=1;
	var i=0;
var bus3=Bus.audio(s,2);


	loop{

		delta=1.8/8;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\peasnoise5 , [freq:1000 , amp: a*2, bus: bus3.index]);
			Synth.new("peasverbok2", [ bus: bus3.index]);
		});


    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
l.play;
l.stop;







k.stop;
l.stop;


t.stop;
r.stop;
m.stop;


q.stop;
p.stop;

c.stop;
n.stop;

d.stop;

a.stop;
z.stop;
y.stop;


(
SynthDef(
	\peassaw2bassend2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));
		sig=sig+LFSaw.ar(freq*3*SinOsc.kr(64, 0, 0.005, 1));
		sig=sig+LFSaw.ar(freq*2*SinOsc.kr(64, 0, 0.01, 1));
			//sig=sig+LFSaw.ar(freq*3*SinOsc.kr(64, 0, 0.0025, 1));
		sig=sig+LFSaw.ar(freq*7*SinOsc.kr(64, 0, 0.0035, 1));


		sig=sig*EnvGen.kr(Env.perc(0.1, 6.5, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(8.1, 1.5, 3.9 ,4.1));  //non piu di 3000
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*1.11458 ,0))

}).add;
)














s.record;

c.play;

b.play;


m.play;
n.play;

z.play;

k.play;


a.play;







q.play;

d.play;


t.play;
r.play;
l.play;


k.stop;
l.stop;

m.stop;
n.stop;

b.stop;
c.stop;




a.stop;
z.stop;

t.stop;
r.stop;


d.stop;
z.stop;
t.stop;
r.stop;
q.stop;

b.stop;
c.stop;


s.stopRecording;


Synth(\noise5 , [amp: 1]);






[75,1, 1, 1,   1, 77, 78, 87,   82, 1, 1, 1,    80,1,  78, 77 ]

[75,1, 1, 1,    1, 75,77, 82,  78,  1, 1, 1,     77, 1, 73, 70]




	Synth.new("bass3", [freq: 35.midicps, amp: 0.75 ]);