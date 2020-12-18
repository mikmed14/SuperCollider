
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;




(
SynthDef(
	\sawbass2, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 30*SinOsc.kr(0.01, 2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 1, 1.7, -4),   doneAction: 2);
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
Out.ar(0,Pan2.ar(sig*7.5 ,-0.1));

}).add;
)


(


	c=Routine({
	var delta;
	var freqvect=[

     33, 33, 1, 33,  1, 33, 36, 36,
		31, 1, 31, 31,   1, 31, 28, 28,



	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.3;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sawbass2", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)

s.record;
c.play;

a.play;


a.stop;
c.stop;






(
SynthDef(
	\peassaw6, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.009, 1.008, 2.001, 2.007, 2.003] , [0, 0, 0, 0, -2, -2, -2, -2] ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 270*SinOsc.kr(0.01, 2.5, 1.95 ,2.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 2.5, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 800);
	sig=HPF.ar(sig, 250);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*4.5 ,0));

}).add;
)


(


	b=Routine({
	var delta;
	var freqvect=[

		60, 60, 57, 60, 60, 57, 60, 59,
		62, 62, 55, 62, 62, 55, 62, 64



	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.3;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw6", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
s.record;
b.stop;


s.stopRecording;









(
SynthDef(
	\abcsaw3, {|freq, amp, bus, osc=4|
		var sig, sig1, sig2, sig3;





		sig3= Mix.ar(SinOsc.ar(((freq+24).midicps) * [1, 1.001, 1.007, 2.001, 2.007]  ));
		//sig3=LFSaw.ar((freq).midicps, 0, 3.5, 0);
		//sig3 = Mix.ar(LFSaw.ar((freq+12).midicps * [1,0.5,  1,1.01]));
		sig3=BPF.ar(sig3, (90.midicps)*SinOsc.kr(0.01, 2.5, 4 ,4.05), 1);
	//	sig3=Resonz.ar(sig3, 80*SinOsc.kr(0.8, -2.5, 8 ,8.05));
		sig3=sig3*EnvGen.kr(Env.perc(0.02, 3, 2, -8),   doneAction: 2); //20-0.02
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

      69, 1, 1, 1,   1, 64, 69, 71,
		67, 1, 1, 71, 1, 71, 71, 72,

		67, 1, 1, 1,  1, 71, 72, 71,
		67, 1, 1, 64, 1, 64, 64, 67




	];

	var bussine=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.15;

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


u.stop;


u.stop;
b.stop;
c.stop;





(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq-500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*5.744, 0));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)


(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1000)*SinOsc.kr(0.1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*7.944, 0));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)



(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+1500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*5.744, 0));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+4500)*SinOsc.kr(0.1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*1.944, 0));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)




(

	m=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



1, 2, 1, 1,   3,2, 4, 4,  1, 3, 1, 2,  3, 2, 4, 4,

		1, 1, 3, 1,   2, 1, 2, 4,   1, 3, 1, 3,  2, 1, 3, 4,

		1, 3, 2, 4,  2, 2, 3, 1,  4, 1, 2, 3,  4, 3, 4, 4,

		4, 3, 2, 1,  1, 2, 3, 4,  4, 3, 1, 2,  3, 4, 1, 2,



	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.15;
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


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
m.stop;




(
SynthDef(
	\peassaw3, {|freq, alt, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 2570*SinOsc.kr(0.1, -2.5, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 2.35, 1.7, -4),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 8800);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
Out.ar(0,Pan2.ar(sig*6 , 0.1));

}).add;
)



(
SynthDef(
	\peassaw33, {|freq, alt, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+12).midicps) * [1, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 1570*SinOsc.kr(0.4, -2.5, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.1, 4.35, 1.7, 0),   doneAction: 2);
		//sig=sig+LFSaw.ar((freq+7).midicps, 2.3, 2, 0);
		//sig=sig+LFSaw.ar((freq+12).midicps, -2, 0.5, 0);
		//sig=sig+LFSaw.ar((freq+19).midicps, -2, 0.5, 0);


		//sig=sig*EnvGen.kr(Env.perc(0.00008, 6.3, 1.7, -8),   doneAction: 2);

sig=sig3;
//sig=sig*EnvGen.kr(Env.perc(0.0008, 1, 1.7, -8),   doneAction: 2);

		//sig3=BPF.ar(sig, 200 );

	//	sig=BPF.ar(sig, 80*SinOsc.kr(0.05, -1, 3.95 ,4.05));
    sig=LPF.ar(sig, 4800);
	sig=HPF.ar(sig, 50);


		Out.ar(bus,Pan2.ar(sig3/500 ,0));
		Out.ar(0,Pan2.ar(sig*5 , SinOsc.kr(0.15, -1,  1, 0 )));

}).add;
)


(


	f=Routine({
	var delta;
	var freqvect=[
       60, 1, 1, 1,   1, 67, 69, 67,
		64, 1, 1, 60, 64, 62, 1, 67,
		60, 1, 1, 1,   1, 59, 60, 64,
		57, 1, 1, 55,  52, 55, 1, 1


	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.3;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw3", [freq: freqvect[i] , alt: [12, 24, 36].choose, amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
f.play;
f.stop;






(


	g=Routine({
	var delta;
	var freqvect=[
       60, 1, 1, 1,   1, 1, 1, 1,
		64, 1, 1, 1, 1, 1, 1, 1,
		60, 1, 1, 1,   1, 1, 1, 1,
		57, 1, 1, 1,  1, 1, 1, 1


	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.3;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw33", [freq: freqvect[i] , alt: [12, 24, 36].choose, amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
g.play;
f.play;








f.stop;

g.stop;

u.stop;

m.stop;

b.stop;
c.stop;


s.stopRecording;


