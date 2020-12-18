

s.boot;
s.reboot;
s.options.memSize=2*1024*1024;


(
SynthDef(
	\abcsaw3, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007, 2.001, 2.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (100.midicps)*SinOsc.kr(0.01, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 6, 2, -8),   doneAction: 2); //20-0.02
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


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)



(


	u=Routine({
	var delta;


	var freqvect4=[

    81, 80, 78, 76,  73, 69, 68, 66,
    68, 64, 68, 69,   68, 64, 61, 64,

	66, 68, 69, 73,   78, 80, 81, 85,
     83, 81, 80, 76 ,   73, 71, 69, 68

	];

	var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6/4;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw3", [freq: freqvect4[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
u.play;
s.record;







(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.009, 1.008, 2.001, 2.007, 2.003] , [0, 0, 0, 0, -2, -2, -2, -2] ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 270*SinOsc.kr(0.01, 2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.5, 2.5, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 600);
	sig=HPF.ar(sig, 250);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*4.5 ,0));

}).add;
)


(


	b=Routine({
	var delta;
	var freqvect=[


		54, 61, 66, 54, 66, 54, 61, 66,
		54, 61, 66, 54, 66, 54, 61, 66,

		52, 59, 64, 52, 64, 52, 59, 64,
		50, 57, 62, 50, 62, 50, 57, 62

	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=2.4/16;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;





(
SynthDef(
	\sawbass2, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(SinOsc.ar(((freq).midicps) * [1, 1.001, 1.007, 2.001, 2.008, 2.009, 4.0001, 4.005, 4.009]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 30*SinOsc.kr(0.1, 2.5, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 3, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 200);
	sig=HPF.ar(sig, 10);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*5.5 ,0.1));

}).add;
)


(


	c=Routine({
	var delta;
	var freqvect=[

     30, 1, 1, 37,
		28, 1, 26, 1,



	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sawbass2", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});


)


c.play;



(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*9.744, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)

(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+4500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.344, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)



(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+4500)*SinOsc.kr(1.1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 1.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.744, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)



(

	m=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 1, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 2,  1, 0, 2, 1,  2, 1, 2, 0,  1, 0, 2, 0,


		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 2,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 1, 2, 1,  2, 2, 1, 1,


			2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 1,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 1, 2,  1, 0, 2, 1,  2, 1, 2, 2,  1, 2, 2, 1,


		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 1,
		2, 1, 2, 0,  1, 0, 2, 1,  2, 0, 2, 0,  1, 0, 2, 0,
		2, 1, 0, 2,  1, 0, 2, 1,  0, 1, 2, 2,  1, 2, 1, 1,



	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=4.8/32;
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


    i= if( i>=255, {0}, {i+1});

		 delta.yield;
	}


});
)







(

	n=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



1, 1, 2, 1,
		1, 1, 2, 1,
		1, 1, 2, 1,
		1, 1, 2, 1,

		1, 1, 2, 1,
		1, 1, 2, 1,
		1, 1, 2, 1,
		1, 1, 2, 2,

	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=4.8/16;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise3 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;
m.play;




(
SynthDef(
	\peassaw44, {|freq, alt, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+48).midicps) * [1, 1.007, 2.001, 2.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 1570*SinOsc.kr(0.1, -2.5, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 3.35, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 6800);
	sig=HPF.ar(sig, 3050);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*6 ,0.2));

}).add;
)




(


	g=Routine({
	var delta;
	var freqvect=[

		45, 1, 45, 44,
		40, 1, 42, 49,

		45, 1, 45, 44,
		40, 37, 35, 37

	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw44", [freq: freqvect[i] , alt: [12, 24, 36].choose, amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
g.play;







g.stop;

u.stop;

n.stop;
m.stop;

b.stop;
c.stop;







