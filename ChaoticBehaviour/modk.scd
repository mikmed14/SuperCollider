
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


		Out.ar(0,Pan2.ar(sig*0.25,0.2));

}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+2000);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4));
	Out.ar(out, Pan2.ar(sig*0.10, 0));




}).add;
)


(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+1500);

	sig=sig*EnvGen.kr(Env.perc(0.0000001, 2, 0.8, -8));
	Out.ar(out, Pan2.ar(sig*0.85, 0));




}).add;
)


(
SynthDef(\noise, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 2, -4));
	Out.ar(out, Pan2.ar(sig*0.5, 0));




}).add;
)



(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+500);

	sig=sig*EnvGen.kr(Env.perc(0.0001, 0.15, 2, -2));
	Out.ar(out, Pan2.ar(sig*0.6, 0.1));




}).add;
)

(
SynthDef(
	\saw2bass7, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1, 1, -8),   doneAction: 2);




    sig3=LPF.ar(sig, 5500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(20, 1.5, 2 ,3));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.558 ,0.3))

}).add;
)

(
SynthDef(
	\saw2bass6, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 5500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(10, 1.5, 2 ,3));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.258 ,0.3))

}).add;
)

(
SynthDef(
	\saw2bass4, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.5, 10, 1, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 5000);



		sig3=BPF.ar(sig3, 2000*SinOsc.kr(1, -1, 3 ,4));
		sig3=HPF.ar(sig3, 250);


		Out.ar(0,Pan2.ar(sig3*0.127 ,-0.3*SinOsc.kr(1, 0, 0.5, 0)))

}).add;
)

(
SynthDef(
	\saw2bass5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 8, 1, -8),   doneAction: 2);




    sig3=LPF.ar(sig, 3500);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(153, -1.5, 1 ,3));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.298 ,0.3))

}).add;
)



(
SynthDef(
	\saw2bass3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 8.5, 1.5, -8),   doneAction: 2);



    sig3=LPF.ar(sig, 5600);


		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.55, -1.5, 4 ,4));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.25 ,-0.3))

}).add;
)

(
SynthDef(
	\saw2bass2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 8.5, 1.5, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 5600);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.35, -1.5, 2 ,2));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.25 ,-0.3))

}).add;
)



(
SynthDef(
	\saw2bass1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 8.5, 1.5, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 5600);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.25, -1.5, 1 ,1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.25 ,-0.3))

}).add;
)

(
SynthDef(
	\saw2bass10, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 5.5, 1.5, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 5600);


		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.25, -1.5, 1 ,1));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.25 ,-0.3))

}).add;
)


(
SynthDef(
	\saw2bass, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 2));


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1.5, 1.5, -8),   doneAction: 2);





    sig3=LPF.ar(sig, 5600);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(7.55, 1.5, 4 ,4));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.65 ,-0.3))

}).add;
)

(
SynthDef(
	\aborigeno, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*SinOsc.kr(64, 0, 0.01, 1));


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.5, 1.5, -2),   doneAction: 2);




    sig3=LPF.ar(sig, 5600);



		sig3=BPF.ar(sig3, 1000*SinOsc.kr(0.45, 1.5, 2 ,2));
		sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*0.25 ,-0.3))

}).add;
)


(

		o=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,

		76, 76, 76, 76, 76, 76, 75, 74, 73, 72, 71, 69, 68, 68, 68, 68,


1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1



    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=1.6/16;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\aborigeno , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\aborigeno , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});







)
s.record;
o.play;



o.stop;

(
		h=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

      91, 91, 91, 91,
		88, 88, 88, 88





    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass6 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass6 , [freq: (freqvect1[i]+12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)
s.record;
h.play;


h.stop;


(
		m=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect1=[

      52, 55, 54, 50,  52, 55, 54, 59





    	];




	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.4;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect1[i]).midicps, amp: a*2]); });
		k13= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass5 , [freq: (freqvect1[i]-12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

m.play;


m.stop;
w.stop;
q.stop;
p.stop;
n.stop;




(
		p=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect=[
48, 47, 40, 1,
		42, 43, 36, 1






    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.8;


		k13= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass3 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

p.play;
q.play;
w.play;
n.play;
u.play;
s.record;
s.stopRecording;

p.stop;



(
		q=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect=[
48, 47, 40, 1,
		42, 43, 36, 1






    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.8;


		k13= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass2 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

q.play;

q.stop;




(
		w=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect=[
48, 47, 40, 1,
		42, 43, 36, 1






    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.8;


		k13= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass1 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)

w.play;

w.stop;



(
		u=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect=[
1, 1, 1, 1,   1,1, 1, 1, 1,  40,40, 40, 40 , 40, 40, 40, 40,
		1 ,1, 1, 1, 1, 1, 1, 1, 36,36, 36, 36, 36, 36, 36, 36






    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.2;


		k13= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass10 , [freq: (freqvect[i]-12).midicps, amp: a*2]); });


			i= if( i>=31, {0}, {i+1});




	delta.yield;

	};

});


)

u.play;

u.stop;



(
		n=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
	var k43=0;
	var freqvect=[

   1, 1, 40, 1,
		1, 1, 43, 1






    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.8;

		k23= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass4 , [freq: (freqvect[i]).midicps, amp: a*2]); });

		k33= if (freqvect[i]==1,{ 0},{ Synth(\saw2bass4 , [freq: (freqvect[i]+12).midicps, amp: a*2]); });


			i= if( i>=7, {0}, {i+1});




	delta.yield;

	};

});


)




n.play;
n.stop;

(
		k=Routine({
	var delta;

var k23=0;
	var k13=0;
	var k33=0;
	var k43=0;
	var freqvect1=[76, 78, 79, 71];
	var freqvect2=[76, 72, 71, 67];
	var freqvect3=[76, 74, 76, 71];
	var freqvect4=[76, 71, 69, 67];
	var freqvect5=[76, 71, 66, 67];

	var freqvect6=[76, 79, 78, 74];
	var freqvect7=[76, 79, 78, 83];
	var freqvect8=[76, 83, 78, 79];
	var freqvect9=[76, 84, 83, 79];
	var freqvect10=[76, 79, 78, 79];

	var freqvect21=[78, 74, 71, 76];
	var freqvect22=[79, 78, 74, 71];
	var freqvect23=[74, 79, 78, 76];
	var freqvect24=[78, 76, 71, 67];
	var freqvect25=[79, 81, 83, 76];

	var freqvect26=[67, 69, 71, 76];
	var freqvect27=[84, 83, 79, 76];
	var freqvect28=[74, 76, 79, 83];
	var freqvect29=[83, 79, 78, 74];
	var freqvect30=[74, 76, 83, 79];








	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
		x=[1, 2].choose;

	v=if(x==1, {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].choose}, {[21, 22, 23, 24, 25, 26, 27, 28, 29, 30].choose});


	loop{

	x=[1, 2].choose;

		v= if(i!=0, {v}, {if(x==1, {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].choose}, {[21, 22, 23, 24, 25, 26, 27, 28, 29, 30].choose});} );






		delta=0.2;

		k23=if(v==1, {Synth(\saw2bass , [freq: (freqvect1[i]).midicps, amp: a*2])} , {0}  );
		k23=if(v==2, {Synth(\saw2bass , [freq: (freqvect2[i]).midicps, amp: a*2])}  , {0} );
		k23=if(v==3, {Synth(\saw2bass , [freq: (freqvect3[i]).midicps, amp: a*2])} , {0});
		k23=if(v==4, {Synth(\saw2bass , [freq: (freqvect4[i]).midicps, amp: a*2])} , {0});
		k23=if(v==5, {Synth(\saw2bass , [freq: (freqvect5[i]).midicps, amp: a*2])} , {0});
		k23=if(v==6, {Synth(\saw2bass , [freq: (freqvect6[i]).midicps, amp: a*2])} , {0});
		k23=if(v==7, {Synth(\saw2bass , [freq: (freqvect7[i]).midicps, amp: a*2])} , {0});
		k23=if(v==8, {Synth(\saw2bass , [freq: (freqvect8[i]).midicps, amp: a*2])} , {0});
		k23=if(v==9, {Synth(\saw2bass , [freq: (freqvect9[i]).midicps, amp: a*2])} , {0});
		k23=if(v==10, {Synth(\saw2bass , [freq: (freqvect10[i]).midicps, amp: a*2])} , {0});


		k23=if(v==21, {Synth(\saw2bass , [freq: (freqvect21[i]).midicps, amp: a*2])} , {0});
		k23=if(v==22, {Synth(\saw2bass , [freq: (freqvect22[i]).midicps, amp: a*2])} , {0});
		k23=if(v==23, {Synth(\saw2bass , [freq: (freqvect23[i]).midicps, amp: a*2])} , {0});
		k23=if(v==24, {Synth(\saw2bass , [freq: (freqvect24[i]).midicps, amp: a*2])} , {0});
		k23=if(v==25, {Synth(\saw2bass , [freq: (freqvect25[i]).midicps, amp: a*2])} , {0});
		k23=if(v==26, {Synth(\saw2bass , [freq: (freqvect26[i]).midicps, amp: a*2])} , {0});
		k23=if(v==27, {Synth(\saw2bass , [freq: (freqvect27[i]).midicps, amp: a*2])} , {0});
		k23=if(v==28, {Synth(\saw2bass , [freq: (freqvect28[i]).midicps, amp: a*2])} , {0});
		k23=if(v==29, {Synth(\saw2bass , [freq: (freqvect29[i]).midicps, amp: a*2])} , {0});
		k23=if(v==30, {Synth(\saw2bass , [freq: (freqvect30[i]).midicps, amp: a*2])} , {0});






			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});


)




k.play;
k.stop;





(
		g=Routine({
	var delta;

var k23=0;
	var k13=0;
	var freqvect=[

    47, 50, 54, 55,  59, 62, 66, 67,   71, 74, 78, 79,  83, 86, 90, 91,
		90, 86, 83, 79,   78, 74, 71, 67,  66, 62, 59, 55, 54, 50, 47, 43




    	];
	var freqvect1=[

    47, 50, 54, 55,  59, 62, 66, 67,   66, 62, 59, 64,  62, 59, 57, 55,


  47, 52, 54, 55,  59, 64, 66, 67, 66, 62, 64, 59,  62, 57, 59, 52


    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect1[i]==1,{ 0},{ 1 });
		delta=0.1;

		k23= if (freqvect1[i]==1,{ 0},{ Synth(\saw2bass7 , [freq: (freqvect1[i]).midicps, amp: a*2]); });


			i= if( i>=31, {0}, {i+1});




	delta.yield;

	};

});


)







g.play;


g.stop;
k.stop;
m.stop;
w.stop;
q.stop;
p.stop;
n.stop;
u.stop;
a.stop;
h.stop;



(

	z=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1,4000






	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.4;
		freq=freqvect[i];




    i= if( i>=1, {0}, {i+1});

		 delta.yield;
	}


});
)
z.play;
l.play;
c.play;


z.stop;


(


	l=Routine({
	var delta;
	var freqvect=[30, 1, 1, 1,   30, 1, 1, 30,   1, 1,30,1 , 1, 1, 1, 1,
		30, 30, 1, 1,   30, 30, 1, 30,   1, 1,30,1 , 1, 30, 1, 1,

		30, 1, 30, 30,   1, 30, 1, 30,   1, 1,30,1 , 30, 1, 1, 1,

		30, 30, 1, 30,   30, 30, 1, 30,   1, 30,1,30 , 1, 30, 1, 30


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

		k1= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a]); });

		k2= if (freq==1,{ 0},{ Synth(\bass ,[ freq: (freq).midicps, amp:a/2]); });

    i= if( i>=62, {0}, {i+1});

		 delta.yield;
	}


});
)


l.play;



l.stop;
z.stop;
c.stop;



(

	a=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1000, 1, 1, 1000,   1, 1, 1000, 1,   1, 1000, 1, 1,   1000, 1, 1, 1,
		1, 1, 1000, 1,   1000, 1, 1, 1000,   1, 1, 1000, 1,   1, 1, 1, 1,

		1000, 1, 1000, 1000,   1, 1, 1000, 1,   1000, 1, 1, 1000,   1, 1, 1000, 1,


	1, 1, 1000, 1,   1000, 1000, 1, 1000,   1, 1, 1000, 1,   1, 1, 1, 1




	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.1;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise2 , [freq: (freqvect[i]), amp: a*2]); });


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
a.play;
b.play;
c.play;




(

	b=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1, 3000, 3000, 1,   3000, 3000, 1, 3000,   3000, 1, 3000, 3000,   1, 3000, 3000, 3000,
		3000, 3000, 1, 3000,   1, 3000, 3000, 1,   3000, 3000, 1, 3000,   3000, 3000, 3000, 3000,

		1, 3000, 1000, 1,   3000, 3000, 1, 3000,   1, 3000, 3000, 1,   3000, 3000, 1, 3000,


	3000, 3000, 1, 3000,   1, 1, 3000, 1,   3000, 3000, 1, 3000,   3000, 3000, 3000, 3000




	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.1;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise , [freq: (freqvect[i]), amp: a*2]); });


    i= if( i>=62, {0}, {i+1});

		 delta.yield;
	}


});
)
a.play;
l.play;
b.play;
c.play;

b.stop;
a.stop;




(

	c=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[
		10000, 1, 10000, 10000,
		10000, 10000, 10000, 10000,
		10000, 10000, 1, 10000,
		10000, 10000, 10000, 10000,
		10000, 10000, 10000, 10000

		,







	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.1;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq: (freqvect[i]), amp: a*2]); });


    i= if( i>=19, {0}, {i+1});

		 delta.yield;
	}


});
)
c.play;

a.stop;

c.stop;




s.record;

p.play;
q.play;
w.play;
n.play;
u.play;

k.play;

h.play;

m.play;

g.play;

a.play;
b.play;
c.play;

l.play;
z.play;


c.stop;
b.stop;
z.stop;


a.stop;
l.stop;
p.stop;
q.stop;
w.stop;
n.stop;
u.stop;
k.stop;
h.stop;
m.stop;
g.stop;


s.stopRecording;