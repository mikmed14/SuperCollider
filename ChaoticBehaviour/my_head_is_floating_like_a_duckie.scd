s.boot;

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


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.2, 1.5, -8),   doneAction: 2);


		sig=HPF.ar(sig, 30);


		Out.ar(0,Pan2.ar(sig*0.75,0.2));

}).add;
)



(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 2, -4), doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.7, 0));




}).add;
)


(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.000001, 0.25, 2, -4), doneAction: 2);
	Out.ar(out, Pan2.ar(sig*1.1, -0.3));




}).add;
)



(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+2500);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 2, -4), doneAction: 2);
	Out.ar(out, Pan2.ar(sig*1.4, 0));




}).add;
)



(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+3000);

	sig=sig*EnvGen.kr(Env.perc(0.000001, 1.5, 2, -8), doneAction: 2);
	Out.ar(out, Pan2.ar(sig*1.3, 0));




}).add;
)


(
SynthDef(
	\hola, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp, 0);
		sig=sig+SinOsc.ar(freq/2, 0, amp, 0);


		sig=sig*EnvGen.kr(Env.perc(0.001, 10, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig3, 580*SinOsc.kr(0.15, -1, 1 ,2));
    sig3=LPF.ar(sig, 1000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/3 ,0));

}).add;
)


(
SynthDef(
	\hola3, {|freq, amp|
		var sig, sig2, sig3;



		sig=Saw.ar(freq/2*SinOsc.kr(100, 0, 0.005, 1*SinOsc.kr(0.1, -3, 1, 2*SinOsc.kr(10, 0, 1, 3) ),  amp, 2));


		sig=sig*EnvGen.kr(Env.perc(0.001, 15, 0.7, 0),   doneAction: 2);




sig3=BPF.ar(sig3, 4000*SinOsc.kr(1, -1, 3 ,4));
    sig3=LPF.ar(sig, 7500);
	sig3=HPF.ar(sig3, 2000);


		Out.ar(0,Pan2.ar(sig3/2 ,-0.15));

}).add;
)


(
SynthDef(
	\hola2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(400, 0, 3.11, 4*SinOsc.kr(80, 0, 1, 2)), 0, 1, 0);
		sig=sig+LFSaw.ar(freq*SinOsc.kr(400, 0, 3.11, 2*SinOsc.kr(40, -1, 1, 1.5)), 0, 1, 0);


		sig=sig*EnvGen.kr(Env.perc(1, 15, 50, 0),   doneAction: 2);




    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 1500*SinOsc.kr(0.15, 1.5, 3 ,4));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3/80 ,0.15))

}).add;
)

(
SynthDef(
	\saw2bass25, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, 0.5);
		sig=sig+SinOsc.ar(freq/2);
		sig=sig+SinOsc.ar(freq/3, 0, 0.3);
			sig=sig+SinOsc.ar(freq, 0, 0.5);
		sig=sig+SinOsc.ar(freq/4);


		sig=sig*EnvGen.kr(Env.perc(0.1, 10, 1, -2),   doneAction: 2);





    sig3=LPF.ar(sig, 1000);


		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.1, 1, 1 ,2));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.217 ,0.2))

}).add;
)


(
SynthDef(
	\saw3, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*4, 0, 0.5);
		sig=sig+SinOsc.ar(freq*2, 0, 1);

		sig=sig+SinOsc.ar(freq, 0, 1);

		sig=sig+SinOsc.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.75, 1, 0),   doneAction: 2);




    sig3=LPF.ar(sig, 1000);


		sig3=BPF.ar(sig3, 400*SinOsc.kr(0.1, 3, 1 ,2));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.067 ,-0.1))

}).add;
)


(
SynthDef(
	\sawbam, {|freq, amp|
		var sig, sig2, sig3;



		sig=Saw.ar(freq);
		sig=sig+SinOsc.ar(freq*2, 0);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 4.5, 1.5, -8),   doneAction: 2);



    sig3=LPF.ar(sig, 4000);


		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.15, 2, 1 ,2.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.887 ,0.3))

}).add;
)


(
SynthDef(
	\sawbbam, {|freq, amp|
		var sig, sig2, sig3;



		sig=Saw.ar(freq);
		sig=sig+SinOsc.ar(freq*2, 0);



		sig=sig*EnvGen.kr(Env.perc(0.000001, 4.5, 1.5, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 4000);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.15, 2, 1 ,2.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*1.347 ,0.3))

}).add;
)



(
SynthDef(
	\sawbambam, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq);
		sig=sig+SinOsc.ar(freq*1.5);
		sig=sig+SinOsc.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(1, 10.5, 5, 0),   doneAction: 2);





    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 1400*SinOsc.kr(0.05, -1, 4 ,4.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.127 ,0.3))

}).add;
)


(
SynthDef(
	\sawbambam2, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq);
		sig=sig+SinOsc.ar(freq*1.5);
		sig=sig+SinOsc.ar(freq/2);


		sig=sig*EnvGen.kr(Env.perc(1, 10.5, 5, 0),   doneAction: 2);




    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 1400*SinOsc.kr(0.05, 1, 4 ,4.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.097 ,0.3))

}).add;
)


(
SynthDef(
	\sawbambam3, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq);
		sig=sig+SinOsc.ar(freq*1.5);
		sig=sig+SinOsc.ar(freq/2);
		sig=sig+SinOsc.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(1, 10.5, 5, 0),   doneAction: 2);





    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 1400*SinOsc.kr(0.050, 0-2, 4 ,4.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.087 ,0.3))

}).add;
)


(
SynthDef(
	\sawcum, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);

		sig=sig+LFSaw.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(0.000008, 1.5, 5, -4),   doneAction: 2);





    sig3=LPF.ar(sig, 1000);



		sig3=BPF.ar(sig3, 350*SinOsc.kr(0.80, 2, 2 ,2.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.207 ,0.3))

}).add;
)


(
SynthDef(
	\sawcum1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);

		sig=sig+LFSaw.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(0.00008, 1.5, 5, -4),   doneAction: 2);




    sig3=LPF.ar(sig, 1000);



		sig3=BPF.ar(sig3, 200*SinOsc.kr(0.9, 2.5, 2 ,2.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.247 ,0.3))

}).add;
)


(
SynthDef(
	\sawcum2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);

			sig=sig+LFSaw.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(0.00018, 1.5, 5, -4),   doneAction: 2);





    sig3=LPF.ar(sig, 1000);



		sig3=BPF.ar(sig3, 400*SinOsc.kr(0.5, -0, 2 ,2.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.107 ,0.3))

}).add;
)


(
SynthDef(
	\sawcum3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);

		sig=sig+LFSaw.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(0.00008, 1.5, 5, -4),   doneAction: 2);




    sig3=LPF.ar(sig, 1000);



		sig3=BPF.ar(sig3, 300*SinOsc.kr(0.7,-2.5, 2 ,2.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.107 ,0.3))

}).add;
)



(
SynthDef(
	\sawcum4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq);
		sig=sig+LFSaw.ar(freq*1.5);
		sig=sig+LFSaw.ar(freq*2);


		sig=sig*EnvGen.kr(Env.perc(0.00008, 2.5, 5, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 7000);



		sig3=BPF.ar(sig3, 5000*SinOsc.kr(4.34, 4, 1, 1.1));
		sig3=HPF.ar(sig3, 250);


		Out.ar(0,Pan2.ar(sig3*0.987 ,0.3))

}).add;
)


(
SynthDef(
	\sawcum4b, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, 1, 0);
		sig=sig+SinOsc.ar(freq*2, 0, 2, 0);
		sig=sig+SinOsc.ar(freq*3, 0, 1.3, 0);
		sig=sig+SinOsc.ar(freq*4, 0, 1.5, 0);
		sig=sig+SinOsc.ar(freq*6, 0, 0.8, 0);
			sig=sig+SinOsc.ar(freq*8, 0, 1.5, 0);
		sig=sig+SinOsc.ar(freq/2, 0, 1, 0);


		sig=sig*EnvGen.kr(Env.perc(0.00008, 1.5, 5, 0),   doneAction: 2);





    sig3=LPF.ar(sig, 6000);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.0002,-1, 4 ,4.1));
		sig3=HPF.ar(sig3, 250);


		Out.ar(0,Pan2.ar(sig3*0.187 ,-0.3))

}).add;
)



(
		g=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
	var k21=0;
	var k11=0;
	var k31=0;
		var k22=0;
	var k12=0;
	var k32=0;
		var k24=0;
	var k14=0;
	var k34=0;
	var freqvect1=[
		59, 57, 54, 55
  	];
	var freqvect2=[
		62, 61, 57, 59
  	];

		var freqvect3=[
		66, 66, 61, 62
  	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=4.8;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect2[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect2[i]).midicps, amp: a*2]); });
		k13= if (freqvect3[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect3[i]).midicps, amp: a*2]); });
		k21= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });
		k31= if (freqvect2[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect2[i]-12).midicps, amp: a*2]); });
		k11= if (freqvect3[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect3[i]-12).midicps, amp: a*2]); });
			k22= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });
		k32= if (freqvect2[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect2[i]+12).midicps, amp: a*2]); });
		k12= if (freqvect3[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect3[i]+12).midicps, amp: a*2]); });
			k24= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect1[i]+24).midicps, amp: a*2]); });
		k34= if (freqvect2[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect1[i]+24).midicps, amp: a*2]); });
		k14= if (freqvect3[i]==1,{ 0},{ Synth(\saw2bass25 , [freq: (freqvect1[i]+24).midicps, amp: a*2]); });


			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});


)

g.play;
g.stop;

s.record;
s.stopRecording;




(
		x=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var k53=0;
	var freqvect2=[

47, 42, 47, 50,
		49, 45, 42, 40,
		42, 37, 42, 45,
		47, 43, 38, 40









    	];

	var freqvect1=[

47, 45, 42, 35,
		47, 45, 42, 43








    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=4.8;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\hola , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\hola , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });

		k43= if (freqvect1[i]==1,{ 0},{ Synth(\hola , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

x.play;
g.play;

x.stop;

s.record;
s.stopRecording;


(
		y=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

1, 71, 1, 69, 1, 64, 1, 1





    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=2.4;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\hola2 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\hola2 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\hola2 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });
		k43= if (freqvect1[i]==1,{ 0},{ Synth(\hola2 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

y.play;


y.stop;
x.stop;
g.stop;


s.record;
s.stopRecording;


(
		j=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

83, 1, 81, 1, 76, 1, 78, 1





    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=2.4;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\hola3 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\hola3 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\hola3 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });
		k43= if (freqvect1[i]==1,{ 0},{ Synth(\hola3 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

s.record;
s.stopRecording;

j.play;


j.stop;
x.stop;
g.stop;
y.stop;




(
		m=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,
		54, 52, 50, 47, 50, 52,



		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,
		54, 50, 49, 47, 49, 50,



		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,
		49, 47, 45, 42, 45, 47,

        50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,
		 50, 49, 47, 43, 47, 49,







    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.1;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw3 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\saw3 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\saw3 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });
		k43= if (freqvect1[i]==1,{ 0},{ Synth(\saw3 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });


			i= if( i>=191, {0}, {i+1});




	delta.yield;

	};

});


)

s.record;
s.stopRecording;

m.play;
g.play;

m.stop;


(
		n=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

83, 1, 1, 1,   1, 83, 83, 83,
		83, 81, 78, 76,  78, 76, 74, 73,
		74, 73, 71, 69,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,

		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,



		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		78, 76, 78, 81, 83, 81, 83, 85,
		86, 85, 86, 81, 83, 81, 78, 74,

			74, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		74, 1, 1, 1, 73, 1, 1, 1,
		69, 1, 1, 1, 66, 1, 1, 1,






    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.15;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\sawbam , [freq: (freqvect1[i]).midicps, amp: a*2]); });


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)

n.play;


n.stop;

(
		r=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

1, 1, 1, 1,   1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  71, 69, 66, 64,
		66, 64, 62, 61,  62, 61, 57, 59,

		54, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,



		66, 1, 1, 1, 66, 64, 66, 69,
		71, 69, 71, 73, 74, 71, 74, 76,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,

			1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1,






    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.15;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\sawbbam , [freq: (freqvect1[i]).midicps, amp: a*2]); });


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)

r.play;
n.play;

r.stop;



(
		c=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

1, 74,1, 1, 1, 1, 1, 1,
	1,	66,  1, 1, 1, 1, 1, 1,
	1,	76, 1, 1, 1, 1, 1, 1,
	1,	69, 1, 1, 1, 1, 1, 1





    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.6;       //4

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\sawbambam , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\sawbambam2 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\sawbambam3 , [freq: (freqvect1[i]).midicps, amp: a*2]); });


			i= if( i>=31, {0}, {i+1});




	delta.yield;

	};

});


)

c.play;
s.record;
s.stopRecording;

c.stop;


(
		a=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;
	var freqvect1=[

        50, 47, 50,54 , 47, 50, 57, 47,  50, 55, 47, 50,  54, 47, 50, 47,
		 50, 47, 50,54 , 47, 50, 57, 47,  50, 55, 47, 50,  54, 47, 50, 47,

		50, 45, 50,54 , 45, 50, 57, 45,  50, 55, 45, 50,  54, 45, 50, 45,
		0, 45, 50,54 , 45, 50, 57, 45,  50, 55, 45, 50,  54, 45, 50, 45,

		50, 42, 50,54 , 42, 50, 57, 42,  50, 55, 42, 50,  54, 42, 50, 42,
		50, 42, 50,54 , 42, 50, 57, 42,  50, 55, 42, 50,  54, 42, 50, 42,

		50, 43, 50,54 , 43, 50, 57, 43,  50, 55, 43, 50,  54, 43, 50, 43,
		50, 43, 50,54 , 43, 50, 57, 43,  50, 55, 43, 50,  54, 43, 50, 43





    	];


		var freqvect2=[

        50, 47, 50,54 , 47, 50, 57, 47,  50, 55, 47, 50,  54, 47, 50, 47,
		 50, 47, 50,54 , 47, 50, 57, 47,  50, 55, 47, 50,  54, 47, 50, 47,

		50, 45, 50,54 , 45, 50, 57, 45,  50, 55, 45, 50,  54, 45, 50, 45,
		50, 45, 50,54 , 45, 50, 57, 45,  50, 55, 45, 50,  54, 45, 50, 45,

		50, 42, 47, 49,   42, 47, 50, 42,  47, 54, 42, 47,  50, 42, 49, 42,
		47, 42, 47, 49,   42, 47, 50, 42,  47, 54, 42, 47,  50, 42, 49, 42,


		47, 43, 47, 49,   43, 47, 50, 43,  47, 54, 43, 47,  50, 43, 49, 43,
		47, 43, 47, 49,   43, 47, 50, 43,  47, 54, 43, 47,  50, 43, 49, 43


//64+21+14+20+25



    	];





	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
			b= if (freqvect2[i]==1,{ 0},{ 1 });
		delta=0.15;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\sawcum , [freq: (freqvect2[i]).midicps, amp: b*2]); });

		k13= if (freqvect1[i]==1,{ 0},{ Synth(\sawcum1 , [freq: (freqvect2[i]).midicps, amp: b*2]); });
		k33= if (freqvect1[i]==1,{ 0},{ Synth(\sawcum2 ,  [freq: (freqvect2[i]).midicps, amp: b*2]); });
		k43= if (freqvect1[i]==1,{ 0},{ Synth(\sawcum3 , [freq: (freqvect2[i]).midicps, amp: b*2]); });


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)

a.play;
s.record;
s.stopRecording;

a.stop;




(
		z=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
		var k43=0;



		var freqvect2=[

        1, 47, 1,1 , 47, 1, 1, 47,  1, 1, 47, 1,  1, 47, 1, 47,
		 1, 47, 1,1 , 47, 1, 1, 47,  1, 1, 47, 1,  1, 50, 1, 50,

		1, 45, 1,1 , 45, 1, 1, 45,  1, 1, 45, 1,  1, 45, 1, 45,
		1, 45, 1,1 , 45, 1, 1, 45,  1, 1, 45, 1,  1, 49, 1, 49,

	    1, 42, 1,1 , 42, 1, 1, 42,  1, 1, 42, 1,  1, 40, 1, 40,
		1, 42, 1,1 , 42, 1, 1, 42,  1, 1, 42, 1,  1, 45, 1, 45,


	    1, 43, 1,1 , 43, 1, 1, 43,  1, 1, 43, 1,  1, 43, 1, 43,
		1, 43, 1,1 , 43, 1, 1, 43,  1, 1, 43, 1,  1, 42, 1, 42






    	];





	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{






			b= if (freqvect2[i]==1,{ 0},{ 1 });
		delta=0.15;

		k23= if (freqvect2[i]==1,{ 0},{ Synth(\sawcum4 , [freq: (freqvect2[i]).midicps, amp: b*2]); });
		k13= if (freqvect2[i]==1,{ 0},{ Synth(\sawcum4b , [freq: (freqvect2[i]).midicps, amp: b*2]); });



			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)

z.play;
z.stop;

s.record;
s.stopRecording;

(
		k=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
	var k43=0;
	var freqvect1=[0,0,0,1];
	var freqvect2=[0,0,1,0];
	var freqvect3=[0, 0, 1, 1];
	var freqvect4=[0, 1, 0, 0];
	var freqvect5=[0, 1, 0, 1];

	var freqvect6=[0, 1, 1, 1];
	var freqvect7=[1, 0, 0, 0];
	var freqvect8=[1, 0, 0, 1];
	var freqvect9=[1, 0, 1, 0];
	var freqvect10=[1, 0, 1, 1];

	var freqvect11=[1, 1, 0, 0];
	var freqvect12=[1, 1, 0, 1 ];
	var freqvect13=[1, 1, 1, 0];
	var freqvect14=[0, 1, 1, 0];

var freqvect15=[0, 1, 0, 1];
	var freqvect16=[0, 1, 0, 1];
	var freqvect17=[0, 1, 0, 1];
	var freqvect18=[0, 1, 0, 1];


var freqvect19=[0, 1, 1, 0];
	var freqvect20=[0, 1, 1, 0];
	var freqvect21=[0, 1, 1, 0];
	var freqvect22=[0, 1, 1, 0];

	var freqvect23=[1, 1, 0, 0];
	var freqvect24=[1, 1, 0, 0];

var freq1=1500;
	var freq2=3000;


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;


	v=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24].choose;


	loop{



	v=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24].choose;








		delta=0.15;

		k23=if  (  v==1,     {    if (freqvect1[i]==1, {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==2,     {    if (freqvect2[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==3,     {    if (freqvect3[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==4,     {    if (freqvect4[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==5,     {    if (freqvect5[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==6,     {    if (freqvect6[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==7,     {    if (freqvect7[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==8,     {    if (freqvect8[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==9,     {    if (freqvect9[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==10,     {    if (freqvect10[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==11,     {    if (freqvect11[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==12,     {    if (freqvect12[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==13,     {    if (freqvect13[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==14,     {    if (freqvect14[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==15,     {    if (freqvect15[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==16,     {    if (freqvect16[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==17,     {    if (freqvect17[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==18,     {    if (freqvect18[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==19,     {    if (freqvect19[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==20,     {    if (freqvect20[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==21,     {    if (freqvect21[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==22,     {    if (freqvect22[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==23,     {    if (freqvect23[i]==1,  {   Synth(\noise1 , [freq: freq1, amp: a*2])}  , {0}  )}, {0} );
		k23=if  (  v==24,     {    if (freqvect24[i]==1, {   Synth(\noise1 , [freq:  freq1, amp: a*2])}  , {0}  )}, {0} );




		k13=if  (  v==1,     {    if (freqvect1[i]==0, {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==2,     {    if (freqvect2[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==3,     {    if (freqvect3[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==4,     {    if (freqvect4[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==5,     {    if (freqvect5[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==6,     {    if (freqvect6[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==7,     {    if (freqvect7[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==8,     {    if (freqvect8[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==9,     {    if (freqvect9[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==10,     {    if (freqvect10[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==11,     {    if (freqvect11[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==12,     {    if (freqvect12[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==13,     {    if (freqvect13[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==14,     {    if (freqvect14[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==15,     {    if (freqvect15[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==16,     {    if (freqvect16[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==17,     {    if (freqvect17[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==18,     {    if (freqvect18[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==19,     {    if (freqvect19[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==20,     {    if (freqvect20[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==21,     {    if (freqvect21[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==22,     {    if (freqvect22[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==23,     {    if (freqvect23[i]==0,  {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );
		k13=if  (  v==24,     {    if (freqvect24[i]==0, {   Synth(\noise2 , [freq: freq2, amp: a*2])}  , {0}  )}, {0} );





			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});


)




k.play;
k.stop;





(

	l=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1, 4000, 1, 4000, 1, 4000, 1, 1, 4000, 1, 1, 4000, 1, 4000, 1, 1




	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.15;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise3 , [freq: (freqvect[i]), amp: a*2]); });


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
l.play;
l.stop;





(

	q=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[
		1, 1, 1, 1,  1500, 1, 1, 1,  1, 1, 1, 1,  1500, 1, 1, 1,
		1, 1, 1, 1,  1500, 1, 1, 1500,  1, 1, 1, 1,  1500, 1, 1, 1,
		1, 1, 1, 1,  1500, 1, 1500, 1,  1, 1500, 1, 1,  1500, 1, 1500, 1500,
		1, 1, 1, 1,  1500, 1, 1500, 1500,  1, 1500, 1, 1,  1500, 1, 1, 1,




	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.15;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq: (freqvect[i]), amp: a*2]); });


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
q.play;
q.stop;

z.play;
a.play;
x.play;

z.stop;



(


	e=Routine({
	var delta;
	var freqvect=[

		30, 1, 1, 1,   30, 1, 1, 1,   30, 1,1,1  , 30, 1, 1, 1,
		30, 1, 1, 1,   30, 1, 1, 30,   1, 1,30,1  , 30, 1, 1, 1,
		30, 1, 1, 1,   30, 1, 1, 30,   1, 1,30,1  , 30, 1, 1, 1,
		30, 1, 1, 1,   30, 1, 1, 1,   30, 1,1,1  , 30, 1, 1, 1,

		30, 1, 1, 1,   30, 1, 1, 30,   1, 1,30,1  , 30, 1, 1, 1,
		30, 1, 1, 1,   30, 1, 1, 30,   1, 1,30,1  , 1, 30, 1, 30,
		1, 30, 1, 1,   30, 1, 1, 30,   1, 1,30,1  , 30, 1, 1, 1,
		30, 1, 1, 1,   30, 1, 1, 30,   1, 1,30,1  , 30, 1, 1, 1,



	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{

		delta=0.15;
		freq=freqvect[i];

		k1= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a]); });

		k2= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a/2]); });

    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});
)


e.play;



e.stop;




s.record;

m.play;
g.play;

y.play;

j.play;

x.play;

c.play;

n.play;
r.play;

a.play;

z.play;


k.play;
l.play;
q.play;

e.play;



q.stop;
l.stop;
k.stop;



z.stop;

n.stop;
r.stop;

e.stop;

a.stop;
m.stop;
j.stop;
c.stop;
x.stop;
g.stop;
y.stop;
n.stop;

s.stopRecording;