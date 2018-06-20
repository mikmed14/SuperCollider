s.boot;


(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 2, -8));
	Out.ar(out, Pan2.ar(sig*0.5, 0));




}).add;
)

(
SynthDef(\noise, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.4, 2, -8));
	Out.ar(out, Pan2.ar(sig*2.5, 0));




}).add;
)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.7, 2, -8));
	Out.ar(out, Pan2.ar(sig*1.5, 0));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq-2000);

	sig=sig*EnvGen.kr(Env.perc(0.001, 2.7, 2, -4));
	Out.ar(out, Pan2.ar(sig*1.5, 0));




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


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.2, 1.5, -8),   doneAction: 2);


		sig=HPF.ar(sig, 30);

		Out.ar(0,Pan2.ar(sig,0.2));

}).add;
)

(
SynthDef(
	\saw1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.5, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 500*SinOsc.kr(1, 2.5,  2, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2.4 ,0.2));

}).add;
)

(
SynthDef(
	\saw2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 4.5, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 500*SinOsc.kr(0.1, -1,  4, 4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0.2));

}).add;
)

(
SynthDef(
	\saw3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.75, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 500*SinOsc.kr(0.3, -2.5,  3, 3.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2.75 ,0.2));

}).add;
)

(
SynthDef(
	\saw4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.25, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 500*SinOsc.kr(1, -2.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*3.3 ,0.2));

}).add;


)

(
SynthDef(
	\saw5, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.75, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 500*SinOsc.kr(0.15, 2.5,  5, 5.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0.2));

}).add;
)

(
SynthDef(
	\bass1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 2, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 350*SinOsc.kr(0.25, 2.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3 ,-0.2));

}).add;
)

(
SynthDef(
	\bass2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.5, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 500*SinOsc.kr(2, 2.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,-0.2));

}).add;
)

(
SynthDef(
	\bass3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.5, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 500*SinOsc.kr(2, 2.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,-0.2));

}).add;

)


(
SynthDef(
	\high1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(1, 2, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 500*SinOsc.kr(0.2, 2.5,  2, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0.2));

}).add;
)


(
SynthDef(
	\high2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(1, 1.75, 0.7, 0),   doneAction: 2);





		sig3=LPF.ar(sig, 500*SinOsc.kr(0.2, -4.5,  3, 3.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3 ,0.2));

}).add;
)


(
SynthDef(
	\high3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.5, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 500*SinOsc.kr(0.2, 2.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0.2));

}).add;
)


(
SynthDef(
	\high4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 2.75, 0.7, 0),   doneAction: 2);




		sig3=LPF.ar(sig, 500*SinOsc.kr(0.2, -1.5,  3, 3.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.7 ,0.2));

}).add;
)



(
SynthDef(
	\amb1, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp*2);
		sig=SinOsc.ar(freq/2, 0, amp*2);
		sig=SinOsc.ar(freq/3, -2, amp);
		sig=SinOsc.ar(freq*4, -2, amp);


		sig=sig*EnvGen.kr(Env.perc(0.1, 4, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 1500*SinOsc.kr(0.2, -2.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2.5 ,-0.2));

}).add;
)

(
SynthDef(
	\amb2, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp*4);
		sig=SinOsc.ar(freq/2, 0, amp);
		sig=SinOsc.ar(freq*2, 0, amp);
		sig=SinOsc.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 4, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 1500*SinOsc.kr(1, -1.5,  1, 1.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2.5 ,-0.2));

}).add;
)

(
SynthDef(
	\amb3, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp*2);
		sig=SinOsc.ar(freq*1.5, 0, amp);
		sig=SinOsc.ar(freq/2, 0, amp*2);
		sig=SinOsc.ar(freq*2, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 4, 0.7, 0),   doneAction: 2);



		sig3=BPF.ar(sig, 1000*SinOsc.kr(0.2, -1.5,  2, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,-0.2));

}).add;
)


(
SynthDef(
	\hat, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001, 0.2, 0.7, 0),   doneAction: 2);



		sig3=BPF.ar(sig, 2500*SinOsc.kr(1, 2.5,  2, 2.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2 ,-0.2));

}).add;
)


(
SynthDef(
	\superbass, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.0001,2.6, 0.7, -4),   doneAction: 2);




		sig3=BPF.ar(sig, 500*SinOsc.kr(0.1, 2.5,  1, 1.01));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1 ,0));

}).add;
)


(
SynthDef(
	\sb1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.01, 4, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 500*SinOsc.kr(0.1, -2.5,  4, 4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*5.5 ,0));

}).add;
)


(
SynthDef(
	\sb2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.01, 1.6, 0.7, 0),   doneAction: 2);





		sig3=BPF.ar(sig, 500*SinOsc.kr(1, 2.5,  4, 4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*4.5 ,0.2));

}).add;
)


(
SynthDef(
	\sb3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.6, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 500*SinOsc.kr(0.1, -2.5,  4, 4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*4.5 ,0.2));

}).add;
)


(
SynthDef(
	\sb4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.01, 1, 0.7, 0),   doneAction: 2);




		sig3=BPF.ar(sig, 500*SinOsc.kr(0.8, -2.5,  4, 4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*5.5 ,0.2));

}).add;
)


(
SynthDef(
	\sh, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp);


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.2, 0.7, 0),   doneAction: 2);



		sig3=BPF.ar(sig, 2500*SinOsc.kr(1.1, -2.5,  4, 4.1));
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1 ,0.2));

}).add;
)

(
		d=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
58, 1, 58, 1,
		1, 1, 51, 1,
		1, 50, 1, 57,
		1, 58, 1, 1,
		1,57, 50, 1,
		1, 51, 1, 55,
		1, 1, 1, 1,
		1, 1, 57, 1



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
		{ i==0} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }
		{ i==1} {b=0; }
		{ i==2} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }
			{ i==3} {b=0;}


			{ i==4} {b=0; }
		{ i==5} {b=0;}
			{ i==6} {b=Synth(\saw3 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==7} {b=0;}

			{ i==8} {b=0;  }
		{ i==9} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }
			{ i==10} {b=0;  }
		{ i==11} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }

			{ i==12} {b=0; }
		{ i==13} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }
			{ i==14} {b=0; }
		{ i==15} {b=0; }

			{ i==16} {b=0;  }
		{ i==17} {b=Synth(\saw4 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }
			{ i==18} {b=Synth(\saw3 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==19} {b=0;}

			{ i==20} {b=0; }
		{ i==21} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }
			{ i==22} {b=0;  }
		{ i==23} {b=Synth(\saw5 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }

			{ i==24} {b=0;  }
		{ i==25} {b=0; }
			{ i==26} {b=0; }
		{ i==27} {b=0;}

			{ i==28} {b=0;  }
		{ i==29} {b=0; }
			{ i==30} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==31} {b=0; };


 i= if( i>=31, {0}, {i+1});



	delta.yield;

	};

});

)
d.play;
d.stop;

(
		c=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
43, 1, 1, 1, 36, 1, 39, 1



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
		{ i==0} {b=Synth(\bass1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }
		{ i==1} {b=0; }
		{ i==2} {b=0;}
			{ i==3} {b=0;}


			{ i==4} {b=Synth(\bass2 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }
		{ i==5} {b=0;}
			{ i==6} {b=Synth(\bass3 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==7} {b=0;};





 i= if( i>=7, {0}, {i+1});



	delta.yield;

	};

});

)
c.play;
c.stop;


(
		b=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
82, 1, 1, 1,
		74, 1, 1, 1,
		1, 1, 1, 81,
		1, 72, 1, 1,
		1, 1, 1, 1


	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=6.4/20;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
		{ i==0} {b=Synth(\high1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }
		{ i==1} {b=0; }
		{ i==2} {b=0;}
			{ i==3} {b=0;}


			{ i==4} {b=Synth(\high2 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==5} {b=0;}
			{ i==6} {b=0; }
		{ i==7} {b=0;}

			{ i==8} {b=0;  }
		{ i==9} {b=0; }
			{ i==10} {b=0;  }
		{ i==11} {b=Synth(\high3 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }

			{ i==12} {b=0; }
		{ i==13} {b=Synth(\high4 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]); }
			{ i==14} {b=0; }
		{ i==15} {b=0; }

			{ i==16} {b=0;  }
		{ i==17} {b=0;}
			{ i==18} {b=0;  }
		{ i==19} {b=0;};





 i= if( i>=19, {0}, {i+1});



	delta.yield;

	};

});

)
b.play;
b.stop;


(


	l=Routine({
	var delta;
	var freqvect=[30, 1, 1, 1,  1, 30, 1, 1, 30, 30, 1, 1, 1, 1, 1, 1,
		30, 1, 1, 1,  1, 30, 1, 1, 30, 30, 1, 1, 30, 1, 1, 1,
		30, 1, 1, 1,  1, 30, 1, 1, 30, 30, 1, 1, 1, 1, 1, 1,
		30, 1, 1, 1,  1, 30, 1, 1, 30, 30, 1, 30, 1, 1, 30, 1


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

    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)




l.play;



l.stop;


(
		a=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
55, 53, 50, 48,    55, 53,  55, 57,   55, 53, 50, 53,     55, 53, 60, 51


	];


		var freqvect2=[

58, 63, 58, 53,   58, 63, 58, 60,    58, 63, 58, 57,    58, 63, 53, 58

	];

		var freqvect3=[

62, 58, 55, 57,  62, 58, 67, 65,   62, 58, 55, 60,       62, 58, 67, 65

	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=1.6;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
		{ i==0} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
		}
		{ i==1} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }

		{ i==2} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }

			{ i==3} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }


			{ i==4} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );   }

		{ i==5} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }

			{ i==6} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }

		{ i==7} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }

			{ i==8} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }

		{ i==9} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }

			{ i==10} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );   }

		{ i==11} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }

			{ i==12} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }

		{ i==13} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }

			{ i==14} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); }

		{ i==15} {b=Synth(\amb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			r=Synth(\amb2 , [freq: (freqvect2[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  };

 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

)
a.play;
a.stop;



(

	q=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[5000, 1, 5000, 5000, 5000, 1, 5000, 1,
		5000, 1,  5000, 1,  5000, 1,  5000, 1,
		5000, 1,  5000, 1,  5000, 1,  5000, 1,
		5000, 1, 3000, 5000, 5000, 1, 5000, 1,

		5000, 1,  5000, 1,  5000, 1,  5000, 1,
		5000, 1,  5000, 1,  5000, 1,  5000, 1,
		5000, 1,  5000, 5000,  5000, 1,  5000, 5000,
		5000, 1,  5000, 1,  5000, 1,  5000, 1





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.05;
		freq=freqvect[i];

		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise2 , [freq: (freqvect[i]), amp: a*2]); });

		post(delta+' ');
    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
q.play;


q.stop;


(

	g=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1, 1, 1000, 1, 1000, 1,  1000, 1000,





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.2;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise , [freq: (freqvect[i]), amp: a*2]); });

		post(delta+' ');
    i= if( i>=7, {0}, {i+1});

		 delta.yield;
	}


});
)
g.play;


g.stop;



(

	m=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1,1, 1, 1,  7000, 1, 1, 7000,  1, 1, 1, 1,   7000, 1, 1, 1





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.1;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise3 , [freq: (freqvect[i]), amp: a*2]); });

		post(delta+' ');
    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;


m.stop;



(

	w=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[
		1, 1, 1, 1,
		1, 1, 7000, 1,
		1, 1, 1, 1,
		1,  1,  1,    7000





	];
	var a=1;
	var i=0;

	loop{
k23.free;
		delta=0.4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq: (freqvect[i]), amp: a*2]); });

		post(delta+' ');
    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});
)
w.play;


w.stop;


(

	n=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[1, 79,
		1, 79,
		1, 79,
		1, 79,

		1, 79,
		1, 79,
		1, 79,
		1, 72,

		1, 79,
		1, 79,
		1, 79,
		1, 79,

		1, 79,
		1, 79,
		1, 79,
		1, 81





	];
	var a=1;
	var i=0;

	loop{

		delta=0.4;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\hat , [freq: (freqvect[i].midicps), amp: a*2]); });

		post(delta+' ');
    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});
)
n.play;


n.stop;


(

	o=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[46, 46, 46, 46, 46, 46, 46, 46,
		43, 43, 43, 43, 43, 43, 43, 43,
		45, 45, 45, 45, 45, 45, 45, 45,
		41, 41, 41, 41, 36, 36, 36, 35,


		46, 46, 46, 46, 46, 46, 46, 46,
		43, 43, 43, 43, 43, 43, 43, 43,
		45, 45, 45, 45, 45, 45, 45, 45,
		50, 50, 50, 50, 51, 51, 53, 53






	];
	var a=1;
	var i=0;

	loop{

		delta=0.2;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\superbass , [freq: (freqvect[i].midicps), amp: a*2]); });

		post(delta+' ');
    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
o.play;


o.stop;


(
		k=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[

46, 1, 1, 1,  43, 1, 1, 1,  45, 1, 1, 1,  41, 1,  36, 1,
		46, 1, 1, 1,  43, 1, 1, 1,  45, 1, 1, 1,  50, 1,  51, 53


	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.4;

	loop{
		j=[0, 1, 2, 3, 4, 5, 6, 7].choose;


			a= if (freqvect[i]==1,{ 0},{ 1 });




		case
		{ i==0} {b=Synth(\sb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] );  }
		{ i==1} {b=0; }
		{ i==2} {b=0; }
			{ i==3} {b=0;}


			{ i==4} {b=Synth(\sb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==5} {b=0;}
			{ i==6} {b=0; }
		{ i==7} {b=0;}

			{ i==8} {b=Synth(\sb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);   }
		{ i==9} {b=0;}
			{ i==10} {b=0;  }
		{ i==11} {b=0; }

			{ i==12} {b=Synth(\sb4 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==13} {b=0; }
			{ i==14} {b=Synth(\sb4 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==15} {b=0; }

			{ i==16} {b=Synth(\sb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);   }
		{ i==17} {b=0; }
			{ i==18} {b=0;  }
		{ i==19} {b=0;}

			{ i==20} {b=Synth(\sb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==21} {b=0; }
			{ i==22} {b=0;  }
		{ i==23} {b=0; }

			{ i==24} {b=Synth(\sb1 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==25} {b=0; }
			{ i==26} {b=0; }
		{ i==27} {b=0;}

			{ i==28} {b=Synth(\sb2 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);   }
		{ i==29} {b=0; }
			{ i==30} {b=Synth(\sb3 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  }
		{ i==31} {b=Synth(\sb3 , [freq: (freqvect[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose; ]);  };



 i= if( i>=31, {0}, {i+1});



	delta.yield;

	};

});

)
k.play;
k.stop;


(

	x=Routine({
	var delta;
	var freq;

	var k23=0;

	var freqvect=[82, 79, 82, 84, 86, 84, 82, 79,
		82, 79, 82, 84, 86, 84, 82, 79,
		82, 79, 82, 84, 86, 84, 82, 79,
		82, 79, 82, 84, 86, 84, 82, 79,



82, 77, 82, 84, 86, 84, 82, 77,
		82, 77, 82, 84, 86, 84, 82, 77,
		82, 77, 82, 84, 86, 84, 82, 77,
		82, 77, 82, 84, 86, 84, 82, 77,

		79, 74, 79, 81, 82, 81, 79, 74,
		79, 74, 79, 81, 82, 81, 79, 74,
		79, 74, 79, 81, 82, 81, 79, 74,
		79, 74, 79, 81, 82, 81, 79, 74,


		77, 74, 79, 81, 82, 81, 77, 74,
		77, 74, 79, 81, 82, 81, 77, 74,
		77, 74, 79, 81, 82, 81, 77, 74,
		77, 74, 79, 81, 82, 81, 77, 74,




	];
	var a=1;
	var i=0;

	loop{

		delta=0.1;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\sh , [freq: (freqvect[i].midicps), amp: a*2]); });

		post(delta+' ');
    i= if( i>=127, {0}, {i+1});

		 delta.yield;
	}


});
)
x.play;


x.stop;



s.record;
c.play;

d.play;

l.play;

b.play;

a.play;

q.play;

n.play;

g.play;



m.play;
w.play;

o.play;
k.play;

x.play;

c.stop;
d.stop;
l.stop;
b.stop;
q.stop;
n.stop;
g.stop;
a.stop;
m.stop;
o.stop;
k.stop;
n.stop;
x.stop;
w.stop;

o.stop;

x.stop;

q.stop;

k.stop;
n.stop;


s.stopRecording;