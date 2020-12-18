

s.boot;
s.reboot;
s.options.memSize=2*1024*1024;






(
SynthDef(
	\sawbass, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.001, 1.007, 2.001, 2.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (50.midicps)*SinOsc.kr(0.1, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 1.5, 2, -4),   doneAction: 2); //20-0.02
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
	Out.ar(0,Pan2.ar(sig*6 ,-0.1));//10-1.5

}).add;
)






(


	a=Routine({
	var delta;
	var freqvect=[


		33, 40, 36, 33, 40, 33, 36, 40,
		33, 40, 36, 33, 40, 33, 36, 40,

		28, 35, 31, 28, 35, 28, 31, 35,
		28, 35, 31, 28, 35, 28, 31, 35,

		33, 40, 36, 33, 40, 33, 36, 40,
		33, 40, 36, 33, 40, 33, 36, 40,

		28, 35, 31, 28, 35, 28, 31, 35,
		28, 35, 31, 28, 35, 28, 31, 35,


		29, 36, 33, 29, 36, 29, 33, 36,
		29, 36, 33, 29, 36, 29, 33, 36,

		24, 31, 28, 24, 31, 24, 28, 31,
		24, 31, 28, 24, 31, 24, 28, 31,

		29, 36, 33, 29, 36, 29, 33, 36,
		29, 36, 33, 29, 36, 29, 33, 36,

		24, 31, 28, 24, 31, 24, 28, 31,
		24, 31, 28, 24, 31, 24, 28, 31,








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
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sawbass", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose] );

			//k6 = Synth.new( "abcdelay7", [bus: bus2.index]);
		} );

	//


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
	\abcsaw, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.001, 1.007, 2.001, 2.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (50.midicps)*SinOsc.kr(0.1, 2.5, 1 ,1.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 5.5, 2, -4),   doneAction: 2); //20-0.02
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

		45, 48, 52, 1, 1, 1, 57, 59,
		55, 1, 52, 1, 50, 52, 50, 48,

		45, 48, 52, 1, 1, 1, 57, 59,
		55, 1, 52, 1, 50, 52, 50, 48,

		41, 45, 48, 1, 1, 1, 53, 55,
		52, 1, 48, 1, 47, 48, 47, 43,

		41, 45, 48, 1, 1, 1, 53, 55,
		52, 1, 48, 1, 47, 48, 47, 43,


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


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});


)
z.play;




z.stop;






(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*5.844, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)

(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*4.544, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0));




}).add;
)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+3000)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*6.044, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+5000)*SinOsc.kr(5, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 1.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.944, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0));




}).add;
)



(

	n=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[
		2, 3, 2, 1, 4, 0, 0, 0,



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


    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;


n.stop;



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

		Out.ar(0,Pan2.ar(sig*5.648,0.2));


}).add;
)



(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 1.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*6.844, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)



(
SynthDef(\noise6, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+2500)*SinOsc.kr(1, 0.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*4.844, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)


(

	k=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[

		1, 0,  1, 0,  1, 0,  1, 1,    1, 0, 1, 0, 1, 1, 1, 1


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

		switch( freqvect[i] ,
			0, {0},
			1, { Synth(\noise6 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ; },
			2, {Synth(\noise2 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			3, {Synth(\noise3 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			4, {Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;}



		);



		//});


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
k.play;
d.play;

k.stop;



(

	m=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[

		0, 1



	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.8;
		freq=freqvect[i];
		//a=[1, 2, 3, 4].choose;

		//k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		switch( freqvect[i] ,
			0, {0},
			1, { Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ; },
			2, {Synth(\noise2 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			3, {Synth(\noise3 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;},
			4, {Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;}



		);



		//});


    i= if( i>=1, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
d.play;
k.play;

m.stop;



(


	d=Routine({
	var delta;
	var freqvect=[


		 35, 1, 35, 1







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

		//Synth.new("bass2", [freq: freqvect[i].midicps, amp: 0.75 ]);

		if (freqvect[i]==1,{ 0},{ Synth(\bass2 , [freq:35 , amp: a*2]   ); }) ;

		i= if( i>=(3), {0}, {i+1});

		 delta.yield;
	}


});
)
d.play;
n.play;


d.stop;



(
SynthDef(
	\peassaw7, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1,  1.00701]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 2270*SinOsc.kr(5, 0, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.1, 1.6, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 3800);
		sig=HPF.ar(sig, 1050);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*7.5 ,0));

}).add;
)


(


	c=Routine({
	var delta;
	var freqvect=[


		69, 1, 69, 71, 72, 1 ,72 ,71,
		1, 71, 69, 1,  69, 1, 67, 1,
		69, 1, 64, 1, 64, 1, 69, 67,
		1, 67, 69, 1, 67, 1, 64, 1,

			69, 1, 69, 71, 72, 1 ,72 ,71,
		1, 71, 69, 1,  69, 1, 67, 1,
		69, 1, 64, 1, 64, 1, 69, 67,
		1, 67, 69, 1, 67, 1, 64, 1,

			65, 1, 65, 67, 69, 1 ,69 ,67,
		1, 67, 65, 1,  65, 1, 64, 1,
		65, 1, 60, 1, 60, 1, 64, 62,
		1, 62, 64, 1, 62, 1, 60, 1,


			65, 1, 65, 67, 69, 1 ,69 ,67,
		1, 67, 65, 1,  65, 1, 64, 1,
		65, 1, 60, 1, 60, 1, 64, 62,
		1, 62, 64, 1, 62, 1, 60, 1,







	];



	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];
		if(freqvect[i]==1,  {0 }, {Synth.new("peassaw7", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

		//	k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});


)
c.play;


c.stop;



m.stop;
n.stop;
d.stop;
k.stop;

c.stop;

a.stop;
z.stop;

s.stopRecording;