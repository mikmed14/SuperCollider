
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;


[
	62, 1, 1,  60, 62, 65,
	58, 1, 1,  57, 58, 62,
	55, 1, 1,  53, 55, 58,
	51, 1, 50, 58, 1,  57

]


[
	77, 1, 74, 79, 1, 77,
	72, 1, 74,  70, 1, 69,
	67, 1, 69, 70, 1,  65,
	67, 1, 69, 70, 1,  74

]


[
	46, 45, 43, 41, 39, 38, 36, 41

]



(
SynthDef(
	\abcsaw, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (58.midicps)*SinOsc.kr(0.1, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 3.5, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2000);
	sig=HPF.ar(sig, 50);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)




(


	z=Routine({
	var delta;


	var freqvect4=[

	 62, 1, 1,  60, 62, 65,
	58, 1, 1,  57, 58, 62,
	55, 1, 1,  53, 55, 58,
	51, 1, 50, 58, 1,  57






	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.4;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=23, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;
s.record;


z.stop;





(
SynthDef(
	\abcsaw1, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (43.midicps)*SinOsc.kr(0.01, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 3.5, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2000);
	sig=HPF.ar(sig, 50);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)




(


	x=Routine({
	var delta;


	var freqvect4=[

	46, 45, 43, 41, 39, 38, 36, 41






	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=1.2;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw1", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});


)
x.play;


x.stop;





(
SynthDef(
	\abcsaw2, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (74.midicps)*SinOsc.kr(0.1, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.5, 2.5, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 2000);
	sig=HPF.ar(sig, 50);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)




(


	y=Routine({
	var delta;


	var freqvect4=[

	77, 1, 74, 79, 1, 77,
	72, 1, 74,  70, 1, 69,
	67, 1, 69, 70, 1,  65,
	67, 1, 69, 70, 1,  74






	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.4;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw2", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=23, {0}, {i+1});

		 delta.yield;
	}


});


)
y.play;


y.stop;






(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq)*SinOsc.kr(0.5, -2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*10.844, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)

(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+3500)*SinOsc.kr(1, -2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*6.544, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0));




}).add;
)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq)*SinOsc.kr(2, -2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 3.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*3.244, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0));




}).add;
)



(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+4500)*SinOsc.kr(0.5, -2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*1.844, 0));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)



(

	n=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   2, 0,   1, 0,   1, 0,    2, 0,   2, 0,



		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 1,   2, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   2, 1,   2, 0,   1, 0,    2, 0,   2, 0,



		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 1,   2, 2,   1, 0,   1, 1,    2, 0,   2, 0,

		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 2,   1, 1,   2, 1,   2, 1,    2, 0,   2, 0,



		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   2, 2,   1, 0,   1, 1,    2, 0,   2, 0,

		1, 0,   0, 0,   1, 0,   1, 0,    2, 0,   2, 0,

		1, 0,   2, 0,   1, 0,   1, 0,    1, 2,   1, 2,







	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.1;
		freq=freqvect[i];
		//a=[1, 2, 3, 4].choose;

		//k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		switch( freq ,
			0, {0},
			1, { Synth(\noise1 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ; },
			2, {Synth(\noise2 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			3, {Synth(\noise3 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			4, {Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;}



		);



		//});


    i= if( i>=191, {0}, {i+1});

		 delta.yield;
	}


});

)
n.play;
m.play;
o.play;


n.stop;
m.stop;




(

	m=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[

0, 3,







	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.6;
		freq=freqvect[i];
		//a=[1, 2, 3, 4].choose;

		//k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		switch( freq ,
			0, {0},
			1, { Synth(\noise1 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ; },
			2, {Synth(\noise2 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			3, {Synth(\noise3 , [freq:[8000, 7000, 6000, 5000, 4000, 3500, 3000, 2500, 2000].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			4, {Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;}



		);



		//});


    i= if( i>=1, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
n.play;


m.stop;






(

	o=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[

4, 4, 4, 4,







	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.1;
		freq=freqvect[i];
		//a=[1, 2, 3, 4].choose;

		//k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		switch( freq ,
			0, {0},
			1, { Synth(\noise1 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ; },
			2, {Synth(\noise2 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			3, {Synth(\noise3 , [freq:[8000, 7000, 6000, 5000, 4000, 3500, 3000, 2500, 2000].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			4, {Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;}



		);



		//});


    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
o.play;
n.play;
m.play;


o.stop;




(
SynthDef(
	\abcsaw123, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (84.midicps)*SinOsc.kr(0.1, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 3.5, 2, -4),   doneAction: 2); //20-0.02
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

		//sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 6000);
	sig=HPF.ar(sig, 2050);


//Out.ar(bus,Pan2.ar(sig*2 ,0));
	Out.ar(0,Pan2.ar(sig*8 ,-0.1));//10-1.5

}).add;
)




(


	h=Routine({
	var delta;


	var freqvect4=[

		82, 77, 82, 84, 86, 84,
		82, 81, 82, 84, 86, 89,
		91, 89, 86, 84, 86, 89,
		84, 86, 84, 82, 84, 86






	];

	//var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.4;

		//freq=freqvect[i];
	//	if(freqvect1[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect1[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
		//if(freqvect2[i]==1,  {0 }, {Synth.new("abcsine6", [freq: freqvect2[i], amp: 1 , bus: bussine.index, osc: [1, 0.8, 0.5, 0.6, ].choose]);} );
	    if(freqvect4[i]==1,  {0 }, {Synth.new("abcsaw123", [freq: freqvect4[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);} );

       // Synth.new( "abcdelay8", [bus: bussine.index]);


    i= if( i>=23, {0}, {i+1});

		 delta.yield;
	}


});


)
h.play;


h.stop;





h.stop;

m.stop;
n.stop;
o.stop;


y.stop;


x.stop;
z.stop;

s.stopRecording;


