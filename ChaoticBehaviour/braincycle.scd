
s.boot;


(
SynthDef(
	\saw2bass6, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.001, 2, 13, 0),   doneAction: 2);





    sig3=LPF.ar(sig, 3000);



		sig3=BPF.ar(sig3, 500*SinOsc.kr(0.025, 2, 1 ,1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3/30 ,0.2))

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


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.3, 2.5, -8),   doneAction: 2);


		sig=HPF.ar(sig, 30);


		Out.ar(0,Pan2.ar(sig/10,0));

}).add;
)



(
SynthDef(
	\hola, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.001, 0.8, 0.7, 0),   doneAction: 2);




    sig3=LPF.ar(sig, 500);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/2 ,0));

}).add;
)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;
	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.1, 2, -4));
	Out.ar(out, Pan2.ar(sig/3, 0.3));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;
	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.1, 2, -4));
	Out.ar(out, Pan2.ar(sig/4, -0.3));




}).add;
)


(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;
	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.1, 2, -4));
	Out.ar(out, Pan2.ar(sig*0.65, -0.3));




}).add;
)


(
SynthDef(
	\saw2bass3, {|freq, amp|
		var sig, sig2, sig3;



		sig=Saw.ar(freq*SinOsc.kr(70, 0, 0.01, 2*SinOsc.ar(0.001, 0, 1, 2)));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1.5, 13, 0),   doneAction: 2);





    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 1500*SinOsc.kr(1, SinOsc.kr(1.6, 1, 1, 1), 1 ,1));
		sig3=LPF.ar(sig3, 5000);
		sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3/65 ,0.2))

}).add;
)





(
SynthDef(
	\saw2bass4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.001, 1, 13, 0),   doneAction: 2);




    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 1500*SinOsc.kr(1, SinOsc.kr(2, 1, 1, 1), 1 ,1));
		sig3=LPF.ar(sig3, 5000);
		sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3/250 ,0.2))

}).add;
)


(
SynthDef(
	\saw2bass5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.005, 1));


		sig=sig*EnvGen.kr(Env.perc(0.1, 7, 13, 0),   doneAction: 2);





    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 500*SinOsc.kr(0.3, -1, 1 ,1));

		sig3=LPF.ar(sig3, 800);
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3/35 ,0.2))

}).add;
)

(
SynthDef(
	\dio1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 4, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(3, -2.5, 2.9 ,3.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.458 ,-0.3))

}).add;
)


(
SynthDef(
	\dio2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 4, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(3, -2.5, 2.9 ,3.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.458 ,0.3))

}).add;
)


(
SynthDef(
	\dio3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 0.25));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1.2, 1, -2),   doneAction: 2);




    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(2, -2.5, 3.9 ,4.1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.658 ,0.3))

}).add;
)



(
		g=Routine({
	var delta;

var k23=0;
	var k13=0;
		var k33=0;
	var k43=0;

	var k21=0;
	var k11=0;
		var k31=0;
	var k41=0;
	var freqvect=[

54, 49, 45, 57, 56, 52, 49, 52,
		54, 49, 45, 57, 56, 52, 49, 52,


		54, 49, 45, 57, 56, 52, 49, 52,
		54, 49, 45, 57, 56, 52, 49, 52,


54, 49, 47, 57, 56, 52, 49, 52,
		54, 49, 47, 57, 56, 52, 49, 52,


		54, 49, 47, 57, 56, 52, 49, 52,
		54, 49, 47, 57, 56, 52, 49, 52




    	];


		var freqvect2=[

54, 49, 54, 61, 59, 57, 56, 52,
		54, 49, 54, 61, 59, 57 ,56, 52,


		54, 49, 54, 61, 59, 57, 56, 52,
		54, 49, 54, 61, 59, 57 ,56, 52,



		54, 52, 54, 61, 59, 57, 56, 52,
		54, 52, 54, 61, 59, 57, 56, 52,
			54, 52, 54, 61, 59, 57, 56, 52,
		54, 52, 54, 61, 59, 57, 56, 52




    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.4;

		k23= if (freqvect[i]==1,{ 0},{ Synth(\dio1 , [freq: (freqvect[i]).midicps, amp: a*2]); });
		k13= if (freqvect[i]==1,{ 0},{ Synth(\dio1 , [freq: (freqvect[i]+12).midicps, amp: a*2]); });

		k33= if (freqvect[i]==1,{ 0},{ Synth(\dio1 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });



		k21= if (freqvect[i]==1,{ 0},{ Synth(\dio2 , [freq: (freqvect2[i]).midicps, amp: a*2]); });
		k11= if (freqvect[i]==1,{ 0},{ Synth(\dio2 , [freq: (freqvect2[i]+12).midicps, amp: a*2]); });

		k31= if (freqvect[i]==1,{ 0},{ Synth(\dio2 , [freq: (freqvect2[i]-12).midicps, amp: a*2]); });


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});


)



g.play;
g.stop;



(
		f=Routine({
	var delta;

var k23=0;
	var k13=0;
		var k33=0;
	var k43=0;

	var k21=0;
	var k11=0;
		var k31=0;
	var k41=0;
	var freqvect=[
45, 49, 52, 57, 52, 49,
		45, 49, 52, 57, 52, 49,
		45, 49, 52, 57, 52, 49,
		45, 49, 52, 57, 52, 49,


42, 45, 54, 59 , 54, 45,
		42, 45, 54, 59 , 54, 45,
		42, 45, 54 ,59 , 54, 45,
		42, 45, 54 ,59 , 54, 45,

38, 42, 45, 50, 45, 42,
		38, 42, 45, 50, 45, 42,
		38, 42, 45, 50, 45, 42,
		38, 42, 45, 50, 45, 42,

40, 44, 47, 52, 47, 44,
		40, 44, 47, 52, 47, 44,
		40, 44, 47, 52, 47, 44,
		40, 44, 47, 52, 47, 44

    	];






	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.1333333333;

		k23= if (freqvect[i]==1,{ 0},{ Synth(\dio3 , [freq: (freqvect[i]).midicps, amp: a*2]); });
		k13= if (freqvect[i]==1,{ 0},{ Synth(\dio3 , [freq: (freqvect[i]+12).midicps, amp: a*2]); });

		k33= if (freqvect[i]==1,{ 0},{ Synth(\dio3 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });





			i= if( i>=95, {0}, {i+1});




	delta.yield;

	};

});


)



f.play;
f.stop;




(

	o=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,

		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 4000, 3000, 3000, 4000, 1, 3000, 4000,

		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,


		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 1, 3000, 1, 4000, 1, 3000, 4000,
		3000, 4000, 4000, 3000, 4000, 1, 3000, 4000,



	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.1;
		freq=freqvect[i];
		a= if (freq==1,{0 } ,{ if (freq==1500, {2}, {1}) });

		k23=Synth(\noise4 ,[ freq: freq+1000, amp:a*2]);

    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});
)
o.play;


o.stop;




(

	v=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[
		1500, 1, 1500, 1, 1, 1, 1500, 1, 1500, 1, 1500, 1, 1, 1, 1500, 1,
		1500, 1, 1500, 1, 1, 1, 1500, 1500, 1, 1, 1500, 1, 1, 1, 1500, 1,
		1500, 1, 1500, 1, 1, 1, 1500, 1500, 1, 1, 1500, 1, 1, 1, 1500, 1,
		1500, 1, 1500, 1, 1, 1, 1500, 1500, 1, 1, 1500, 1500, 1, 1, 1500, 1

	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.2;
		freq=freqvect[i];
		a= if (freq==1,{0 } ,{ if (freq==1500, {2}, {1}) });

		k23=Synth(\noise3 ,[ freq: freq, amp:a*2]);

    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
v.play;


v.stop;

(

	b=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[
		1, 1, 1, 1, 3000, 1, 1, 3000, 1, 1, 1, 1, 3000, 1, 1, 1

	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.2;
		freq=freqvect[i];
		a= if (freq==1,{0 } ,{ if (freq==1500, {2}, {1}) });

		k23=Synth(\noise2 ,[ freq: freq-500, amp:a*2]);

    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
b.play;



b.stop;





(

	h=Routine({
	var delta;
	var freqvect=[28, 1, 1,28, 1, 1, 28,1
	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{

		delta=0.4;
		freq=freqvect[i];

		k1= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a]); });

		k2= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a/2]); });

    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)


h.play;

h.stop;


(

	p=Routine({
	var delta;
	var freqvect=[28, 28, 28, 28
	];
	var freq;
	var k1;
	var k2=0;
	var k3, k4;
	var a=1;
	var i=0;

	loop{

		delta=0.4;
		freq=freqvect[i];

		k1= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a]); });

		k2= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a/2]); });

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)


p.play;

p.stop;


(
		m=Routine({
	var delta;

var k23=0;
	var k13=0;
		var k33=0;
	var k43=0;
	var freqvect=[

69, 68, 1, 66, 1, 64, 1, 66, 1, 61, 1, 61, 1, 64, 1, 61,
		69, 68, 1, 66, 1, 64, 1, 66, 1, 61, 1, 61, 1, 64, 1, 61,
		69, 68, 1, 66, 1, 64, 1, 66, 1, 61, 1, 61, 1, 64, 1, 61,
		69, 68, 1, 66, 1, 64, 1, 66, 1, 61, 1, 61, 1, 64, 1, 61,

		73, 71, 1, 69, 1, 68, 1, 69, 1, 64, 1, 64, 1, 69, 1, 68,
		73, 71, 1, 69, 1, 68, 1, 69, 1, 64, 1, 64, 1, 69, 1, 68,
		73, 71, 1, 69, 1, 68, 1, 69, 1, 64, 1, 64, 1, 69, 1, 68,
		73, 71, 1, 69, 1, 68, 1, 69, 1, 64, 1, 64, 1, 69, 1, 68


    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.2;

		k23= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass3 , [freq: (freqvect[i]).midicps, amp: a*2]); });
		k13= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass3 , [freq: (freqvect[i]+12).midicps, amp: a*2]); });
		k43= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass3 , [freq: (freqvect[i]+7).midicps, amp: a*2]); });
		k33= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass3 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)



m.play;
m.stop;





(
		k=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect=[


71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,

		71, 81, 78, 83,
		76, 81, 78, 83,


		73, 81, 78, 83,
		76, 81, 78, 83,

		73, 81, 78, 83,
		76, 81, 78, 83,

		73, 81, 78, 83,
		76, 81, 78, 83,

		73, 81, 78, 83,
		76, 81, 78, 83,









    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.1;

		k23= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass4 , [freq: (freqvect[i]).midicps, amp: a*2]); });


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)


k.play;
k.stop;

s.record;


(
		j=Routine({
	var delta;

var k2=0;
	var k1=0;
	var k3=0;
	var k4=0;
	var freqvect1=[50, 52,49, 45];




		var freqvect2=[54, 57,54, 49




    	];


			var freqvect3=[57, 61,57, 52




    	];


			var freqvect4=[45,42,38,40




    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





		delta=3.2;

		k2= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect2[i]).midicps, amp: a*2]); });
		k1= if (freqvect2[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k3= if (freqvect3[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect3[i]).midicps, amp: a*2]); });
		k4= if (freqvect4[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect4[i]).midicps, amp: a*2]); });


			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});


)



j.play;


j.stop;



(
		d=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
1, 1, 33, 1,     1,  32, 1, 1,    33,1, 1,  25,   1, 1,  30,1,

	1, 1, 45,1, 1,  44,   1, 1,    45,1 , 1,  33, 1, 1,  40, 1


	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.2;
		   b=Synth(\hola , [freq: (freqvect[i]).midicps, amp: a]);

			f=Synth(\hola, [freq: (freqvect[i]+12).midicps, amp: a]);


			i= if( i>=31, {0}, {i+1});




	delta.yield;

	};

});


)
d.play;
d.stop;
j.stop;


(

	q=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[9000, 8000, 7000, 6000,   5000, 6000, 7000, 8000



	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.1;
		freq=freqvect[i];
		a= if (freq==1,{0 } ,{ if (freq==1500, {2}, {1}) });

		k23=Synth(\noise3 ,[ freq: freq+4000, amp:a]);

    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
q.play;


q.stop;





s.record;


k.play;

j.play;

d.play;

h.play;
b.play;
v.play;
o.play;
q.play;


q.stop;

h.stop;

m.play;

f.play;

g.play;

p.play;

q.play;

m.stop;
p.stop;

b.stop;
v.stop;
o.stop;
q.stop;


f.stop;
g.stop;

d.stop;
j.stop;

k.stop;



s.stopRecording;



