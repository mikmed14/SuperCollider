s.boot;
s.reboot;
s.options.memSize=2*1024*1024;



(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.009, 1.008, 2.001, 2.007, 2.003] , [0, 0, 0, 0, -2, -2, -2, -2] ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, (67.midicps)*SinOsc.kr(0.01, 2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
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
	sig=HPF.ar(sig, 600);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*3.5 ,0));

}).add;
)


(


	b=Routine({
	var delta;
	var freqvect=[

60, 64, 67, 72, 67, 64,
		60, 64, 67, 72, 67, 64,
		60, 64, 67, 72, 67, 64,
		60, 64, 67, 72, 67, 64,

		59, 64, 67, 71, 67, 64,
		59, 64, 67, 71, 67, 64,
		59, 64, 67, 71, 67, 64,
		59, 64, 67, 71, 67, 64,

		57, 60, 64, 69, 64, 60,
		57, 60, 64, 69, 64, 60,
		57, 60, 64, 69, 64, 60,
		57, 60, 64, 69, 64, 60,

		55, 59, 64, 67, 64, 59,
		55, 59, 64, 67, 64, 59,
		55, 59, 64, 67, 64, 59,
		55, 59, 64, 67, 64, 59,




	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=16*0.35/24;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=95, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
s.record;









(
SynthDef(
	\abcsaw2, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (55.midicps)*SinOsc.kr(0.1, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 8, 2, -4),   doneAction: 2); //20-0.02
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


	x=Routine({
	var delta;


	var freqvect4=[

       36, 1, 1, 1, 1, 1,   36, 1,
		1, 1,  36, 1, 1, 36, 1, 1,

	 40, 1, 1, 1, 1, 1,   40, 1,
		1, 1,  40, 1, 1, 40, 1, 1,

	 1, 41, 1, 1, 1, 1,   41, 1,
		1, 1,  41, 1, 1, 41, 1, 1,

		 40, 1, 1, 1, 1, 1,   40, 1,
		1, 1,  40, 1, 1, 40, 1, 1,












	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.35;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw2", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
x.play;
b.play;
s.record;


x.stop;




(
SynthDef(
	\abcsaw, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (55.midicps)*SinOsc.kr(0.19, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 4, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2000);
	sig=HPF.ar(sig, 200);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)




(


	z=Routine({
	var delta;


	var freqvect4=[

       60, 1, 55, 1, 52, 1,   1, 1,
		52, 1,  1, 1, 52, 1, 55, 60,

		59, 1, 55, 1, 52, 1,  1, 1,
		52, 1,  1, 1,  55, 1, 52, 55,

		57, 1, 55, 1, 53, 1,  1, 1,
		53, 1, 1, 1,   53, 1, 55, 57,

		55, 1, 52, 1, 55, 1,  1, 1,
		52, 1,  1, 1,  55, 1, 52, 55,












	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.35;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
s.record;


z.stop;





(
SynthDef(
	\abcsaw3, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (75.midicps)*SinOsc.kr(0.19, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 4, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3000);
	sig=HPF.ar(sig, 1000);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)




(


	w=Routine({
	var delta;


	var freqvect4=[

       72, 1, 76, 1, 72, 1,   1, 1,
		67, 1,  1, 1, 72, 1, 76, 72,

		71, 1, 67, 1, 71, 1,  1, 1,
		67, 1,  1, 1,  71, 1, 67, 71,

		72, 1, 71, 1, 69, 1,  1, 1,
		69, 1, 1, 1,   69, 1, 71, 72,

		71, 1, 67, 1, 71, 1,  1, 1,
		67, 1,  1, 1,  71, 1, 67, 71,












	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.35;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw3", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
w.play;
s.record;


w.stop;




(
SynthDef(
	\abcsaw4, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (85.midicps)*SinOsc.kr(0.19, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 1, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 6000);
	sig=HPF.ar(sig, 3000);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*5 ,-0.1));//10-1.5

}).add;
)




(


	y=Routine({
	var delta;


	var freqvect4=[


		1, 96, 95, 93,  91, 93, 91, 88,
		86, 88, 86, 84, 83, 84, 83, 81,
		79, 81, 79, 76, 74, 76, 74, 72,
		71, 72, 71, 69, 67, 69, 67, 64,

		1, 95, 93, 91, 88, 91, 88, 86,
		84, 86, 84, 83, 81, 83, 81,79,
		76, 79, 76, 74, 72, 74, 72, 71,
		69, 71, 69, 67, 64, 67, 64, 62,


		1, 93, 91, 89, 88, 89, 88, 84,
		83, 84, 83, 81, 79, 81, 79, 77,
		76, 77, 76, 72, 71, 72, 71, 69,
		67, 69, 67, 65, 64, 65, 64, 60,


		1, 95, 93, 91, 88, 91, 88, 86,
		84, 86, 84, 83, 81, 83, 81,79,
		76, 79, 76, 74, 72, 74, 72, 71,
		69, 71, 69, 67, 64, 67, 64, 62,




	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.35/2;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw4", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
y.play;
s.record;


y.stop;





w.stop;
z.stop;
b.stop;
x.stop;
y.stop;

s.stopRecording;
