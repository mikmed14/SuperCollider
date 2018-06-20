
s.boot;

(
SynthDef(\noise21, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 2, -8),  doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.35, -0.2));




}).add;
)

(
SynthDef(\noise11, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.1, 2, -8) ,  doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.35, 0.2));




}).add;
)


(
SynthDef(\noise31, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.15, 2, -8),   doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.35, -0.2));




}).add;
)


(
SynthDef(\noise41, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.001, 0.2, 2, -4)  ,  doneAction: 2 );
	Out.ar(out, Pan2.ar(sig*0.205, 0.2));




}).add;
)


(
SynthDef(\noise51, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq);

	sig=sig*EnvGen.kr(Env.perc(0.001, 0.8, 2, -4) ,  doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.255, 0.3));




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


		Out.ar(0,Pan2.ar(sig*0.155,0.2));

}).add;
)



(
SynthDef(
	\bass2, {|freq, amp|
		var sig, sig2, sig3;



		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 4, 1, -2) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 4, 1,- 2) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 4, 1, -2) , doneAction: 2) , -3,  amp*2  );
		sig = SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -2) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1,- 8) , doneAction: 2) , -3,  amp*2  );
		  sig = sig+SinOsc.ar(freq*2*EnvGen.kr(Env.perc(0.001, 1, 1, -8) , doneAction: 2) , -3,  amp*2  );


		sig=sig*EnvGen.kr(Env.perc(0.01, 0.2, 1.5, -8),   doneAction: 2);
		sig=sig+ BPF.ar(WhiteNoise.ar(1,0)*EnvGen.kr(Env.perc(0.0001, 0.05, 2, 0), doneAction: 2), 7000 );


		sig=HPF.ar(sig, 30);


		Out.ar(0,Pan2.ar(sig*0.205,0));

}).add;
)

(
SynthDef(\noise2, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.2, 2, -8),  doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.25, 0));




}).add;
)

(
SynthDef(\noise1, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.4, 2, -8) ,  doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.25, 0));




}).add;
)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq+00);

	sig=sig*EnvGen.kr(Env.perc(0.00001, 0.7, 2, -8),   doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.25, 0));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq-2000);

	sig=sig*EnvGen.kr(Env.perc(0.001, 2.7, 2, -4)  ,  doneAction: 2 );
	Out.ar(out, Pan2.ar(sig*0.080, 0));




}).add;
)


(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, dur=10;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, freq-2000);

	sig=sig*EnvGen.kr(Env.perc(0.001, 2.7, 2, -4) ,  doneAction: 2);
	Out.ar(out, Pan2.ar(sig*0.0855, 0));




}).add;
)


(
SynthDef(
	\amb1, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp*2.5, 0);
		sig=sig+SinOsc.ar(freq/2, 0, amp, 0);
		sig=sig+SinOsc.ar(freq/4, 0, amp, 0);
		sig=sig+SinOsc.ar(freq*4, 0, amp/2, 0);


		sig=sig*EnvGen.kr(Env.perc(0.1, 6, 0.7, -2),   doneAction: 2);




		sig3=BPF.ar(sig, 780*SinOsc.kr(0.2, -3, 1.1 ,3));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3 ,0));

}).add;
)


(
SynthDef(
	\amb2, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp, 0);
		sig=sig+SinOsc.ar(freq/2, 0, amp, 0);
		sig=sig+SinOsc.ar(freq*2, 0, amp, 0);
		sig=sig+SinOsc.ar(freq*4, 0, amp, 0);


		sig=sig*EnvGen.kr(Env.perc(0.1, 6, 0.7, 0),   doneAction: 2);



		sig3=BPF.ar(sig, 1780*SinOsc.kr(4.85, -3, 1.1 ,3));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0));

}).add;
)


(
SynthDef(
	\amb3, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp*2, 0);
		sig=sig+SinOsc.ar(freq/2, 0, amp, 0);
		sig=sig+SinOsc.ar(freq/4, 0, amp*2, 0);
		sig=sig+SinOsc.ar(freq*2, 0, amp, 0);


		sig=sig*EnvGen.kr(Env.perc(0.1, 6, 0.7, 0),   doneAction: 2);



		sig3=BPF.ar(sig, 1080*SinOsc.kr(2.4, -3, 1.1 ,3));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2 ,0));

}).add;
)

(
SynthDef(
	\saw, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp, 0);



		sig=sig*EnvGen.kr(Env.perc(0.00001, 4.5, 0.7, -8),   doneAction: 2);



	sig3=BPF.ar(sig, 1780*SinOsc.kr(1.075, -2.5, 2.2 ,3.1));
    sig3=LPF.ar(sig3, 1000);
	sig3=HPF.ar(sig3, 100);


		Out.ar(0,Pan2.ar(sig3 ,0));

}).add;
)


(
SynthDef(
	\sin, {|freq, amp|
		var sig, sig2, sig3;



		sig=SinOsc.ar(freq, 0, amp, 0);
		sig=sig+SinOsc.ar(freq/2, 0, amp, 0);
		sig=sig+SinOsc.ar(freq*2, 0, amp/2.5, 0);


		sig=sig*EnvGen.kr(Env.perc(0.00001, 6, 0.7, -8),   doneAction: 2);



		sig3=BPF.ar(sig, 1080*SinOsc.kr(0.75, 3, 1.1 ,3));
    sig3=LPF.ar(sig3, 5000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3/3 ,0));

}).add;
)



(
SynthDef(
	\saw1, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq/2, 0, amp, 0);
		sig=sig+SinOsc.ar(freq, amp, 0.5, 0);



		sig=sig*EnvGen.kr(Env.perc(0.00001, 6, 1.7, 0),   doneAction: 2);



	sig3=BPF.ar(sig, 300*SinOsc.kr(0.00405, -2.1, 4 ,4.1));
    sig3=LPF.ar(sig3, 100);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2.5 ,0));

}).add;
)


(
SynthDef(
	\saw2, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp, 0);



		sig=sig*EnvGen.kr(Env.perc(0.0001, 3.5, 0.7, 0),   doneAction: 2);




	sig3=BPF.ar(sig, 1080*SinOsc.kr(0.0175, -2.5, 1 ,1.1));
    sig3=LPF.ar(sig3, 2500);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*2 ,0));

}).add;
)


(
SynthDef(
	\saw3, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp, 0);



		sig=sig*EnvGen.kr(Env.perc(0.001, 5.5, 0.7, 0),   doneAction: 2);



	sig3=BPF.ar(sig, 1280*SinOsc.kr(0.005, -2.5, 0.5 ,1.1));
    sig3=LPF.ar(sig3, 2000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0));

}).add;
)


(
SynthDef(
	\saw4, {|freq, amp|
		var sig, sig2, sig3;



		sig=LFSaw.ar(freq, 0, amp, 0);



		sig=sig*EnvGen.kr(Env.perc(0.001, 1.5, 0.7, 0),   doneAction: 2);




	sig3=BPF.ar(sig, 580*SinOsc.kr(4.7015, -2.5, 4 ,4.1));
    sig3=LPF.ar(sig3, 2000);
	sig3=HPF.ar(sig3, 30);


		Out.ar(0,Pan2.ar(sig3*1.5 ,0));

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
        49, 1, 51, 52,
		47, 1, 51, 52,
		44, 1, 51, 52,
		45, 1, 51, 52



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
	  { i==0} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==1} {b=0;}
		{ i==2} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==3} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==4} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==5} {b=0;}
		{ i==6} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==7} {b=Synth(\saw2, [freq: (freqvect[i]).midicps, amp: a]); }


		  { i==8} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==9} {b=0}
		{ i==10} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==11} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==12} {b=Synth(\saw1 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==13} {b=0;}
		{ i==14} {b=Synth(\saw2, [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==15} {b=Synth(\saw2 , [freq: (freqvect[i]).midicps, amp: a]); };

 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

)
a.play;










(
		b=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
49, 47, 44, 45


	];


		var freqvect2=[

56, 54, 52, 59

	];

		var freqvect3=[

61, 59, 56, 52

	];



	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=3.2;

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
			d=Synth(\amb3 , [freq: (freqvect3[i]).midicps, amp: a, ph: [0.56, 0.99, 1.25, 1.7, 2.5, 3.3].choose;   ] ); };




 i= if( i>=3, {0}, {i+1});



	delta.yield;

	};

});

)
b.play;


(
		c=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
  1,1,1,1,
		1,1,1,1,

		56, 1, 1, 1,
		59, 1, 57, 56



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
	  { i==0} {b=0  }
		{ i==1} {b=0;}
		{ i==2} {b=0 }
		{ i==3} {b=0;}
		{ i==4} {b=0;}
		{ i==5} {b=0;}
		{ i==6} {b=0;}
		{ i==7} {b=0;}


		  { i==8} {b=Synth(\saw3 , [freq: (freqvect[i]).midicps, amp: a]);  }
		{ i==9} {b=0}
		{ i==10} {b=0; }
		{ i==11} {b=0;}
		{ i==12} {b=Synth(\saw3 , [freq: (freqvect[i]).midicps, amp: a]);}
		{ i==13} {b=0;}
		{ i==14} {b=Synth(\saw4, [freq: (freqvect[i]).midicps, amp: a]); }
		{ i==15} {b=Synth(\saw4 , [freq: (freqvect[i]).midicps, amp: a]); };

 i= if( i>=15, {0}, {i+1});



	delta.yield;

	};

});

)
c.play;
b.play;
c.stop;


(
		d=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;





	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.2;

	loop{
		i=[0, 1, 2, 3, 4, 5, 6, 7].choose;

		case
	  { i==0} {b=Synth(\bass , [freq: (30).midicps, amp: a]); }
		{ i==1} {b=Synth(\saw , [freq: ([80, 76, 73, 68, 64, 61, 56, 52, 49 ].choose ).midicps, amp: a]);}
		{ i==2} {b=Synth(\sin , [freq: ([80, 76, 73, 68, 64, 61, 56, 52, 49 ].choose ).midicps, amp: a]);}
		{ i==3} {b=Synth(\noise1 , [freq: 1000, amp: a]); }
		{ i==4} {b=Synth(\noise2 , [freq: 1500, amp: a]);}
		{ i==5} {b=Synth(\noise3 , [freq: 2500, amp: a]);}
		{ i==6} {b=Synth(\noise4 , [freq: 3500, amp: a]);}
		{ i==7} {b=Synth(\noise5 , [freq: 5000, amp: a]);}


		  { i==8} {b=Synth(\noise6 , [freq: 6500, amp: a]); };

 j= if( i>=3, {0}, {j+1});



	delta.yield;

	};

});

)
d.play;

s.record;

(


	l=Routine({
	var delta;
	var freqvect=[35, 35, 35, 35


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

		k1= if (freq==1,{ 0},{ Synth(\bass2 ,[ freq: (freq).midicps, amp:a]); });

		k2= if (freq==1,{ 0},{ Synth(\bass2 ,[ freq: (freq).midicps, amp:a/2]); });

    i= if( i>=3, {0}, {i+1});

		 delta.yield;
	}


});
)




l.play;

s.record;

l.stop;


(
		f=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
  1,1,1,1,
		1,1,1,1,

		56, 1, 1, 1,
		59, 1, 57, 56



	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.1;

	loop{
		i=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].choose;

		case

		{ i==0} {b=Synth(\noise11 , [freq: 1000, amp: a]); }
		{ i==1} {b=Synth(\noise21 , [freq: 1500, amp: a]);}
		{ i==2} {b=Synth(\noise31 , [freq: 2500, amp: a]);}
		{ i==3} {b=Synth(\noise41 , [freq: 3500, amp: a]);}
		{ i==4} {b=Synth(\noise51 , [freq: 5000, amp: a]);}
		{ i==5} {b=Synth(\noise11 , [freq: 6000, amp: a]); }
		{ i==6} {b=Synth(\noise21 , [freq: 5500, amp: a]);}
		{ i==7} {b=Synth(\noise31 , [freq: 4500, amp: a]);}
		{ i==8} {b=Synth(\noise41 , [freq: 3000, amp: a]);}
		{ i==9} {b=Synth(\noise51 , [freq: 2000, amp: a]);}
		{ i==10} {b=Synth(\saw , [freq: ([80, 76, 73, 68, 83, 85 ].choose+12 ).midicps, amp: a])}
		{ i==11} {b=Synth(\saw , [freq: ([80, 76, 73, 68, 83, 85 ].choose-12+7 ).midicps, amp: a*1.5])};

 j= if( i>=3, {0}, {j+1});



	delta.yield;

	};

});

)
f.play;
g.play;
d.play;
f.stop;



(
		g=Routine({
	var delta;
	var b=0;
	var d=0;
	var f=0;
	var t=0;


	var freqvect=[
  1,1,1,1,
		1,1,1,1,

		56, 1, 1, 1,
		59, 1, 57, 56



	];


	var durvec=[0.6, 0.3, 0.3];

	var freq;
		var a=1.5;
	var i=0;
	var j=0;


	delta=0.1;

	loop{
		i=[0, 1, 2, 3, 4, 5, 6, 7].choose;


		case

		{ i==0} {b=Synth(\noise11 , [freq: 1000, amp: a*1.5]); }
		{ i==1} {b=Synth(\noise21 , [freq: 1500, amp: a*1.5]);}
		{ i==2} {b=Synth(\noise31 , [freq: 2500, amp: a*1.5]);}
		{ i==3} {b=Synth(\noise41 , [freq: 500, amp: a*1.5]);}
		{ i==4} {b=Synth(\noise51 , [freq: 3000, amp: a*1.5]);}
		{ i==5} {b=Synth(\noise11 , [freq: 2000, amp: a*1.5]); }

		{ i==6} {b=Synth(\saw , [freq: ([80, 76, 73, 68, 83, 85 ].choose-12 ).midicps, amp: a*1.5])}
		{ i==7} {b=Synth(\saw , [freq: ([80, 76, 73, 68, 83, 85 ].choose-24 ).midicps, amp: a*2])};



 j= if( i>=3, {0}, {j+1});



	delta.yield;

	};

});

)
g.play;
g.stop;

d.stop;
b.stop;
a.stop;



s.record;

l.play;
f.play;
c.play;
b.play;
d.play;
g.play;
a.play;

f.stop;
g.stop;
l.stop;

c.stop;
a.stop;

d.stop;
b.stop;


s.stopRecording;