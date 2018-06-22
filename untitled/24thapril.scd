s.boot;
s.reboot;
s.boot;
s.options.memSize=2*1024*1024;
s.reboot;


//-------------------------------------BASSLINE1-------------------------------------------------------//
//Synths saw1, saw2, delay1, delay2
//Routines a,b


(
SynthDef(
	\saw1, {|freq, amp, bus,bpf=350|
		var sig, sig1, sig2, sig3;



		sig1=LFSaw.ar(freq*2, 0,0.41, 0);
		sig1=BPF.ar(sig1, (bpf+150)*SinOsc.kr(0.3, 2.5, 1.1 ,1.1));
		sig1=sig1*EnvGen.kr(Env.perc(0.01, 3.3, 1.7, -4),   doneAction: 2);
		//	sig1=sig1*EnvGen.kr(Env.perc(0.01, 2.3, 1.7, -8),   doneAction: 2);
		sig2=LFSaw.ar(freq, 0, 1, 0);
		sig2=BPF.ar(sig2, (bpf+150)*SinOsc.kr(1.4, -2.5, 1.1 ,1.1));
		sig2=sig2*EnvGen.kr(Env.perc(0.01, 5.3, 1.7, -4),   doneAction: 2);
		sig3=LFSaw.ar(freq*1.5, 0, 0.25, 0);
        sig3=BPF.ar(sig3, (bpf+150)*SinOsc.kr(0.3, 2.5, 1.1 ,1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 2.3, 1.7, -4),   doneAction: 2);
		sig=sig1+sig2+sig3;
		sig=sig*EnvGen.kr(Env.perc(0.01, 5.3, 1.7, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 )
		//sig3=BPF.ar(sig, (bpf+150)*SinOsc.kr(0.4, -2.4, 8.1 ,8.1));
   sig3=LPF.ar(sig,2000);  //2000
	sig3=HPF.ar(sig, 100);


Out.ar(bus,Pan2.ar(sig3*0.62 ,0));
//Out.ar(0,Pan2.ar(sig3*0.8 ,0.2));

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
output=output*EnvGen.kr(Env.perc(0.01, 2.3, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 1300);
	output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output ,0));
	//Out.ar(0,output);

}).add;
)



(
SynthDef(\delay2, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.3, 0.47, 0.45, 0.43];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.0007 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.1, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 1500);
	Out.ar(0,Pan2.ar(output ,0.2));

}).add;
)


(
SynthDef(
	\saw2, {|freq, amp, bus,bpf=350|
		var sig, sig1, sig2, sig3;



		sig1=LFSaw.ar(freq*2, 0,1, 0);
		sig1=BPF.ar(sig1, (bpf+150)*SinOsc.kr(0.71, -2.5, 1.1 ,1.1));
		sig1=sig1*EnvGen.kr(Env.perc(0.01, 7.7, 2.7, -4),   doneAction: 2);
		//	sig1=sig1*EnvGen.kr(Env.perc(0.01, 2.3, 1.7, -8),   doneAction: 2);
		sig2=LFSaw.ar(freq, 0, 1, 0);
		sig2=BPF.ar(sig2, (bpf+150)*SinOsc.kr(1.4, 2.5, 2.1 ,2.1));
		sig2=sig2*EnvGen.kr(Env.perc(0.01, 4.3, 1.7, -4),   doneAction: 2);
		sig3=LFSaw.ar(freq*1.5, 0, 0.25, 0);
        sig3=BPF.ar(sig3, (bpf+150)*SinOsc.kr(0.8, 2.5, 1.1 ,1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 4.3, 1.7, -4),   doneAction: 2);
		sig=sig1+sig2+sig3;
		sig=sig*EnvGen.kr(Env.perc(0.01, 6.3, 1.7, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 )
		//sig3=BPF.ar(sig, (bpf+150)*SinOsc.kr(0.4, -2.4, 8.1 ,8.1));
    sig=LPF.ar(sig,2700);  //2000
	sig=HPF.ar(sig, 920);


	Out.ar(bus,Pan2.ar(sig*0.40 ,0));
//Out.ar(0,Pan2.ar(sig3*0.0010 ,0.2));

}).add;
)



//10

(
SynthDef(
	\saw3, {|freq, amp, bus|
		var sig, sig1,sig2, sig3, sig4, sig5, sig6;



		//sig=LFSaw.ar(freq*2, 0, 1.5, 0);
		sig1=LFSaw.ar(freq, 0, 3, 0);
		sig1=BPF.ar(sig1, 1500*SinOsc.kr(4.41, -2.5, 1.9 ,2.1));//4
		sig1=sig1*EnvGen.kr(Env.perc(0.0001, 2.5, 2.7, -4),   doneAction: 2);

		sig2=LFSaw.ar(freq*3, 0, 1.5, 2);
		sig2=BPF.ar(sig2, 2000*SinOsc.kr(1.51, -2.1, 0.9 ,1.1));//2
		sig2=sig2*EnvGen.kr(Env.perc(0.001, 2, 2.7, -4),   doneAction: 2);

		sig3=LFSaw.ar(freq*4, 0, 1, 2);
		sig3=BPF.ar(sig3, 2500*SinOsc.kr(2.71, -2.3, 0.9 ,1.1));//8
		sig3=sig3*EnvGen.kr(Env.perc(0.001, 2.6, 2.7, -4),   doneAction: 2);

		sig4=LFSaw.ar(freq*5, 0, 1, 2);
		sig4=BPF.ar(sig4, 2800*SinOsc.kr(1.61, -2.4, 0.9 ,1.1));//2
		sig4=sig4*EnvGen.kr(Env.perc(0.0001, 1.5, 2.7, -4),   doneAction: 2);

		sig5=LFSaw.ar(freq*7, 0, 1.2, 2);
		sig5=BPF.ar(sig5, 3000*SinOsc.kr(1.91, -2.7, 0.9 ,1.1));//4
		sig5=sig5*EnvGen.kr(Env.perc(0.0001, 2.6, 2.7, -4),   doneAction: 2);

		sig6=LFSaw.ar(freq*1.5, 0, 0.4, 2);
		sig6=BPF.ar(sig6, 2000*SinOsc.kr(1.51, -2.2, 1.9 ,2.1));//2
		sig6=sig6*EnvGen.kr(Env.perc(0.0001, 1.5, 2.7, -4),   doneAction: 2);

sig=sig1+sig2+sig3+sig4+sig5+sig6;

		sig=sig*EnvGen.kr(Env.perc(0.05, 3.8, 1.4, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 2580*SinOsc.kr(3, -5.5, 4 , 4.1));
    sig=LPF.ar(sig, 5000);
	sig=HPF.ar(sig, 1500);


		Out.ar(bus,Pan2.ar(sig/155 ,-0.2));
		Out.ar(0,Pan2.ar(sig3/60 ,0));

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
SynthDef(
	\saw4, {|freq, amp, bus, pan |
		var sig, sig2, sig3;



	//	sig=LFSaw.ar(freq*8, 0, 1.5, 0);
		//sig=sig+LFSaw.ar(freq*4, 0, 3, 0);

		sig=SinOsc.ar(freq*2, 0, 1, 0);
		sig=sig+SinOsc.ar(freq*4, 0, 2, 0);


		sig=sig*EnvGen.kr(Env.perc(0.00005, 1, 1.7, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 1380*SinOsc.kr(1, -2.5, 1 , 1.1));
    sig3=LPF.ar(sig3, 3500);
	sig3=HPF.ar(sig3, 30);


		Out.ar(bus,Pan2.ar(sig3/10 , -0.2));
		//Out.ar(0,Pan2.ar(sig3/60000 ,0));

}).add;
)



(
SynthDef(
	\saw5, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2, 0, 1.5*amp, 0);
		//sig=sig+LFSaw.ar(freq*1.5, 0, 1.5, 0);
		sig=sig+LFSaw.ar(freq, 0, 3*amp, 0);


		sig=sig*EnvGen.kr(Env.perc(0.005, 1.3, 1.7, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2080*SinOsc.kr(4.75, 2.5, 1 , 1.1));
    sig3=LPF.ar(sig3, 6500);
	sig3=HPF.ar(sig3, 4000);


		Out.ar(bus,Pan2.ar(sig3/95 ,0.2));
		//Out.ar(0,Pan2.ar(sig3/60000 ,0));

}).add;
)





(
SynthDef(\delay6, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.33, 0.27, 0.45, 0.33];

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
SynthDef(
	\saw6, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq.midicps, 0, 2.5, 0);
		sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		sig=sig*EnvGen.kr(Env.perc(0.00008, 4.3, 1.7, -8),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 80*SinOsc.kr(0.4, -2.9, 8.1 ,8.1));
    sig3=LPF.ar(sig3, 1000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(bus,Pan2.ar(sig3/75 ,0));
	Out.ar(0,Pan2.ar(sig3/4000 ,0));

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
output=output*EnvGen.kr(Env.perc(0.01, 4.4, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 1500);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(

	a=Routine({
	var delta;
	var bus1=Bus.audio(s, 2);
	var freqvect=[
		35, 1, 35, 1, 35, 1, 35, 1,

		38, 1, 38, 1, 38, 1, 38, 1,
		40, 1, 40, 1, 40, 1, 40, 1,
		40, 1, 40, 1, 1, 40, 1, 42


	];

		var freqvect1=[
		35, 1, 35, 1, 35, 1, 35, 1,
		38, 1, 38, 1, 38, 1, 38, 1,
		40, 1, 40, 1, 40, 1, 40, 1,
		40, 1, 40, 1, 1, 40, 1, 42,

	    35, 1, 35, 1, 35, 1, 35, 1,
		38, 1, 38, 1, 38, 1, 38, 1,
		40, 1, 40, 1, 40, 1, 40, 1,
		40, 1, 40, 1, 1, 40, 1, 42,

		35, 1, 35, 1, 35, 1, 35, 1,
		38, 1, 38, 1, 38, 1, 38, 1,
		40, 1, 40, 1, 40, 1, 40, 1,
		40, 1, 40, 1, 1, 40, 1, 42,

		35, 1, 35, 1, 35, 1, 35, 1,
		38, 1, 38, 37, 1, 37, 1, 37,
		33, 1, 33, 1, 33, 1, 33, 1,
		33, 1, 33, 1, 33, 1, 33, 1


	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];

		if(freqvect1[i]==1,  {0}, {k3=Synth.new("saw1", [freq: freqvect1[i].midicps, amp: 1 , bus: bus1.index, bpf: [300, 350, 400].choose]);
				k4 = Synth.new( "delay1", [bus: bus1.index]);
		} );



    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});

)

a.play;
b.play;
q.play;
a.stop;
b.stop;



(


	b=Routine({
	var delta;
	var freqvect=[
		1, 42, 1, 42, 1, 42, 1, 42,
		1, 45, 1, 45, 1, 45, 1, 45,
		1, 47, 1, 47, 1, 47, 1, 47,
		1, 47, 1, 47, 49, 1, 50, 1


	];


		var freqvect1=[
	1, 42, 1, 42, 1, 42, 1, 42,
		1, 45, 1, 45, 1, 45, 1, 45,
		1, 47, 1, 47, 1, 47, 1, 47,
		1, 47, 1, 47, 49, 1, 50, 1,


		1, 42, 1, 42, 1, 42, 1, 42,
		1, 45, 1, 45, 1, 45, 1, 45,
		1, 47, 1, 47, 1, 47, 1, 47,
		1, 47, 1, 47, 49, 1, 50, 1,

		1, 42, 1, 42, 1, 42, 1, 42,
		1, 45, 1, 45, 1, 45, 1, 45,
		1, 47, 1, 47, 1, 47, 1, 47,
		1, 47, 1, 47, 49, 1, 50, 1,

			1, 42, 1, 42, 1, 42, 1, 42,
		1, 40, 1, 1, 45, 1, 45, 1,
		1, 40, 1, 42, 1, 42, 1, 40,
		1, 40, 1, 37, 1, 40, 1, 38

	];
	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];
if(freqvect1[i]==1,  {0 }, {k5=Synth.new("saw2", [freq: freqvect1[i].midicps, amp: 1 , bus: bus2.index, bpf: 380]);
			k6 = Synth.new( "delay2", [bus: bus2.index]);
		} );




    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
a.stop;
b.stop;




(


	m=Routine({
	var delta;
	var freqvect=[
		74, 1, 1, 1, 1, 1, 1, 1,
		73, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 78, 1, 73, 1, 1,


			74, 1, 1, 1, 1, 1, 1, 1,
		73, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 1, 1, 73, 1, 1,
		1, 1, 1, 78, 1, 73, 1, 1,

			74, 1, 1, 1, 1, 1, 1, 1,
		73, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 78, 1, 73, 1, 1,

			74, 1, 1, 1, 1, 1, 1, 1,
		73, 1, 1, 1, 1, 1, 1, 1,
		69, 1, 1, 68, 1, 1, 1, 1,
		1, 1, 1, 68, 1, 71, 1, 1,



				74, 1, 1, 1, 1, 1, 1, 1,
		73, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 1, 81, 1, 1, 1,
		80, 1, 1, 76, 1, 1, 73, 1,


			74, 1, 1, 1, 73, 1, 1, 1,
		74, 1, 1, 1, 1, 1, 76, 1,
		71, 1, 1, 1, 1, 1, 1, 1,
		66, 1, 1, 64, 1, 71, 1, 1,

			74, 1, 1, 1, 1, 1, 1, 1,
		74, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 1, 81, 1, 1, 1,
		80, 1, 1, 76, 1, 78, 1, 1,

			74, 1, 1, 1, 73, 1, 1, 1,
		74, 1, 1, 1, 73, 1, 1, 1,
		69, 1, 1, 1, 69, 1, 1, 69,
		1, 69, 1, 1, 64, 66,  69, 66


	];
	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw3", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);} );

	k6 = Synth.new( "delay4", [bus: bus2.index]);


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});


)
m.play;
m.stop;





(


	p=Routine({
	var delta;
	var freqvect=[
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,

		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,

		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,


		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81,
		1, 81, 81, 81,    1, 81, 1, 81

	];
	var freqvect1=[
		1, 74, 74, 74,    1, 74, 1, 74,
		1, 73, 73, 73,    1, 73, 1, 73,
		1, 76, 76, 76,    1, 76, 1, 76,
		1, 69, 71, 71,    1, 71, 1, 73,


		1, 74, 74, 74,    1, 74, 1, 74,
		1, 73, 73, 73,    1, 73, 1, 73,
		1, 76, 76, 76,    1, 78, 1, 76,
		1, 71, 71, 71,    1, 73, 1, 74,



		1, 74, 74, 74,    1, 74, 1, 74,
		1, 73, 73, 85,    1, 80, 1, 76,
		1, 76, 78, 76,    73, 1, 76, 73,
		1, 71, 73,  1,     71, 1, 69, 76,


		1, 74, 74, 74,    1, 74, 1, 74,
		1, 73, 73, 73,    1, 69, 1, 68,
		1, 68, 69, 68,    64, 1, 64, 66,
		1, 66, 64,  1,     66, 1, 69, 1

	];
	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6, k7;
	var a=1;
	var i=0;

	loop{



		delta=0.1;

		case

		{ i<=15}
		{Synth.new("saw5", [freq:( [74, 78, 81, 83, 85, 86].choose).midicps, amp: 1, bus: bus2.index]);
		Synth.new( "delay6", [bus: bus2.index]);
		}

		{ (i>=15)&&(i<=32)}
		{Synth.new("saw5", [freq:( [78, 81, 85, 86, 88, 90].choose).midicps, amp: 1, bus: bus2.index]);
		Synth.new( "delay6", [bus: bus2.index]);
		}

			{ i>=32}
		{Synth.new("saw5", [freq:( [76, 80, 81, 83, 85, 88].choose).midicps, amp: 1, bus: bus2.index]);
		Synth.new( "delay6", [bus: bus2.index]);
		};

		//freq=freqvect[i];
	//	k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect[i].midicps, amp: 1, bus: bus2.index]);} );
		//k7=if(freqvect1[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect1[i].midicps, amp: 2, bus: bus2.index]);} );

//	k6 = Synth.new( "delay6", [bus: bus2.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
p.play;

p.stop;

(


	q=Routine({
	var delta;
	var freqvect=[
35, 35, 35, 35,  35, 35, 38, 38,
		38, 38, 38, 38, 38, 38, 38, 38,

		33, 33, 33, 33, 33, 33, 40, 40,
		40, 40, 40, 40, 37, 37, 38, 38



	];
	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: bus2.index, pan: []]);} );

	k6 = Synth.new( "delay7", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
q.play;
g.play;
q.stop;


//-------------------------------------SYNTH AMB 1------------------------------------------------------//
//Synths amb1, amb2, amb3
//Routines c

(
SynthDef(
	\amb1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*3.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq+12).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.0001, 3, 1.7, -8),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
	//	sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -2),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq+7).midicps, 0, amp/2, 0)*EnvGen.kr(Env.perc(1, 3, 1, -2),   doneAction: 2);



sig=sig*EnvGen.kr(Env.perc(1.8, 10, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 1380*SinOsc.kr(1.2, -3, 1.1 ,2));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0));
		//Out.ar(bus,Pan2.ar(sig3 ,0));

}).add;
)








(
SynthDef(
	\amb2, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*3.5, 0)*EnvGen.kr(Env.perc(0.001, 3
			, 1.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq+24).midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.0001, 3, 1.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -2),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*5, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -2),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq+7).midicps, 0, amp/8, 0)*EnvGen.kr(Env.perc(0.001, 3, 1, -2),   doneAction: 2);



sig=sig*EnvGen.kr(Env.perc(1.8, 5, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2380*SinOsc.kr(0.2, -3, 4 ,4.1));
    sig3=LPF.ar(sig, 5000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*0.66 ,0));
		Out.ar(bus,Pan2.ar(sig3 ,0));

}).add;
)








(
SynthDef(
	\amb3, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar( freq.midicps, 0, amp*1.5, 0)*EnvGen.kr(Env.perc(0.001, 5, 1.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq).midicps, 0, amp*2.5, 0)*EnvGen.kr(Env.perc(0.001, 3, 1.7, -4),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq-12).midicps, 0, amp*2, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
		//sig=sig+SinOsc.ar( (freq-24).midicps, 0, amp*10, 0)*EnvGen.kr(Env.perc(0.001, 3, 0.7, -8),   doneAction: 2);
		sig=sig+SinOsc.ar( (freq+19).midicps, 0, amp/7, 0)*EnvGen.kr(Env.perc(0.001, 3, 1, 0),   doneAction: 2);



sig=sig*EnvGen.kr(Env.perc(1.8, 5, 1.7, -2),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 380*SinOsc.kr(4.2, -3, 2.1 ,4));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 300);


		Out.ar(0,Pan2.ar(sig3*1.13 ,0));
		Out.ar(bus,Pan2.ar(sig3 ,0));

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
output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output/30 ,-0.2));

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


	var freqvect=[59, 66, 64, 1, 59, 66, 64 , 1    , 59, 69, 68, 1,   59, 61, 62, 1 ];


		var freqvect2=[62, 71, 66,  1,  62, 71,  73 , 1 ,   62, 73, 71, 1,   62, 66,  71,1 ];

		var freqvect3=[66, 73, 71, 1,   66 , 76, 71 , 1,   66, 78, 76,  1,  66, 69, 66, 1  ];

		var a=1.5;
	var i=0;
	var j=0;


	delta=1.6;

	loop {

		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });

g=if(freqvect[i]==1,  {0}, {Synth.new("amb1", [freq: freqvect[i], amp: 1 , bus: bus3.index]);} );
			b=if(freqvect[i]==1,  {0}, {Synth.new("amb2", [freq: freqvect2[i], amp: 1 , bus: bus3.index]);} );
			c=if(freqvect[i]==1,  {0}, {Synth.new("amb3", [freq: freqvect3[i], amp: 1 , bus: bus3.index]);} );
			v=if(freqvect[i]==1,  {0}, {Synth.new("ambdelay", [ bus: bus3.index]);} );

//g=Synth.new(\amb1 , [freq: (freqvect[i]).midicps, amp: a, bus: bus3.index   ] );
			//b=Synth.new(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, bus: bus4.index ] );
			//c=Synth.new(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, bus: bus5.index  ] );

//d = Synth.new( "rev1", [bus: bus3.index]);
	//	e = Synth.new( "rev2", [bus: bus4.index]);
		//f = Synth.new( "rev3", [bus: bus5.index]);




 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

	)



d.play;
q.play;
d.stop;

s.record;

//-------------------------------------SYNTH AMB 1------------------------------------------------------//
//Synths amb1, amb2, amb3
//Routines c


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
		sig=sig+sig2;
		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.75, 1.5, -8),   doneAction: 2);

	   // sig=LPF.ar(sig, 1000);
		sig=HPF.ar(sig, 30);
		//sig3=sig2+BPF.ar(sig, SinOsc.kr(0.001, 2, 1, 1));
		//sig=sig+AllpassC.ar(sig, 0.5, SinOsc.kr(1, 0, 1, 0) , 1, 1, 0);

		Out.ar(0,Pan2.ar(sig*0.8,0.2));
	//	Out.ar(bus,Pan2.ar(sig,0));

}).add;
)





(
SynthDef(\delaybass, {arg bus, d1=0.6, d2=0.27, d4=0.83, d3=0.233;
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
	sig = sig * [0.2, 0.2, 0.1, 0.6];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [101, 143, 165, 177] * 0.0003 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 1.9, 3, -3) ,  doneAction: 2);

	Out.ar(0,Pan2.ar(output/8 ,-0.2));

}).add;
)

(


	h=Routine({
	var delta;
	//var freqvect=[35, 35, 35, 35];
	var bus2=Bus.audio(s, 2);
var freqvect=	[ 1, 1,  2, 1, 2, 2,  1, 2, 1, 2,  2, 1, 2, 2, 1, 2 ];
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
		delta=0.1;
		freq=freqvect[i];

		//Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.5 ]);
		//Synth.new( "delaybass", [bus: bus2.index]);

	k1=if(freqvect[i]==2,  {0}, {Synth.new("bass2", [freq: 40.midicps, amp: 0.5, bus:bus2.index ]);} );

	//	k2=if(freqvect[i]==2,  {0}, {Synth.new( "delaybass", [bus: bus2.index]);} );
	//	k3=if(freqvect[i]==1,  {0}, {Synth.new("noise1", [freq: 500, amp: 1]);});





    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
h.play;

h.stop;



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
		delta=0.4;
		freq=freqvect[i];

		k1=Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;
h.play;
f.play;
c.stop;


(
SynthDef(\noise2, {arg bus, freq, amp, dur;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1500);

//	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.5, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*1.1, -0.2));
    Out.ar(bus,Pan2.ar(sig*0.13 ,0.2));



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
output=output*EnvGen.kr(Env.perc(0.01, 1.9, 3, -3) ,  doneAction: 2);

	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(
SynthDef(\noise1, {arg out=0,  freq=400, amp=0.2, dur ;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+3500);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*1.1, -0.2));




}).add;
)



(
SynthDef(\noise3, {arg out=0,  freq=400, amp=0.2, dur;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	//sig=BPF.ar(sig, freq+5000);
sig=BPF.ar(sig, freq);
//	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.25, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.25, -0.2));




}).add;
)



(
SynthDef(\noise4, {arg out=0,  freq=400, amp=0.2, bus, dur;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	//sig=BPF.ar(sig, freq+4000);
	sig=BPF.ar(sig, freq);

	//sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 3, -8) ,  doneAction: 2);
	sig=sig*EnvGen.kr(Env.perc(0.00001, dur, 3, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*0.2, -0.2));
Out.ar(bus,Pan2.ar(sig*0.36 ,0.2));



}).add;
)

(
SynthDef(\verbok, {arg bus, d4=0.6, d3=0.27, d1=0.63, d2=0.53;
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





(
SynthDef(\noise5, {arg out=0,  freq=400, amp=0.2, pan, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+7000);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.05, 4, -8) ,  doneAction: 2);
	//Out.ar(0, Pan2.ar(sig/0.85, -0.3));
    Out.ar(bus,Pan2.ar(sig*0.046 ,-0.3));



}).add;
)


(
SynthDef(\delay3, {arg bus, d4=0.6, d3=0.27, d1=0.63, d2=0.53;
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
	sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
	sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
	// Attenutate the delayed signals so they decay:
	//sig = sig * [0.63, 0.53, 0.27, 0.6];
sig = sig * [0.83, 0.13, 0.17, 0.5];
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



(
SynthDef(\noise6, {arg out=0,  freq=400, amp=0.2, pan, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1500);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 1.525, 2, -8) ,  doneAction: 2);
	Out.ar(0, Pan2.ar(sig*13, -0));
Out.ar(bus,Pan2.ar(sig*0.86 ,0.2));



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
	delta=0.10;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			//a= if (freqvect[i]==1,{ 0},{ 1 });




		case

		{ i==0} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==1} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus2.index  , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//f=Synth.new("verbok2", [ bus: bus2.index]);
		}
		{ i==2} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==3} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1,  bus: bus2.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//f=Synth.new("verbok2", [ bus: bus2.index]);
		}


			{ i==4} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==5} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==6} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==7} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);}

			{ i==8} {Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);  }
		{ i==9} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==10} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus.index , dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			f=Synth.new("verbok", [ bus: bus.index, d1:[0.2, 0.3, 0.4, 0.5].choose, d2:[0.2, 0.3, 0.4, 0.5].choose, d3:[0.2, 0.3, 0.4, 0.5].choose, d4:[0.2, 0.3, 0.4, 0.5].choose] );
		}
		{ i==11} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , bus: bus.index , dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose ]);
			f=Synth.new("verbok", [ bus: bus.index, d1:[0.3, 0.4, 0.5, 0.6].choose, d2:[0.3, 0.4, 0.5, 0.6].choose, d3:[0.3, 0.4, 0.5, 0.6].choose, d4:[0.3, 0.4, 0.5, 0.6].choose ]);
		}

			{ i==12} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==13} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==14} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==15} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose,  amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose ]); }






			{ i==27} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==25} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus2.index  , dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			f=Synth.new("verbok2", [ bus: bus2.index, d1:[0.2, 0.3, 0.4, 0.5].choose, d2:[0.2, 0.3, 0.4,0.5].choose, d3:[0.2, 0.3, 0.4, 0.8].choose, d4:[0.2, 0.3, 0.4, 0.5].choose ]);
		}
		{ i==26} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==24} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1,  bus: bus2.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			f=Synth.new("verbok2", [ bus: bus2.index, d1:[0.3, 0.4, 0.5, 0.6].choose, d2:[0.3, 0.4, 0.5, 0.8].choose, d3:[0.3, 0.4, 0.5, 0.6].choose, d4:[0.3, 0.4, 0.5, 0.6].choose ]);
		}


			{ i==20} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==21} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
			{ i==22} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==23} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);}

			{ i==16} {Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);  }
		{ i==17} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==18} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1, bus: bus.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]);
			//f=Synth.new("verbok", [ bus: bus.index]);
		}
		{ i==19} {t=Synth(\noise4 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , bus: bus.index , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose ]);
		//	f=Synth.new("verbok", [ bus: bus.index]);
		}

			{ i==28} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
		{ i==29} {b=Synth(\noise2 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose  ]); }
			{ i==30} {b=Synth(\noise1 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose, amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose   ]); }
		{ i==31} {b=Synth(\noise3 , [freq: [2000, 3000, 3500, 4000, 5000, 6000].choose,  amp: 1 , dur: [0.1, 0.2, 0.25, 0.3, 0.4, 0.5].choose ]); };




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

h.play;
c.play;
f.stop;
h.stop;
l.play;

f.play;
l.stop;


(


	g=Routine({
	var delta;
	var freqvect=[
1,


	];
	var bus14=Bus.audio(s,2);
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
		delta=0.2;
		freq=freqvect[i];

		k1=Synth.new("noise5", [freq: 500+[ -10, 20, -40, 60, -100, 120, -140, 180, -200, 250 ].choose, amp: 1, bus:bus14.index , pan: [-1, -0.5, 0.5, 1].choose]);

		k2=Synth.new("delay3", [ bus: bus14.index]);
		//k2=Synth.new("bassrev", [bus:bus.index ]);

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
g.play;
q.play;
g.stop;



(


	l=Routine({
	var delta;
	var freqvect=[

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1500, 1500,  1,1500,


			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,

			1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1,
		1, 1,  1500,1500





	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);
	loop{
      // k1.free;
		//k2.free;
		//k3.free;
		//k4.free;
		delta=0.2;
		freq=freqvect[i];

		k1=if(freqvect[i]==1,  {0}, {Synth.new("noise6", [freq: freqvect[i], amp: 0.2, bus: bus.index  ]);
k1=if(i==63,  {

			Synth.new("verbok", [bus: bus.index, d1:0.6, d2:0.2, d3:0.2, d4:0.5 ]);}   , {0}
		);
		} );
	   //  if(i==7,  {Synth.new("verbok", [bus: bus.index, d1:0.6, d2:0.2, d3:0.2, d4:0.5 ]);} , {0});
		//k1=Synth.new("noise6", [freq: freqvect[i], amp: 0.2 ]);

    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});
)

l.play;
h.play;
c.play;
l.stop;

//---------------------------------------PLAY1----------------------------------//


s.record;
s.stopRecording;

c.play;
h.play;

a.play;
b.play;


d.play;

g.play;

f.play;

l.play;


h.stop;
c.stop;


g.stop;
l.stop;

b.stop;

f.stop;
d.stop;

a.stop;
n.stop;





q.stop;

//---------------------------------------PLAY2----------------------------------//


s.record;
s.stopRecording;

d.play;

q.play;

g.play;

a.play;
b.play;
//alza il volume a saw2
m.play;

l.play;

h.play;
f.play;

p.play;

h.stop;
c.play;


h.stop;
g.stop;
f.stop;
c.stop;
// H, G, F

p.stop;
l.stop;

// P, L

a.stop;
b.stop;
z.stop;

//A, B

l.play;

m.stop;
h.play;

g.play;
l.play;

p.play;

a.play;
b.play;
f.play;


f.stop;
g.stop;
l.stop;
h.stop;
p.stop;
m.stop;


d.stop;
a.stop;
b.stop;
q.stop;


s.stopRecording;

x.stop;
a.stop;
d.stop;

q.stop;





(
SynthDef(
	\saw12, {|freq, amp, bus,bpf=250|
		var sig, sig1, sig2, sig3, sig4, sig5;



		sig1=SinOsc.ar(freq*2, 0, 1.2, 0);
		sig1=BPF.ar(sig1, (550)*SinOsc.kr(0.3, -3, 1.1 ,1.1));
		sig1=sig1*EnvGen.kr(Env.perc(0.01, 2.4, 1.7, -4),   doneAction: 2);
		//	sig1=sig1*EnvGen.kr(Env.perc(0.01, 2.3, 1.7, -8),   doneAction: 2);
		sig2=LFSaw.ar(freq*4, 0, 1, 0);
		sig2=BPF.ar(sig2, (1000)*SinOsc.kr(0.4, -2.5, 1.1 ,1.1));
		sig2=sig2*EnvGen.kr(Env.perc(0.01, 1.8, 1.7, -4),   doneAction: 2);

		sig3=LFSaw.ar(freq*3, 0, 0.25, 0);
        sig3=BPF.ar(sig3, (850)*SinOsc.kr(0.3, 3.5, 1.1 ,1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.01, 1.0, 1.7, -4),   doneAction: 2);

		sig4=LFSaw.ar(freq, 0, 1.25, 0);
        sig4=BPF.ar(sig4, (300)*SinOsc.kr(0.2, -1, 1.1 ,1.1));
		sig4=sig4*EnvGen.kr(Env.perc(0.01, 2.8, 1.7, -8),   doneAction: 2);

		sig5=LFSaw.ar(freq/2, 0, 1.55, 0);
        sig5=BPF.ar(sig5, (150)*SinOsc.kr(0.7, -2, 2.1 ,2.1));
		sig5=sig5*EnvGen.kr(Env.perc(0.0001, 2, 1.7, -4),   doneAction: 2);

		sig=sig1+sig2+sig3+sig4+sig5;
		sig=sig*EnvGen.kr(Env.perc(0.01, 3.3, 1.7, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 )
		//sig3=BPF.ar(sig, (bpf+150)*SinOsc.kr(0.4, -2.4, 8.1 ,8.1));
   sig=LPF.ar(sig,2500);  //2000
	sig=HPF.ar(sig, 500);


Out.ar(bus,Pan2.ar(sig*0.035 ,0));
//Out.ar(0,Pan2.ar(sig3*0.8 ,0.2));

}).add;
)

(
SynthDef(\delay11, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.3, 0.40, 0.35, 0.43];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 155, 187] * 0.0001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 3.0, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 3500);
	Out.ar(0,Pan2.ar(output ,-0.2));
	//Out.ar(0,output);

}).add;
)


(
SynthDef(\delay12, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.3, 0.50, 0.45, 0.43];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 155, 187] * 0.00006 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.2, 4.4, 3, -4) ,  doneAction: 2);
output=LPF.ar(output, 2500);
	output=HPF.ar(output, 50);
	Out.ar(0,Pan2.ar(output/2 ,-0.2));
	//Out.ar(0,output);

}).add;
)
(

	r=Routine({
	var delta;
	var bus1=Bus.audio(s, 2);
	var freqvect=[
		35, 38, 35, 37, 35, 38, 35, 30,
		35, 38, 35, 37, 35, 38, 35, 30,
		35, 38, 35, 37, 35, 38, 35, 30,
		35, 38, 35, 37, 35, 38, 35, 30,
			35, 38, 35, 37, 35, 38, 35, 30,
		35, 38, 35, 37, 35, 38, 35, 30,
		35, 38, 35, 37, 35, 38, 35, 30,
		35, 38, 35, 37, 35, 38, 35, 30,

		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,
		38, 42, 38, 40, 38, 42, 38, 45,

		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,

			40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,

		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,

			40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47,
		40, 45, 40, 44, 40, 45, 40, 47



	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4, k5;
	var a=1;
	var i=0;

	loop{

		delta=0.1;
		freq=freqvect[i];

		k3=if(freqvect[i]==1,  {0}, {Synth.new("saw12", [freq: freqvect[i].midicps, amp: 1 , bus: bus1.index]);} );
	//k4 = Synth.new( "delay12", [bus: bus1.index]);
		k5 = Synth.new( "delay12", [bus: bus1.index]);


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});

)

r.play;
y.play;
a.stop
b.stop;
w.play;
r.stop;


(


	y=Routine({
	var delta;

	var bus4=Bus.audio(s, 2);
	var freq1, freq2, freq3;
	var k1;
	var k2=0;
	var k5, k6, k7;
	var a=1;
	var i=0;

//freq1=	[74, 78, 81, 83, 85, 86].choose-36;
	//freq2=[78, 81, 85, 86, 88, 90].choose-36;
//freq3=	[76, 80, 81, 83, 85, 88].choose-36;

	loop{



		delta=0.1;

		case

		{ i<=32}
		{
			freq1=	[74, 78, 81, 83, 85, 86].choose-24;
			Synth.new("saw12", [freq:freq1.midicps, amp: 1, bus: bus4.index]);
			Synth.new( "delay12", [bus: bus4.index]);
		}

		{ (i>=32)&&(i<=64)}
		{
			freq2=[78, 81, 85, 86, 88, 90].choose-24;
			Synth.new("saw12", [freq: freq2.midicps, amp: 1, bus: bus4.index]);
		Synth.new( "delay12", [bus: bus4.index]);
		}

			{ i>=64}
		{
			freq3=	[76, 80, 81, 83, 85, 88].choose-24;
			Synth.new("saw12", [freq:freq3.midicps, amp: 1, bus: bus4.index]);
		Synth.new( "delay12", [bus: bus4.index]);
		};

    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
y.play;

y.stop;




(
SynthDef(
	\s1, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0,1, 0);
		sig=sig+LFSaw.ar(freq/2, 0, 1, 0);


		sig=sig*EnvGen.kr(Env.perc(0.001, 15.3, 1.7, 0),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2580*SinOsc.kr(0.005, -1.9, 2.1 ,4.1));
    sig3=LPF.ar(sig3,4500);  //2000
	sig3=HPF.ar(sig3, 550);


		Out.ar(bus,Pan2.ar(sig3/2 ,0));
	Out.ar(0,Pan2.ar(sig3/20 ,0.2));
		//Out.ar(0,Pan2.ar(FreeVerb.ar(   sig3, 7.93, 3.02, 0.51, 1, 1.7) *EnvGen.kr(Env.perc(1, 10.3, 1.7, -4),   doneAction: 2);,0.2));

}).add;
)

(
SynthDef(
	\s2, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0,1, 0);
		sig=sig+LFSaw.ar(freq/2, 0, 1, 0);


		sig=sig*EnvGen.kr(Env.perc(0.001, 15.3, 1.7, 0),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2080*SinOsc.kr(2.5, -3.9, 2.1 ,4.1));
    sig3=LPF.ar(sig3,4500);  //2000
	sig3=HPF.ar(sig3, 550);


		Out.ar(bus,Pan2.ar(sig3 ,0));
	//Out.ar(0,Pan2.ar(FreeVerb.ar(   sig3, 7.93, 3.02, 0.51, 1, 1.7) *EnvGen.kr(Env.perc(1, 10.3, 1.7, -4),   doneAction: 2);,0.2));

}).add;
)


(
SynthDef(
	\s3, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0,1, 0);
		sig=sig+LFSaw.ar(freq/2, 0, 1, 0);


		sig=sig*EnvGen.kr(Env.perc(0.001, 15.3, 1.7, 0),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 1580*SinOsc.kr(2.5, 4.5, 2.1 ,4.1));
    sig3=LPF.ar(sig3,4500);  //2000
	sig3=HPF.ar(sig3, 550);


		Out.ar(bus,Pan2.ar(sig3/4 ,0));
	Out.ar(0,Pan2.ar(sig3/20 ,0.2));
//Out.ar(0,Pan2.ar(FreeVerb.ar(   sig3, 7.93, 3.02, 0.51, 1, 1.7)*EnvGen.kr(Env.perc(1, 10.3, 1.7, -4),   doneAction: 2); ,0.2));
}).add;
)


(
SynthDef(
	\s4, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0,1, 0);
		sig=sig+LFSaw.ar(freq/2, 0, 1, 0);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 15.3, 1.7, 0),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 1080*SinOsc.kr(0.15, 2.5, 2.1 ,4.1));
    sig3=LPF.ar(sig3,4500);  //2000
	sig3=HPF.ar(sig3, 550);


		Out.ar(bus,Pan2.ar(sig3/2 ,0));
	Out.ar(0,Pan2.ar(sig3/20 ,0.2));
//Out.ar(0,Pan2.ar(FreeVerb.ar(   sig3, 7.93, 3.02, 0.51, 1, 1.7)*EnvGen.kr(Env.perc(1, 10.3, 1.7, -4),   doneAction: 2); ,0.2));
}).add;
)




(
SynthDef(\delay111, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.5, 0.37, 0.35, 0.32];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.0006 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.01, 15.4, 1, 0) ,  doneAction: 2);
output=LPF.ar(output, 6500);
	Out.ar(0,Pan2.ar(output/8 ,-0.2));

}).add;
)



(

	x=Routine({
	var delta;
	var bus12=Bus.audio(s, 2);
	var freqvect1=[
	66, 69, 78, 76
	];

		var freqvect2=[
	69, 74, 76, 80



	];

		var freqvect3=[
	76, 78, 71, 83



	];

	var freqvect4=[
	66, 69, 71, 76



	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{

		delta=6.4;



			Synth(\s1 , [freq: freqvect1[i].midicps, amp: 1 , bus: bus12.index ]);
			Synth.new("delay111", [ bus: bus12.index]);

			Synth(\s2 , [freq: freqvect2[i].midicps, amp: 1 , bus: bus12.index ]);
			Synth.new("delay111", [ bus: bus12.index]);


			Synth(\s3 , [freq: freqvect3[i].midicps, amp: 1, bus: bus12.index  ]);
			Synth.new("delay111", [ bus: bus12.index]);

			Synth(\s4 , [freq: freqvect4[i].midicps, amp: 1 , bus: bus12.index ]);
			Synth.new("delay111", [ bus: bus12.index]);



    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});



)

x.play;
d.play;
x.stop;




(
Ndef(\verb, {
	var input, output, delrd, sig, deltimes;

	// Choose which sort of input you want by (un)commenting these lines:
	//input = Pan2.ar(PlayBuf.ar(2, b, loop: 0), -0.5); // buffer playback, panned halfway left
	input = SoundIn.ar([0,1]); // TAKE CARE of feedback - use headphones
	//input = Dust2.ar([0.1, 0.01]); // Occasional clicks

	// Read our 4-channel delayed signals back from the feedback loop
	delrd = LocalIn.ar(4);

	// This will be our eventual output, which will also be recirculated
	output = input + delrd[[0,1]];

	// Cross-fertilise the four delay lines with each other:
	sig = [output[0]+output[1], output[0]-output[1], delrd[2]+delrd[3], delrd[2]-delrd[3]];
	sig = [sig[0]+sig[2], sig[1]+sig[3], sig[0]-sig[2], sig[1]-sig[3]];
	// Attenutate the delayed signals so they decay:
	sig = sig * [0.4, 0.37, 0.333, 0.3];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [101, 143, 165, 177] * 0.00025 - ControlDur.ir;

	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output


	Out.ar(0,Pan2.ar(output*5 ,0.2));

}).play
)

Ndef(\verb).free;








(
SynthDef(
	\saw55, {|freq, amp, bus|
		var sig, sig2, sig3;



		//sig=LFSaw.ar(freq*2, 0, 1.5, 0);
		sig=LFSaw.ar(freq, 0, 3, 0);
		sig=sig+LFSaw.ar(freq*3, 0, 1.5, 2);
		sig=sig+LFSaw.ar(freq*4, 3, 1, 2);
		sig=sig+LFSaw.ar(freq*5, 4, 1, 2);
		sig=sig+LFSaw.ar(freq*7, 1, 1.5, 2);
		sig=sig+LFSaw.ar(freq*1.5, 2, 0.4, 2);


		sig=sig*EnvGen.kr(Env.perc(0.005, 6.8, 1.4, -3),   doneAction: 2);


		//sig3=BPF.ar(sig, 200 );

		sig3=BPF.ar(sig, 2580*SinOsc.kr(4, -2.5, 4.1 , 4.1));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 2500);


		Out.ar(bus,Pan2.ar(sig3/80 ,-0.2));
		Out.ar(0,Pan2.ar(sig3/100 ,0));

}).add;
)



(
SynthDef(\delay55, {arg bus, d1=0.6, d2=0.27, d4=0.23, d3=0.233;
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
	sig = sig * [0.5, 0.27, 0.35, 0.53];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [191, 153, 145, 187] * 0.0006 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.1, 5.4, 3, -4) ,  doneAction: 2);
	output=LPF.ar(output, 5000);
output=HPF.ar(output, 1500);
	Out.ar(0,Pan2.ar(output ,0.2));

}).add;
)


(


	j=Routine({
	var delta;
	var freqvect=[
		1, 1, 1, 1, 1, 1, 1, 1,
		71, 1, 1, 73, 1, 1, 78, 1,
		1, 74, 1, 1, 81, 1, 1, 78,
		1, 1, 85, 1, 1, 81, 1, 1,


			1, 1, 1, 1, 1, 1, 1, 1,
		74, 1, 1, 78, 1, 1, 81, 1,
		1, 78, 1, 1, 85, 1, 1, 81,
		1, 1, 88, 1, 1, 85, 1, 1,


		1, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 78, 1, 1, 83, 1,
		1, 80, 1, 1, 88, 1, 1, 83,
		1, 1, 90, 1, 1, 88, 1, 1,


			1, 1, 1, 1, 1, 1, 1, 1,
		76, 1, 1, 80, 1, 1, 83, 1,
		1, 80, 1, 1, 88, 1, 1, 85,
		1, 1, 92, 1, 1, 93, 1, 1,




	];
	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw55", [freq: freqvect[i].midicps, amp: 1 , bus: bus2.index, pan: []]);} );

	k6 = Synth.new( "delay55", [bus: bus2.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
j.play;
j.stop;



s.record;

g.play;
q.play;


m.play;

p.play;


a.play;
b.play;


f.play;
h.play;
c.play;

l.play;

p.stop;
b.stop;
b.play;

d.play;
a.stop;
x.play;




m.stop;
r.play;
//alza g

//h.play;

j.play;


h.stop;
l.stop;
q.stop;
g.stop;
c.stop;

c.play;
l.play;

j.stop;

f.stop;
l.stop;
m.play;
g.play;

d.stop;
x.stop;

c.stop;


q.play;

b.play;

r.stop;
a.play;


f.play;
l.play;

m.stop;
g.stop;



l.stop;
f.stop;


q.stop;


a.stop;
b.stop;


///////////////////////////////
//f.stop;


y.stop;
r.play;
p.stop;

c.play;

b.play;
a.play;
q.play;
j.stop;


l.play;

g.play;



f.stop;
d.stop;
x.stop;
c.stop;
m.stop;
//l.stop;
l.stop;

d.stop;
a.stop;
b.stop;
g.stop;

p.stop;
q.stop;
x.stop;

s.stopRecording;


a.stop;
b.stop;
d.stop;
x.stop;
l.stop;
d.stop;
j.stop;
h.stop;
r.stop;





(
SynthDef(
	\saw2bass1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1.5, 1.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.25, -2.5, 0.95 ,1.05));
		 sig3=LPF.ar(sig3, 5600);
		sig3=HPF.ar(sig3, 800);


		Out.ar(0,Pan2.ar(sig3*3 ,-0.3));

}).add;
)



(
SynthDef(
	\saw2bass2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 6.5, 1.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 2000*SinOsc.kr(0.05, -1.5, 1.95 ,2.05));
		 sig3=LPF.ar(sig3, 4600);
		sig3=HPF.ar(sig3, 800);


		Out.ar(0,Pan2.ar(sig3*2.4 ,-0.3));

}).add;
)



(
SynthDef(
	\saw2bass3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));
		sig=sig+LFSaw.ar(freq*2*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 10.5, 1.5, -4),   doneAction: 2);


		//sig3=BPF.ar(sig, 1550 );


    sig3=LPF.ar(sig, 5600);

		//sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, 0, 1, SinOsc.kr(0.3, 0, 2, 2)));

		sig3=BPF.ar(sig3, 450*SinOsc.kr(0.15, 2.5, 0.95 ,1.05));
		 sig3=LPF.ar(sig3, 2600);
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*1.8 ,-0.3));

}).add;
)

Synth.new("saw2bass3", [freq: 50.midicps, amp: 1]);//re/
Synth.new("saw2bass3", [freq: 49.midicps, amp: 1]);//do/
Synth.new("saw2bass3", [freq: 47.midicps, amp: 1]);//si/
Synth.new("saw2bass3", [freq: 45.midicps, amp: 1]);//la/
Synth.new("saw2bass3", [freq: 44.midicps, amp: 1]);//sol
Synth.new("saw2bass3", [freq: 42.midicps, amp: 1]);//fa/
Synth.new("saw2bass3", [freq: 40.midicps, amp: 1]);//mi/
Synth.new("saw2bass3", [freq: 38.midicps, amp: 1]);//re/
Synth.new("saw2bass3", [freq: 37.midicps, amp: 1]);//do/
Synth.new("saw2bass3", [freq: 35.midicps, amp: 1]);//si/
Synth.new("saw2bass3", [freq: 33.midicps, amp: 1]);//la/
Synth.new("saw2bass3", [freq: 32.midicps, amp: 1]);//sol
Synth.new("saw2bass3", [freq: 30.midicps, amp: 1]);//fa/
Synth.new("saw2bass3", [freq: 28.midicps, amp: 1]);//mi/






Synth.new("saw2bass1", [freq: 26.midicps, amp: 1]);//re/
Synth.new("saw2bass1", [freq: 25.midicps, amp: 1]);//do/




(


	w=Routine({
	var delta;
	var freqvect=[
		8, 8, 1, 8,    1, 8, 1, 8,
		1, 8, 8, 1,    8, 1, 8, 8,
		1, 8, 8, 8,    1, 8, 8, 1,
		1, 8, 1, 8,    8, 1, 1, 8,


	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6, k7;
	var a=1;
	var i=0;

	loop{



		delta=0.2;

		case

		{ i<=7}
		{   if (freqvect[i]==1, {0}, {Synth.new("saw2bass1", [freq:( [50, 49, 47, 45, 42, 35, 30].choose).midicps, amp: 1, bus: bus2.index]);
			Synth.new("saw2bass2", [freq:( [50, 49, 47, 45, 42, 35, 30].choose).midicps, amp: 1, bus: bus2.index]);
			//Synth.new( "delay6", [bus: bus2.index]);

		})
		}

		{ (i>=7)&&(i<=15)}
		{ if (freqvect[i]==1, {0}, {Synth.new("saw2bass1", [freq:( [26, 30, 33, 38, 42, 45, 47, 50].choose).midicps, amp: 1, bus: bus2.index]);
			Synth.new("saw2bass2", [freq:( [26, 30, 33, 38, 42, 45, 47, 50].choose).midicps, amp: 1, bus: bus2.index]);

		})
		//Synth.new( "delay6", [bus: bus2.index]);
		}

			{ i>=15}
		{  if (freqvect[i]==1, {0}, {Synth.new("saw2bass1", [freq:( [28, 33, 35, 37, 40, 42, 44, 47, 49].choose).midicps, amp: 1, bus: bus2.index]);
			Synth.new("saw2bass2", [freq:( [28, 33, 35, 37, 40, 42, 44, 47, 49].choose).midicps, amp: 1, bus: bus2.index]);

		})
		//Synth.new( "delay6", [bus: bus2.index]);
		};

		//freq=freqvect[i];
	//	k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect[i].midicps, amp: 1, bus: bus2.index]);} );
		//k7=if(freqvect1[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect1[i].midicps, amp: 2, bus: bus2.index]);} );

//	k6 = Synth.new( "delay6", [bus: bus2.index]);


    i= if( i>=32, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;

w.stop;



(


	k=Routine({
	var delta;
	var freqvect=[
		8, 1, 1, 8,    1, 1, 8, 1,
		1, 8, 1, 1,    8, 1, 8, 8,
		1, 8, 1, 1,    8, 1, 8, 8,
		1, 8, 8, 1,    1, 8, 1, 1,


	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6, k7;
	var a=1;
	var i=0;

	loop{



		delta=0.4;

		case

		{ i<=3}
		{   if (freqvect[i]==1, {0}, {Synth.new("saw2bass3", [freq:( [45, 42, 35, 30].choose).midicps, amp: 1, bus: bus2.index]);
			//Synth.new("saw2bass2", [freq:( [50, 49, 47, 45, 42, 35, 30].choose).midicps, amp: 1, bus: bus2.index]);
			//Synth.new( "delay6", [bus: bus2.index]);

		})
		}

		{ (i>=3)&&(i<=7)}
		{ if (freqvect[i]==1, {0}, {Synth.new("saw2bass3", [freq:( [26, 30, 33, 38].choose).midicps, amp: 1, bus: bus2.index]);
			//Synth.new("saw2bass2", [freq:( [26, 30, 33, 38, 42, 45, 47, 50].choose).midicps, amp: 1, bus: bus2.index]);

		})
		//Synth.new( "delay6", [bus: bus2.index]);
		}

			{ i>=7}
		{  if (freqvect[i]==1, {0}, {Synth.new("saw2bass3", [freq:( [28, 33, 35, 37].choose).midicps, amp: 1, bus: bus2.index]);
		//	Synth.new("saw2bass2", [freq:( [28, 33, 35, 37, 40, 42, 44, 47, 49].choose).midicps, amp: 1, bus: bus2.index]);

		})
		//Synth.new( "delay6", [bus: bus2.index]);
		};

		//freq=freqvect[i];
	//	k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect[i].midicps, amp: 1, bus: bus2.index]);} );
		//k7=if(freqvect1[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect1[i].midicps, amp: 2, bus: bus2.index]);} );

//	k6 = Synth.new( "delay6", [bus: bus2.index]);


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
k.play;
w.play;
k.stop;



	var freqvect=[
		66, 66, 69, 66,
	71, 66, 69, 71,
	66, 69, 66, 66,
	71, 66, 69, 71,

	64, 64, 69, 64,
	71, 64, 69, 71,
	64, 69, 64, 64,
	71, 73, 71, 69


	];


(


	k=Routine({
	var delta;
	var freqvect=[
		66, 66, 69, 66,
	71, 66, 69, 71,
	66, 69, 66, 66,
	71, 66, 69, 71,

	64, 64, 69, 64,
	71, 64, 69, 71,
	64, 69, 64, 64,
	71, 73, 71, 69


	];

	var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6, k7;
	var a=1;
	var i=0;

	loop{



		delta=0.1;

		//case



		//freq=freqvect[i];


		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw2bass1", [freq: freqvect[i].midicps, amp: 1, bus: bus2.index]);} );
		//k7=if(freqvect1[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect1[i].midicps, amp: 2, bus: bus2.index]);} );

//	k6 = Synth.new( "delay6", [bus: bus2.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
k.play;
w.play;
k.stop;
