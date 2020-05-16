
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
~bus8=Bus.audio(s,2);
~bus10=Bus.audio(s,2);

~bus1.free;
~bus2.free;
~bus3.free;
~bus4.free;
~bus5.free;
~bus6.free;



(
var volume;
volume=Volume.new;
volume.volume=(80);
)

(
SynthDef(
	\sine1, {|freq, amp, bus, osc|
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


		Out.ar(bus,Pan2.ar(sig3/8000 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)


(
SynthDef(\delay44, {arg bus, d=0.00007;
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


	a=Routine({
	var delta;
	var freqvect=[






		62, 55, 58, 62, 55, 62, 58, 55,
		62, 55, 58, 62, 55, 62, 58, 55,
		62, 55, 58, 62, 55, 62, 58, 55,
		62, 55, 58, 62, 55, 62, 58, 55,

		67, 58, 62, 67, 58, 67, 62, 58,
		67, 58, 62, 67, 58, 67, 62, 58,

		65, 58, 62, 65, 58, 65, 62, 58,
		65, 58, 62, 65, 58, 65, 62, 58,


		62, 55, 58, 62, 55, 62, 58, 55,
		62, 55, 58, 62, 55, 62, 58, 55,
		62, 55, 58, 62, 55, 62, 58, 55,
		62, 55, 58, 62, 55, 62, 58, 55,


		58, 51, 55, 58, 51, 58, 55, 51,
		58, 51, 55, 58, 51, 58, 55, 51,




		60, 53, 55, 60, 53, 60, 55, 53,
		60, 53, 55, 60, 53, 60, 55, 53





	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=2.8/32;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sine1", [freq: freqvect[i], amp: 1 , bus: ~bus5.index, osc: [-1.5, -1.6, -1.7, -1.8, -1.9, -2, -2.1, -2.2, -2.3, -2.4, -2.5 ].choose]);} );

	 Synth.new( "delay44", [bus: ~bus5.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose ]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
a.play;

s.record;


a.stop;



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


		Out.ar(bus,Pan2.ar(sig3/300 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)



(
SynthDef(
	\saw5, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);





		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 70*SinOsc.kr(0.8, osc, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 2.6, 1.7, -4),   doneAction: 2);
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
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)



(
SynthDef(
	\saw4, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 150*SinOsc.kr(0.4, osc, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.2, 6.6, 1.7, -4),   doneAction: 2);
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


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

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
	deltimes = [111, 153, 130, 177] * d*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2)- ControlDur.ir;
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


31, 1, 1, 1,  1, 1, 1, 1






	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.7;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6", [freq: freqvect[i], amp: 1 , bus: ~bus1.index, osc: [-2, -1.9, -1.8, -1.7, -1.6, -1.5 ].choose]);} );

		Synth.new( "delay4", [bus: ~bus1.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose]);


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
w.play;
x.play;


z.stop;
w.stop;
x.stop;



(


	w=Routine({
	var delta;
	var freqvect=[


1, 1, 1, 27,  1, 1, 1, 1






	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.7;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw5", [freq: freqvect[i], amp: 1 , bus: ~bus2.index, osc: [-2, -2.1, -2.2, -1.9, -1.8, -1.7 ].choose]);} );

	 Synth.new( "delay4", [bus: ~bus2.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose]);


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;
x.play;


w.stop;








(


	x=Routine({
	var delta;
	var freqvect=[


1, 1, 1, 1,  34, 1, 29, 1,

		1, 1, 1, 1,  34, 1, 36, 1,
		1, 1, 1, 1,  29, 1, 34, 1,
		1, 1, 1, 1,  34, 1, 33, 1






	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.7;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw4", [freq: freqvect[i], amp: 1 , bus: ~bus3.index, osc: [-1.5, -1.6, -1.7, -1.8, -1.9 -2, -2.1, -2.2, -2.3, -2.4, -2.5 ].choose]);} );

	 Synth.new( "delay4", [bus: ~bus3.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose ]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
x.play;
w.play;


x.stop;



(
SynthDef(
	\saw3, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		sig3 = Mix.ar(LFSaw.ar(freq.midicps * [ 2, 1.999, 4.03, 4.02 , 8.07, 8.1] , 2.5*[-1.1, -2.2, -1.9, -2.7, -2.6, -3.5, -2]  ));
		sig3=BPF.ar(sig3, 880*SinOsc.kr(0.1, -1.5, 0.95 ,1.05), 2*SinOsc.kr( 0.1, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 4.6, 1.7, -2),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2500);
	sig=HPF.ar(sig, 350);


		Out.ar(bus,Pan2.ar(sig3/1500 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)









(
SynthDef(\delay3, {arg bus, d=0.00007;
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
	deltimes = [111, 153, 160, 177] * d*SinOsc.kr(0.002, 2.5, 0.4*SinOsc.kr(0.01, 2.5, 1, 2), 2)- ControlDur.ir;
	//deltimes = [101, 153, 145, 187] * 0.001 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.001, 6.4, 3, -2) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 2200);
output=HPF.ar(output, 300);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output ,-0.2));

}).add;
)


(


	y=Routine({
	var delta;
	var freqvect=[






		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 46, 45,
		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 50, 46,
		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 46, 50,
		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 46, 53,
		1, 58, 57,    1, 53, 1,  1, 46, 48 , 1, 46, 55,
		1, 1, 50,    1, 1, 1,  1, 46, 48 , 1, 55, 53,



			1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 46, 45,
		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 50, 46,
		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 46, 50,
		1, 1, 1,    1, 1, 1,  1, 46, 48 , 1, 46, 53,
		1, 58, 57,    1, 53, 1,  1, 46, 48 , 1, 46, 55,
		1, 1, 50,    1, 1, 1,  1, 46, 48 , 1, 55, 53,





	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.7*8/12;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw3", [freq: freqvect[i], amp: 1 , bus: ~bus4.index, osc: [-1.5, -1.6, -1.7, -1.8, -1.9, -2, -2.1, -2.2, -2.3, -2.4, -2.5 ].choose]);} );

	 Synth.new( "delay3", [bus: ~bus4.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose ]);


    i= if( i>=71, {0}, {i+1});

		 delta.yield;
	}


});


)
y.play;


y.stop;



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

		Out.ar(0,Pan2.ar(sig*0.028,0.2));


}).add;
)



(


	c=Routine({
	var delta;
	var freqvect=[


		 35,35, 1, 35,  1, 1, 35, 35,    1,1, 35, 1,  35, 1, 1, 1,
		 35,35, 1, 35,  1, 1, 35, 35,    1,1, 35, 1,  1, 35, 1, 1,
		35,35, 1, 35,  1, 1, 35, 35,    1,1, 35, 1,  1, 35, 1, 35,
		1,1, 1, 35,  1, 1, 35, 35,    1,1, 35, 1,  35, 35, 1, 1,








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
		delta=0.7/4;
		freq=freqvect[i];

		//Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

		if (freqvect[i]==1,{ 0},{ Synth(\bass2 , [freq:35 , amp: a*2]   ); }) ;

		i= if( i>=(63), {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;
n.play;

c.stop;




(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(vr+1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.00544, pan));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




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
	sig = sig * [d1+0.1, d2+0.2, d3+0.2, d4+0.3];

	// Here we give delay times in milliseconds, convert to seconds,
	// then compensate with ControlDur for the one-block delay
	// which is always introduced when using the LocalIn/Out fdbk loop
	//deltimes = [101, 143, 165, 177] * 0.001 - ControlDur.ir;
	deltimes = [171, 143, 145, 135] * 0.00160 - ControlDur.ir;


	// Apply the delays and send the signals into the feedback loop
	LocalOut.ar(DelayC.ar(sig, deltimes, deltimes));

	// Now let's hear it:
	//output
output=output*EnvGen.kr(Env.perc(0.001, 1.8, 3, -6) ,  doneAction: 2);
	output=LPF.ar(output, 4500);
	output=HPF.ar(output, 100);
	Out.ar(0,Pan2.ar(output ,0));

}).add;
)


(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect1=[



	2, 1, 2, 2,   2, 1, 2, 1,
		2, 1, 2, 1,   2, 1, 2, 1,
		2, 1, 2, 1,   2, 1, 2, 1,
		2, 2, 2, 1,   2, 1, 2, 1,


		2, 1, 2, 1,   2, 1, 2, 1,
		2, 1, 2, 1,   2, 1, 2, 2,
		2, 1, 2, 2,   2, 1, 2, 1,
		2, 1, 2, 1,   2, 1, 2, 1,





	];


		var freqvect=[



	2, 1, 2, 1,   2, 1, 2, 1,






	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.7/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500, 1000, 2000, 1750, 2500, 3000].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose, bus: ~bus6.index ; ]) ;
		Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
c.play;
n.play;





(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(0.8, -2*SinOsc.kr(1.93, 0, 1, 1.7), 0.8, 1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 1.2, 2, -16), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.08544, 0));




}).add;
)





(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[



	1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 1, 2,


			1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 1, 2,


			1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 2, 2,


			1, 1, 1, 1,   2, 1, 1, 1,

		1, 1, 1, 1,   2, 1, 1, 2,




	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=0.7/4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq:1750 , amp: a*2]); });


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;
c.play;
m.play;
p.play;
q.play;
r.play;

n.stop;
c.stop;
m.stop;


(
SynthDef(\noise6, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1500)*SinOsc.kr(0.8, -2*SinOsc.kr(0.13, 0, 1.5, 1.7), 0.9, 1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.4, 2, -16), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.02544, -0.3));




}).add;
)


(
SynthDef(\noise7, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(0.1, -2*SinOsc.kr(0.13, 0, 1.5, 1.7), 0.9, 1));

	sig=sig*EnvGen.kr(Env.perc(0.11, 0.3, 2, -16), doneAction:2);
	Out.ar(out, Pan2.ar(sig*0.00344, -0.2));




}).add;
)



(
SynthDef(\noise8, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-1000)*SinOsc.kr(8.8, -2*SinOsc.kr(2.43, 0, 1.5, 1.7), 0.9, 1));

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.4, 2, -16), doneAction:2);
   Out.ar(out, Pan2.ar(sig*0.03544, 0.2));




}).add;
)



(

	p=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[




			1, 1,  2, 1,  2, 1,  1, 1,   2, 1,  1, 1,  2, 1,  2, 1,
			1, 1,  2, 1,  2, 1,  1, 1,   2, 1,  1, 1,  2, 2,  2, 2,
			1, 1,  2, 1,  2, 1,  1, 1,   2, 1,  1, 1,  2, 1,  2, 1,
			1, 1,  2, 1,  2, 1,  1, 1,   2, 1,  2, 2,  2, 1,  2, 2,












	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=0.7/8;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise6 , [freq:2750 , amp: a*2]); });


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
	var freq;

	var k23=0;

	var freqvect=[


       // 1, 1, 2, 1 , 2, 1,  1,1,   2,1,  1,1,  2,1,  2,1,

		   2, 1,  1, 2 , 1, 1,  2,1,   2,1,  2,1,  1,2,  1,1,






	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=0.7/8;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise7 , [freq:2750 , amp: a*2]); });


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
q.play;
r.play;
p.play;





(

	r=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[

  1,  2  ,1 ,1 , 1,2,   1, 2,  1, 2,  1, 2, 1, 1, 1, 2,






	];
	var a=1;
	var i=0;
var bus=Bus.audio(s,2);


	loop{

		delta=0.7/4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise8 , [freq:3750 , amp: a*2]); });


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
r.play;
p.play;
q.play;
r.stop;
q.stop;
m.stop;



p.stop;
n.play;
c.play;
a.stop;

//









(
SynthDef(
	\saw6666, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		//sig3=SinOsc.ar((freq+12).midicps, 0, 3.5, 0);
		sig3 = Mix.ar(SinOsc.ar((freq+12).midicps * [2.02, 1, 2.01, 4.04],  2*[1, 0.5, 1.5, 2.5], 1*[0.5, 1, 0.6, 0.03]));
		sig3=BPF.ar(sig3, 250*SinOsc.kr(0.2, -3.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.4, 1.7, 1.7, -8),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 4000);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/1500 ,0));
//Out.ar(0,Pan2.ar(sig/140 ,0));

}).add;
)


(
SynthDef(\delay456, {arg bus, d=0.00007;
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
output=output*EnvGen.kr(Env.perc(0.001, 4.4, 3, -4) ,  doneAction: 2);
//	output=BPF.ar(output, 2000*SinOsc.kr(8.25, -2.5, 0.95 ,1.05));
output=LPF.ar(output, 2000);
output=HPF.ar(output, 300);
	//output=HPF.ar(output, 200);
	Out.ar(0,Pan2.ar(output*2 ,-0.2));

}).add;
)



(


	l=Routine({
	var delta;
	var freqvect=[


        55, 50, 55, 57,
		58, 57, 55, 53,
		55, 50, 55, 53,
		55, 53, 57, 58







	];

	//var bus1=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.7*8/16;
		//delta=0.7*8/32;
		//delta=0.7/16;

		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("saw6666", [freq: freqvect[i], amp: 1 , bus: ~bus7.index, osc: [-1.5, -1.6, -1.7, -1.8, -1.9, -2, -2.1, -2.2, -2.3, -2.4, -2.5 ].choose]);
			Synth.new( "delay456", [bus: ~bus7.index, d: [0.00003, 0.00004, 0.00005, 0.00006, 0.00007].choose ]);
		} );




    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
l.play;


l.stop;






m.stop;
y.stop;
u.stop;



p.stop;
r.stop;
q.stop;
n.stop;
c.stop;


x.stop;
w.stop;

z.stop;
l.stop;
a.stop;
s.stopRecording;