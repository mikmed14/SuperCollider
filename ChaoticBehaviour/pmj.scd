s.boot;







(
SynthDef(
	\dis1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(80, 2.5, 0.05, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 1800*SinOsc.kr(0.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*12/10 ,-0.2));

}).add;
)


(
SynthDef(
	\dis2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(80, 2.5, 0.05, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1.8, 0.7, 0),   doneAction: 2);



		sig3=LPF.ar(sig, 1800*SinOsc.kr(0.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\hola, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);
		sig=sig+SinOsc.ar(freq*2, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.3, 0.7, 0),   doneAction: 2);



    sig3=LPF.ar(sig, 500);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*8.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\hola2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.2, 0.7, -4),   doneAction: 2);



		sig3=LPF.ar(sig, 500*SinOsc.kr(5, 0,  2, 2.5));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*6/10 ,0.2));

}).add;
)


(
SynthDef(
	\hola3, {|freq, amp|
		var sig, sig2, sig3;






		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.5, 0.7, -8),   doneAction: 2);




		sig3=BPF.ar(sig, 500*SinOsc.kr(4, -2.5, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*25/10 ,-0.2));

}).add;
)

(
SynthDef(
	\hola4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.3, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 500*SinOsc.kr(0.5, 2.5, 2, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*5/10 ,-0.2));

}).add;
)



(
SynthDef(
	\hola5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 3.3, 0.7, 0),   doneAction: 2);



		sig3=LPF.ar(sig, 500*SinOsc.kr(0.2, 1, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*4.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\hola6, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.3, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 600*SinOsc.kr(4.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*5.8/10 ,0.2));

}).add;

)



(
SynthDef(
	\hola7, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.5, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 700*SinOsc.kr(1, -2.5, 1, 1.01));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2.5/10 ,0));

}).add;
)



(
SynthDef(
	\hola8, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.7, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 700*SinOsc.kr(1.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/10 ,0));

}).add;
)


(
SynthDef(
	\bass, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.7, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 200*SinOsc.kr(0.1, 2.5, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*16/10 ,0));

}).add;
)


(
SynthDef(
	\bass2, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 1.7, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 200*SinOsc.kr(0.1, 2.5, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*20/10 ,0));

}).add;
)



(
SynthDef(
	\bass3, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 3, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 200*SinOsc.kr(0.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig*5/10 ,0));

}).add;
)



(
SynthDef(
	\bass4, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 3.7, 0.7, -8),   doneAction: 2);





		sig3=BPF.ar(sig, 200*SinOsc.kr(0.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*16/10 ,0));

}).add;
)




(
SynthDef(
	\b1, {|freq, amp|
		var sig, sig2, sig3;




sig=SinOsc.ar(freq, 0, amp);
		sig=sig+SinOsc.ar(freq*2, 0, amp);
		sig=sig+SinOsc.ar(freq*3, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.1, 4.7, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 400*SinOsc.kr(1, 2.5, 1, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig*0.5/10 ,0));

}).add;
)



(
SynthDef(
	\b2, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq*2, 0, amp);
		sig=sig+SinOsc.ar(freq*3, 0, amp);
		sig=sig+SinOsc.ar(freq*1.5, 0, amp);
		sig=sig+SinOsc.ar(freq*4, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.2, 1.8, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 400*SinOsc.kr(0.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/3/10 ,0));

}).add;
)


(
SynthDef(
	\fun1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.3, 1.7, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 700*SinOsc.kr(0.1, 2.5, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/62/10 ,0));

}).add;
)

(
SynthDef(
	\fun2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.7, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 700*SinOsc.kr(10.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/1.5/10 ,0));

}).add;
)


(
SynthDef(
	\fun3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 3.7, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 700*SinOsc.kr(1.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.3/10 ,0));

}).add;
)



(
SynthDef(
	\fun4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.7, 0.7, 0),   doneAction: 2);



		sig3=BPF.ar(sig, 700*SinOsc.kr(1.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/10 ,0));

}).add;
)


(
SynthDef(
	\fun5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.7, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 700*SinOsc.kr(1.1, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/20 ,0));

}).add;
)


(
SynthDef(
	\fun6, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.7, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 700*SinOsc.kr(0.41, 0, 1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/20 ,0));

}).add;

)

(
SynthDef(
	\fun7, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(1, 2.7, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 700*SinOsc.kr(1.41, -2.5, 2, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/2.5/10 ,0));

}).add;
)


(
SynthDef(
	\saw, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp);
			sig=sig+SinOsc.ar(freq-12, 0, amp);
		sig=sig+SinOsc.ar(freq+7, 0, amp);
		sig=sig+SinOsc.ar(freq+12, 0, amp);
		sig=sig+SinOsc.ar(freq+19, 0, amp);
		sig=sig+SinOsc.ar(freq+24, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.00001, 1.7, 0.7, -8),   doneAction: 2);




		sig3=BPF.ar(sig, 200*SinOsc.kr(3.41, -2.5, 2,4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/3/10 ,0.2));

}).add;

)



(
SynthDef(
	\bam, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 4.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 2.5, 0.7, 0),   doneAction: 2);



		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 2,2.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\bam2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 2.5, 0.7, 0),   doneAction: 2);



		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 2,2.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)



(
SynthDef(
	\bam3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 2.5, 0.7, 0),   doneAction: 2);



		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.1, -2, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\bam4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1.5, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)



(
SynthDef(
	\bam5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1.5, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 2,2.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)



(
SynthDef(
	\bam6, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1.5, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\bam6, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*4*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1.5, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*1.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\k1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 0.8, 0.7, -8),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(1.51, -2.5, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*7.5/10 ,-0.2));

}).add;
)

(
SynthDef(
	\k2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 0.6, 0.7, -8),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(1.51, -2.5, 4,4.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*2.5/10 ,-0.2));

}).add;
)

(
SynthDef(
	\k3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 0.6, 0.7, -8),   doneAction: 2);




		sig3=LPF.ar(sig, 2000*SinOsc.kr(1.51, -2.5, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*8.5/10 ,-0.2));

}).add;
)


(
SynthDef(
	\z1, {|freq, amp, f|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 3.2, 0.7, -8),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(f, 2, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3/2/10 ,0));

}).add;
)

(
SynthDef(
	\z2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq*2*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1, 0.7, -8),   doneAction: 2);





		sig3=LPF.ar(sig, 2000*SinOsc.kr(0.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 500);


		Out.ar(0,Pan2.ar(sig3*15/10 ,0));

}).add;
)


(
SynthDef(
	\z3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2*SinOsc.kr(280, 2.5, 0.02, 1), 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.000001, 1, 0.7, -8),   doneAction: 2);




		sig3=LPF.ar(sig, 500*SinOsc.kr(1.51, -2, 1,1.1));
	sig3=HPF.ar(sig3, 50);


		Out.ar(0,Pan2.ar(sig3*4/10 ,0));

}).add;
)


(
		a=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
58, 1, 53, 1,  61, 1, 1, 61,
		60, 1, 56, 1, 51, 1, 56, 1



	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.2;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
	  { i==0} {b=Synth(\hola , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==1} {b=0;}
		{ i==2} {b=Synth(\hola2 , [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==3} {b=0;}
		{ i==4} {b=Synth(\hola3 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==5} {b=0;}
		{ i==6} {b=0;}
		{ i==7} {b=Synth(\hola4, [freq: (freqvect[i]).midicps, amp: a]); }


		  { i==8} {b=Synth(\hola5 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==9} {b=0}
		{ i==10} {b=Synth(\hola6 , [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==11} {b=0}
		{ i==12} {b=Synth(\hola7 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==13} {b=0;}
		{ i==14} {b=Synth(\hola8, [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==15} {b=0; };


 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

)
a.play;
a.stop;
s.record;


(
		b=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
46, 1, 1, 37, 1, 1, 1, 1,

		44, 1, 1, 1, 1, 39, 1, 1



	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.2;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
	  { i==0} {b=Synth(\bass , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==1} {b=0;}
		{ i==2} {b=0;}
		{ i==3} {b=Synth(\bass2 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==4} {b=0;}
		{ i==5} {b=0;}
		{ i==6} {b=0;}
		{ i==7} {b=0 }


		  { i==8} {b=Synth(\bass3 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==9} {b=0;}
		{ i==10} {b=0;}
		{ i==11} {b=0;}
		{ i==12} {b=0;}
		{ i==13} {b=Synth(\bass4 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==14} {b=0;}
		{ i==15} {b=0; };


 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

)
b.play;
b.stop;




(
		c=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
1, 65, 1, 1,  1, 70, 68, 1,
		73, 56, 56, 56, 1, 60, 61, 1



	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.2;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
	  { i==0} {b=0;  }
		{ i==1} {b=Synth(\fun1, [freq: (freqvect[i]).midicps, amp: a/2]);}
		{ i==2} {b=0; }
		{ i==3} {b=0;}
		{ i==4} {b=0;}
		{ i==5} {b=Synth(\fun2, [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==6} {b=Synth(\fun3, [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==7} {b=0;}


		  { i==8} {b=Synth(\fun7, [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==9} {b=Synth(\fun4, [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==10} {b=Synth(\fun4, [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==11} {b=Synth(\fun4, [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==12} {b=0;}
		{ i==13} {b=Synth(\fun5, [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==14} {b=Synth(\fun6, [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==15} {b=0; };


 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

)
c.play;
c.stop;



(
		d=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
1, 61, 1, 63



	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.8;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
	  { i==0} {b=0;  }
		{ i==1} {b=Synth(\dis1, [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==2} {b=0; }
		{ i==3} {b=Synth(\dis2, [freq: (freqvect[i]).midicps, amp: a]);};


 i= if( i>=3, {0}, {i+1});



	delta.yield;

	};

});

)
d.play;
d.stop;


(
		e=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
49, 1, 1, 54, 1, 1, 56, 1,

		53, 1, 1, 49, 1, 1, 48, 1,


		46, 1, 1, 48, 1, 1, 49, 1,

		44, 1, 1, 41, 1, 1, 48, 1

	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.2;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
	  { i==0} {b=Synth(\bam , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==1} {b=0;}
		{ i==2} {b=0;}
		{ i==3} {b=Synth(\bam2 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==4} {b=0;}
		{ i==5} {b=0;}
		{ i==6} {b=Synth(\bam3 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==7} {b=0 }


		  { i==8} {b=Synth(\bam4 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==9} {b=0;}
		{ i==10} {b=0;}
		{ i==11} {b=Synth(\bam5 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==12} {b=0;}
		{ i==13} {b=0;}
		{ i==14} {b=Synth(\bam6 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==15} {b=0; }

			  { i==16} {b=Synth(\bam , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==17} {b=0;}
		{ i==18} {b=0;}
		{ i==19} {b=Synth(\bam2 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==20} {b=0;}
		{ i==21} {b=0;}
		{ i==22} {b=Synth(\bam3 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==23} {b=0 }


		  { i==24} {b=Synth(\bam4 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==25} {b=0;}
		{ i==26} {b=0;}
		{ i==27} {b=Synth(\bam5 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==28} {b=0;}
		{ i==29} {b=0;}
		{ i==30} {b=Synth(\bam6 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==31} {b=0; };


 i= if( i>=31, {0}, {i+1});



	delta.yield;

	};

});

)
e.play;
e.stop;





(
		x=Routine({
	var delta;

var k12=0;
	var k13=0;
	var freqvect=[

		70, 1, 70, 72, 73, 72, 70, 1,
		70, 1, 70, 72, 73, 72, 70, 1,
		70, 1, 70, 72, 73, 72, 70, 1,
		70, 1, 70, 72, 73, 72, 70, 1,

		68, 1, 68, 70, 72, 70, 68, 1,
		68, 1, 68, 70, 72, 70, 68, 1,
		68, 1, 68, 70, 72, 70, 68, 1,
		68, 1, 68, 70, 72, 70, 68, 1,


		68, 1, 68, 70, 72, 70, 68, 1,
		68, 1, 68, 70, 72, 70, 68, 1,
		68, 1, 68, 70, 72, 70, 68, 1,
		68, 1, 68, 70, 72, 70, 68, 1,


	    63, 1, 63, 68, 70,  68, 63, 1,
		63, 1, 63, 68, 70,  68, 63, 1,
		63, 1, 63, 68, 70,  68, 63, 1,
		63, 1, 63, 68, 70,  68, 63, 1



    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.1;
		k12=Synth(\saw , [freq: (freqvect[i]+12).midicps, amp: a*2]);


			i= if( i>=127, {0}, {i+1});




	delta.yield;

	};

});


)

x.play;
x.stop;



(
		y=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect1=[
1, 60, 61, 58



	];





	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
		var j=0;

		delta=0.2;
	loop{

		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= 1;




		case
	  { i==0} {b=0;



		}
		{ i==1} {  b=Synth(\k1 , [freq: (freqvect1[i]).midicps, amp: a]);
			d=Synth(\k1 , [freq: (freqvect1[i]+12).midicps, amp: a]);
			f=Synth(\k1 , [freq: (freqvect1[i]+7).midicps, amp: a])  }


			{ i==2} {  b=Synth(\k2 , [freq: (freqvect1[i]).midicps, amp: a]);
			d=Synth(\k2 , [freq: (freqvect1[i] +12).midicps, amp: a]);
			f=Synth(\k2 , [freq: (freqvect1[i]+7).midicps, amp: a])  }


			{ i==3} {  b=Synth(\k3 , [freq: (freqvect1[i]).midicps, amp: a]);
			d=Synth(\k3 , [freq: (freqvect1[i]+12).midicps, amp: a]);
			f=Synth(\k3 , [freq: (freqvect1[i]+7).midicps, amp: a])  };




			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});

)
y.play;
y.stop;


(
		z=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect1=[
68, 1, 1, 1



	];





	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
		var j=0;

		delta=0.2;
	loop{

		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= 1;




		case
		{ i==0} {b=Synth(\z1 , [freq: (freqvect1[i]).midicps, amp: a, f:[0.2, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5].choose; ]);
			d=Synth(\z1 , [freq: (freqvect1[i]+12).midicps, amp: a, f:[0.2, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5].choose;]);
			f=Synth(\z1 , [freq: (freqvect1[i]+7).midicps, amp: a, f:[0.2, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5].choose;])



		}
		{ i==1} {  b=0;
			d=0;
			f=0;
		}


			{ i==2} {  b=0;
			d=0;
			f=0; }


			{ i==3} { b=0;
			d=0;
			f=0; };



			i= if( i>=3, {0}, {i+1});




	delta.yield;

	};

});

)
z.play;
z.stop;



(
		u=Routine({
	var delta;

var k12=0;
	var k11=0;
	var k13=0;
	var freqvect=[


		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,


		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  1, 1, 1, 1,
		1, 1, 1, 1,  70, 1, 1, 70,




    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{





			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.1;
		k11=Synth(\z2 , [freq: (freqvect[i]).midicps, amp: a*2]);
		k12=Synth(\z2 , [freq: (freqvect[i]+7).midicps, amp: a*2]);
		k13=Synth(\z2 , [freq: (freqvect[i]+12).midicps, amp: a*2]);


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});


)

z.play;
u.play;
y.play;
u.stop;


(
		w=Routine({
	var delta;

var k12=0;
	var k11=0;
	var k13=0;
	var freqvect=[


	73, 77, 80, 82, 89, 85




    	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;

	loop{

freq=freqvect.choose;



			a= if (freqvect[i]==1,{ 0},{ 1 });
		delta=0.8/6;
		k11=Synth(\z3 , [freq: (freq).midicps, amp: a*2]);
		k12=Synth(\z3 , [freq: (freq-12).midicps, amp: a*2]);
		k13=Synth(\z3 , [freq: (freq).midicps, amp: a*2]);


			i= if( i>=63, {0}, {i+1});




	delta.yield;

	};

});


)

z.play;
w.play;
w.stop;



s.record;

z.play;

u.play;
y.play;

w.play;

a.play;

b.play;

c.play;

d.play;

x.play;

e.play;


z.stop;
y.stop;

e.stop;
x.stop;


u.stop;


d.stop;
w.stop;

a.stop;
b.stop;
c.stop;

s.stopRecording;
