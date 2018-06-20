
s.boot;

(
SynthDef(\noise, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.8, 2, -8));
	Out.ar(out, Pan2.ar(sig*1.3, 0));




}).add;
)

(
SynthDef(\noise6, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 1.8, 2, -8));
	Out.ar(out, Pan2.ar(sig*1.75, 0));




}).add;
)


(
SynthDef(\noise5, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig+BPF.ar(sig, freq+2400);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 2, -8), doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.45, 0.2));

Out.ar(bus,Pan2.ar(sig*0.85 ,0.2));


}).add;
)

(
	SynthDef("vn5", { arg bus;
	var sig;
	sig=In.ar(bus);


	sig=FreeVerb.ar(   sig, 0.99, 0.32, 0.91, 1, 0.7);


	sig=sig*EnvGen.kr(Env.perc(0.01, 0.8, 1, 1, 0),   doneAction: 2);

	Out.ar(0,Pan2.ar(sig), 0.2 );
	}).add;

)





(
SynthDef(\noise4, {arg out=0, bus, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);

	sig=BPF.ar(sig, freq*4);
	sig=sig+BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.7, 2, -8));
	Out.ar(out, Pan2.ar(sig*1.2, 0));

Out.ar(bus,Pan2.ar(sig*1.85 ,0.2));


}).add;
)



(
	SynthDef("vn4", { arg bus;
	var sig;
	sig=In.ar(bus);


	sig=FreeVerb.ar(   sig, 0.99, 0.82, 0.41, 1, 0.7);

	sig=sig*EnvGen.kr(Env.perc(0.001, 4.8, 1, 1, 0),   doneAction: 2);

	Out.ar(0,Pan2.ar(sig), 0.2 );
	}).add;

)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.1, 2, -4));
	Out.ar(out, Pan2.ar(sig*0.01, 0));




}).add;
)



(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig, sig1, sig2, sig3, sig4;

	sig=WhiteNoise.ar(1*amp, 0);
	sig2=BPF.ar(sig, freq-800);
	sig3=LPF.ar(sig2, 1000);
	sig4=HPF.ar(sig3, 50);

	sig=sig*EnvGen.kr(Env.perc(0.0000001, 1.5, 6, -7));
	Out.ar(out, Pan2.ar(sig4*0.98, 0));




}).add;
)

(
SynthDef(
	\bass, {|freq, amp|
		var sig, sig2, sig3;


		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );


		sig=sig*EnvGen.kr(Env.perc(0.01, 1.2, 1.5, -8),   doneAction: 2);


		sig=HPF.ar(sig, 30);


		Out.ar(0,Pan2.ar(sig*1.4,0.2));

}).add;
)

(
SynthDef(
	\saw2bass5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 0.75, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.5, -1.3, 1 ,1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*12 ,0.3))

}).add;
)


(
SynthDef(
	\saw2bass3, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, -1, 0.0001, 1));
		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(64, -1, 0.0005, 1), 0, 0.5, 0);



		sig=sig*EnvGen.kr(Env.perc(0.00001, 2.5, 1, -8),   doneAction: 2);




    sig3=LPF.ar(sig, 2500);



		sig3=BPF.ar(sig3, 1550*SinOsc.kr(4, -1, 1 ,1.1));
		sig3=HPF.ar(sig3, 60);



		Out.ar(bus,Pan2.ar(sig3*7 ,0));

}).add;
)

(
	SynthDef("delay3", { arg bus, freqOffset = 0;
	var sig;
	sig=In.ar(bus);

	sig=DelayC.ar(   sig,  0.5505, SinOsc.kr(0.005509, 4.2, 2, 1, 2), 3.5, 2);

	sig=LPF.ar(sig, 1000);
	sig=HPF.ar(sig, 300);
	sig=sig*EnvGen.kr(Env.perc(0.05, 15.5, 1, 0),   doneAction: 2);

	Out.ar(0,Pan2.ar(sig/2), 0 );
	}).add;

)


(
SynthDef(
	\saw2bass3a, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, -1, 0.0001, 1));



		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.5, 1, -8),   doneAction: 2);



    sig3=LPF.ar(sig, 1800);


		sig3=BPF.ar(sig3, 850*SinOsc.kr(4, -1, 1 ,1.1));
		sig3=HPF.ar(sig3, 60);

		Out.ar(bus,Pan2.ar(sig3*10 ,0));

}).add;
)

(
	SynthDef("delay3a", { arg bus, freqOffset = 0;
	var sig;
	sig=In.ar(bus);
	sig=DelayC.ar(   sig,  0.505, SinOsc.kr(0.095509, 4.2, 2, 1, 2), 3.5, 2);

	sig=LPF.ar(sig, 1200);
	sig=HPF.ar(sig, 100);
	sig=sig*EnvGen.kr(Env.perc(0.05, 1.5, 1, 0),   doneAction: 2);

	Out.ar(0,Pan2.ar(sig/2), 0 );
	}).add;

)



(
SynthDef(
	\saw2bass3b, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, -1, 0.0001, 1), 0, 1.5);
		sig=sig+LFSaw.ar(freq*SinOsc.kr(64, -1, 0.0005, 1), 0, 0.75, 0);
		sig=sig+LFSaw.ar(freq*1.5*SinOsc.kr(64, -1, 0.0005, 1), 0, 0.25, 0);
		sig=sig+LFSaw.ar(freq*3*SinOsc.kr(64, -1, 0.0005, 1), 0, 0.15, 0);



		sig=sig*EnvGen.kr(Env.perc(0.00001, 2.5, 1, -8),   doneAction: 2);



    sig3=LPF.ar(sig, 5050);



		sig3=BPF.ar(sig3, 3550*SinOsc.kr(0.1, -2.5, 1 ,1.1));   //0.5  -1.5     //5.5, -1
		sig3=HPF.ar(sig3, 2060);




		Out.ar(bus,Pan2.ar(sig3*10 ,0));

}).add;
)

(
	SynthDef("delay3b", { arg bus, freqOffset = 0;
	var sig;
	sig=In.ar(bus);

	sig=DelayC.ar(   sig,  0.5505, SinOsc.kr(0.005509, 4.2, 2, 1, 2), 3.5, 2);

	sig=LPF.ar(sig, 500);
	sig=HPF.ar(sig, 50);
	sig=sig*EnvGen.kr(Env.perc(0.05, 15.5, 1, 0),   doneAction: 2);

	Out.ar(0,Pan2.ar(sig/2), 0 );
	}).add;

)




(
SynthDef(
	\saw2bass4, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*SinOsc.kr(0.1, 0, 0.5, 0.5));


		sig=sig*EnvGen.kr(Env.perc(0.001, 10.5, 1, -2),   doneAction: 2);





    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 400*SinOsc.kr(30, 3.5, 1 ,1.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(bus,Pan2.ar(sig3 ,0));

}).add;
)

(
	SynthDef("rev4", { arg bus;
	var sig;
	sig=In.ar(bus);


	sig=FreeVerb.ar(   sig, 0.39, 5, 1.01, 1, 1.7);


	sig=LPF.ar(sig, 2500);
	sig=HPF.ar(sig, 50);
	sig=sig*EnvGen.kr(Env.perc(1, 3, 1, 1, 0),   doneAction: 2);

	Out.ar(0,Pan2.ar(sig*2), 0.2 );
	}).add;

)

(
SynthDef(
	\saw2bass7, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 2));
		sig=sig+SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.1, 5.5, 1, -4),   doneAction: 2);




    sig3=LPF.ar(sig, 1500);


		sig3=BPF.ar(sig3, 900*SinOsc.kr(8, 1.5, 1 ,1));
		sig3=HPF.ar(sig3, 350);


		Out.ar(0,Pan2.ar(sig3*1.4 ,0.3))

}).add;
)

(
SynthDef(
	\saw2bass8, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 1));
		sig=sig+SinOsc.ar(freq*2*SinOsc.kr(64, 0, 0.01, 2), 0, 0.5);

		sig=sig+SinOsc.ar(freq*7*SinOsc.kr(64, 0, 0.01, 2), 0, 0.3);



		sig=sig*EnvGen.kr(Env.perc(0.01, 3.5, 1, -2),   doneAction: 2);





    sig3=LPF.ar(sig, 900);



		sig3=BPF.ar(sig3, 600*SinOsc.kr(1.35, -1.5, 1 ,1.2));
		sig3=HPF.ar(sig3, 300);


		Out.ar(0,Pan2.ar(sig3*0.55 ,0.1))

}).add;
)

(
SynthDef(
	\saw2bass9, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);



		sig=sig*EnvGen.kr(Env.perc(0.0005, 1, 2, -4),   doneAction: 2);





    sig3=LPF.ar(sig, 5500);



		sig3=BPF.ar(sig3, 2500*SinOsc.kr(4, 1, 1 ,1.1));
		sig3=HPF.ar(sig3, 1850);


		Out.ar(0,Pan2.ar(sig3*1.28 ,0.3))  //0.68

}).add;
)


(
SynthDef(
	\saw2bass91, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2);



		sig=sig*EnvGen.kr(Env.perc(0.2, 1, 2, -4),   doneAction: 2);




    sig3=LPF.ar(sig, 5500);



		sig3=BPF.ar(sig3, 2500*SinOsc.kr(2.1, 1, 1 ,1.1));
		sig3=HPF.ar(sig3, 1550);


		Out.ar(0,Pan2.ar(sig3*1.23 ,0))

}).add;
)


(
SynthDef(
	\saw2bass92, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2, 0.6);



		sig=sig*EnvGen.kr(Env.perc(0.05, 1, 2, -4),   doneAction: 2);




    sig3=LPF.ar(sig, 5500);


		sig3=BPF.ar(sig3, 2500*SinOsc.kr(1.2, 1, 1 ,1.1));
		sig3=HPF.ar(sig3, 1550);


		Out.ar(0,Pan2.ar(sig3*1.28 ,-0.3))

}).add;
)


(
SynthDef(
	\saw2bass10, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(64, 0, 0.01, 1));

		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(44, 0, 0.01, 1));

		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(24, 0, 0.03, 2));
		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(14, 0, 0.01, 1));
		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(10, 0, 0.07, 1));
		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(5, 0, 0.01, 1));
		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(3, 0, 0.05, 2));
		sig=sig+LFSaw.ar(freq/2*SinOsc.kr(1, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.03, 1.5, 1, -8),   doneAction: 2);




    sig3=LPF.ar(sig, 7500);


		sig3=BPF.ar(sig3, 2500*SinOsc.kr(10.5, 2, 1 ,1));
		sig3=HPF.ar(sig3, 550);


		Out.ar(0,Pan2.ar(sig3*2 ,0.3))

}).add;
)


(
SynthDef(
	\saw2bass11, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq/2);


		sig=sig*EnvGen.kr(Env.perc(0.00001, 4, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 7500);

		sig3=HPF.ar(sig3, 1050);


		Out.ar(0,Pan2.ar(sig3*1.88 ,0.3))

}).add;
)



(
SynthDef(
	\saw2bass20, {|freq, amp, bus|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1), 0, 1);



		sig=sig*EnvGen.kr(Env.perc(0.1, 18, 1, -4),   doneAction: 2);





    sig3=LPF.ar(sig, 3000);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(150.5, 1.5, 2 ,3));
		sig3=HPF.ar(sig3, 1850);


		Out.ar(0,Pan2.ar(sig3*3.58 ,0.3)) ;
        Out.ar(bus,Pan2.ar(sig3/7 ,0));
}).add;
)

(
SynthDef(
	\saw2bass100, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);
		sig=sig+LFSaw.ar(freq*3, 0, 0.5);
		sig=sig+LFSaw.ar(freq*1.5);

		sig=sig+LFSaw.ar(freq/2, 0, 4);



		sig=sig*EnvGen.kr(Env.perc(0.5, 5, 2, -2),   doneAction: 2);




    sig3=LPF.ar(sig, 5500);



		sig3=BPF.ar(sig3, 2500*SinOsc.kr(150, -2.5, 2 ,4.1));
		sig3=HPF.ar(sig3, 1350);


		Out.ar(0,Pan2.ar(sig3*0.038 ,-0.3))

}).add;
)








(
		y=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
	var freqvect1=[

		69, 1, 74, 1,  73, 1, 74, 69,  1, 69, 74, 1,  73, 1, 74, 1,

		69, 1, 74, 1,  73, 1, 74, 76,  1, 76, 74, 1,  73, 1, 74, 1,

		71, 1, 74, 1,  73,  1, 74, 78, 1, 78, 74, 1,  73, 1, 74, 1,

		71, 1, 74, 1,  73,  1, 74, 69, 1, 69,  74, 1,  73, 1, 66, 1






    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=2.4/16;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass10 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass10 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});


)

y.play;


s.record;
s.stopRecording;

y.stop;



(
		u=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
	var freqvect1=[

	1, 2, 1, 1, 1, 1, 1, 1,







    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass20 , [freq: (69).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass20 , [freq: (62).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

u.play;



u.stop;



(
		x=Routine({
	var delta;

var k23=0;
	var k21=0;
	var k31=0;
	var k13=0;
	var k33=0;
		var k41=0;
	var k42=0;
	var freqvect1=[

		74, 69, 74, 81,
			74, 69, 74, 81,


		69, 62, 69, 64,
		69, 62, 69, 64,

		74, 69, 74, 81,
		74, 69, 74, 81,


		76, 69, 76, 81,
		76, 69, 76, 81,

		78, 69, 78, 81,
		78, 69, 78, 81,

		76, 69, 76, 81,
		76, 69, 76, 81,


		74, 69, 74, 81,
		74, 69, 74, 81,

		73, 69, 73, 81,
		73, 69, 73, 81,

		1, 1, 1, 1,
		1, 1, 1, 1,

		69, 62, 69, 81,
		69, 62, 69, 81,

		1, 1, 1, 1,
		1, 1, 1, 1,

		71, 76, 71, 78,
		71, 76, 71, 78,

		1, 1, 1, 1,
		1, 1, 1, 1,

		66, 61, 66, 73,
		66, 61, 66, 73,

		1, 1, 1, 1,
		1, 1, 1, 1,

		64, 57, 64, 59,
		64, 57, 64, 59,


		69, 62, 69, 74,
		69, 62, 69, 74,

		64, 71, 64, 73,
		64, 71, 64, 73,

		69,62, 69, 74,
		69,62, 69, 74,

		71, 66, 71, 78,
		71, 66, 71, 78,


		73, 69, 73, 81,
		73, 69, 73, 81,

		74, 69, 74, 81,
		74, 69, 74, 81,

		73, 69, 73, 81,
		73, 69, 73, 81,

		69, 66, 69, 78,
		69, 66, 69, 78,

		1, 1, 1, 1,
		1, 1, 1, 1,

		66, 61, 66, 73,
		66, 61, 66, 73,

		1,1, 1, 1,
		1,1, 1, 1,

		64, 59, 64, 71,
		64, 59, 64, 71,

		1, 1, 1, 1,
		1, 1, 1, 1,

		66,61, 66, 73,
		66,61, 66, 73,

		64, 61, 64, 73,
		64, 61, 64, 73,

		62, 57, 62, 59,
			62, 57, 62, 59



    	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=2.4*16/256;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass9 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass9 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });
		k21= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass91 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k31= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass91 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });
		k41= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass92 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k42= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass92 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=255, {0}, {i+1});




	delta.yield;

	};

});


)

x.play;
u.play;


x.stop;
y.stop;




(
		i=Routine({
	var delta;

var k23=0;
	var k21=0;
	var k31=0;
	var k13=0;
	var k33=0;
		var k41=0;
	var k42=0;
	var freqvect1=[

		74,
		69,
		74,
		76,
		78,
		76,
		74,
		73,
		1,
		69,
		1,
		71,
		1,
		66,
		1,
		64,
		69,
		64,
		69,
		71,
		73,
		74,
		73,
		69,
		1,
		66,
		1,
		64,
		1,
		66,
		64,
		62








    	];






	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=2.4*16/32;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass100 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass100 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });

			i= if( i>=31, {0}, {i+1});




	delta.yield;

	};

});


)

i.play;

i.stop;



(
		z=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

62, 61, 62, 69, 62, 61, 62, 69, 62, 61, 62, 69, 62, 61, 62, 69,
		62, 59, 62, 69, 62, 59, 62, 69, 62, 59, 62, 69, 62, 59, 62, 69,
		61, 57, 61, 66, 61, 57, 61, 66, 61, 57, 61, 66, 61, 57, 61, 66,
		61, 57, 61, 64, 61, 57, 61, 64, 61, 57, 61, 64, 61, 57, 61, 64







    	];

	var freqvect2=[
		69, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		69, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		66, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		64,1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6/4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass8 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass8 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});


)

z.play;
u.play;



z.stop;






(
		o=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k6=0;
	var k7=0;
	var freqvect1=[

   1, 52, 1, 52






    	];




	var durvec=[0.6, 0.3, 0.3];
var bus2=Bus.audio(s, 2);
	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6*4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass4 , [freq: (freqvect1[i]).midicps, amp: a*2]);
			k6 = Synth.new( "rev4", [bus: bus2.index]);
		});
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass4 , [freq: (freqvect1[i]-12).midicps, amp: a*2]);
			k7 = Synth.new( "rev4", [bus: bus2.index]);
		});


			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});


)

o.play;



o.stop;



(
		r=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

81, 1, 1, 1, 74, 1, 1, 1






    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6/1.5;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass7 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass7 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

r.play;
o.play;



r.stop;









(

	b=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1, 1, 1, 1, 1, 1, 1, 3000, 1, 1, 1, 1, 1, 1, 3000, 3000





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.6/4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise , [freq: (freqvect[i]), amp: a*2]); });

		post(delta+' ');
    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
b.play;


b.stop;



(

	j=Routine({
	var delta;
	var freq;

	var k23=0, k2=0;
var bus=Bus.audio(s,2);
	var freqvect=[7000, 1, 7000, 7000, 7000, 1, 7000, 1, 7000, 1, 7000, 1, 7000, 1, 7000, 1





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.6/8;
		freq=freqvect[i];


		 if (freqvect[i]==1,{k23= 0},{ k23=Synth(\noise5 , [freq: (freqvect[i]), amp: a*2, bus: bus.index]);
			k2=Synth.new("vn5", [ bus: bus.index]);
		});


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
j.play;

b.play;
f.play;
f.stop;


f.play;
j.stop;
b.stop;







(

	f=Routine({
	var delta;
	var freq;

	var k23=0, k2=0;
var bus=Bus.audio(s,2);
	var freqvect=[1, 1000, 1, 1000,





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.6;
		freq=freqvect[i];

			 if (freqvect[i]==1,{k23= 0},{ k23=Synth(\noise4 , [freq: (freqvect[i]), amp: a*2, bus: bus.index]);
			k2=Synth.new("vn4", [ bus: bus.index]);
		});


    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
f.play;


f.stop;






(


	l=Routine({
	var delta;
	var freqvect=[30, 30, 30, 30


	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
		freq=freqvect[i];

		k1= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a]); });

		k2= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a/2]); });

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)




l.play;



l.stop;


(

	c=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1000, 1000, 1000, 1000,





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.6;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise2 , [freq: (freqvect[i]), amp: a*2]); });

		post(delta+' ');
    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;


c.stop;

(
		p=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

 50, 1, 1, 57,
		50, 1, 1, 49,
		50, 45, 1, 1,
		1, 49, 1, 1

//48?




    	];


var bus1=Bus.audio(s, 2);



	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6/4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass3 , [freq: (freqvect1[i]).midicps, amp: a*2, bus1.index]);
			k13 = Synth.new( "delay3", [bus: bus1.index]);
		});


			i= if( i>=15, {0}, {i+1});




	delta.yield;

	};

});


)

p.play;



p.stop;



(
		m=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

    38, 1, 1, 1, 1,  38, 1, 1, 1, 1,  38, 1, 1, 1, 1,  38, 1, 1, 1, 1,
		    38, 1, 1, 1, 1,  38, 1, 1, 1, 1,  38, 1, 1, 1, 1,  36, 1, 36, 1, 36,






    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6/5;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=39, {0}, {i+1});




	delta.yield;

	};

});


)




(
		v=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

         54, 50, 49, 50,
		52, 50, 49, 50,
		   54, 50, 49, 50,
		52, 50, 49, 50,

		49, 45, 49, 50,
		52, 50, 49, 45,
		49, 45, 49, 50,
		52, 50, 49, 45,


		    54, 50, 49, 50,
		52, 50, 49, 50,
		   54, 50, 49, 50,
		52, 50, 49, 50,

		49, 45, 49, 50,
		52, 50, 49, 45,
		49, 45, 49, 50,
		52, 50, 49, 45,

		47, 42, 47, 49,
		50, 49, 47, 42,
		47, 42, 47, 49,
		50, 49, 47, 42,

		50, 45, 50, 52,
		54, 52, 50, 45,
		50, 45, 50, 52,
		54, 52, 50, 45,

			49, 45, 49, 50,
		52, 50, 49, 45,
		49, 45, 49, 50,
		52, 50, 49, 45,

			49, 45, 49, 50,
		52, 50, 49, 45,
		49, 45, 49, 50,
		52, 50, 49, 45

//48?




    	];


var bus1=Bus.audio(s, 2);



	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6/4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass3a , [freq: (freqvect1[i]).midicps, amp: a*2, bus1.index]);
			k13 = Synth.new( "delay3a", [bus: bus1.index]);
		});


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)

v.play;



v.stop;




(
		w=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

        57, 52, 54, 52,
		54, 52, 57, 52,
		59, 52, 61, 52,
		59, 52, 57, 52,

		  57, 52, 54, 52,
		54, 52, 57, 52,
		59, 52, 61, 52,
		59, 52, 57, 52,

		  57, 52, 54, 52,
		54, 52, 57, 52,
		59, 52, 61, 52,
		59, 52, 57, 52,

		  64, 52, 54, 52,
		54, 52, 57, 52,
		59, 52, 61, 52,
		59, 52, 57, 52








    	];


var bus1=Bus.audio(s, 2);



	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6/4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass3b , [freq: (freqvect1[i]).midicps, amp: a*2, bus1.index]);
			k13 = Synth.new( "delay3b", [bus: bus1.index]);
		});


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});


)

w.play;



w.stop;



s.options.numBuffers = 1024 * 16

SuperDirt.start
//final

s.record;

z.play;
u.play;


r.play;
o.play;

p.play;

m.play;
c.play;
l.play;

x.play;
i.play;

j.play;
b.play;
f.play;

y.play;


o.stop;
m.stop;
c.stop;
l.stop;


f.stop;
b.stop;
j.stop;

x.stop;

y.stop;
i.stop;
u.stop;

z.stop;
p.stop;
r.stop;
p.stop;
x.stop;

s.stopRecording;






b.stop;
j.stop;
f.stop;
r.stop;
o.stop;


m.stop;
c.stop;
l.stop;


z.stop;
p.stop;
x.stop;
y.stop;
u.stop;



z.play;
u.play;

r.play;
o.play;



x.play;
//1

m.play;
c.play;
l.play;




s.record;

m.play;
c.play;
l.play;


p.play;


o.stop;





s.record;
s.stopRecording;

r.stop;
z.stop;
b.stop;
j.stop;
f.stop;
p.stop;
x.stop;
y.stop;
u.stop;

