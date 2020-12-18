
s.boot;
s.reboot;
s.options.memSize=2*1024*1024;


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
53, 53, 60, 56, 53, 60, 56, 53,
		53, 53, 60, 56, 53, 60, 56, 53,

		51, 51, 60, 58, 51, 60, 58, 51,
		51, 51, 60, 58, 51, 60, 58, 51,


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


    i= if( i>=31, {0}, {i+1});

		 delta.yield;
	}


});


)
b.play;
s.record;




(
SynthDef(
	\sawbass, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 30*SinOsc.kr(0.1, 2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
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
Out.ar(0,Pan2.ar(sig*7.5 ,0.1));

}).add;
)


(
SynthDef(
	\sawbass2, {|freq, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq).midicps) * [1, 1.001, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 30*SinOsc.kr(0.01, 2.5, 3.95 ,4.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 3, 1.7, -4),   doneAction: 2);
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


	a=Routine({
	var delta;
	var freqvect=[

        1, 1, 1, 31, 1, 1, 1, 1,
		1, 1, 1, 36, 1, 1, 36, 34



	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("sawbass", [freq: freqvect[i], amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
a.play;


a.stop;






(


	c=Routine({
	var delta;
	var freqvect=[

        29, 1, 1, 1, 32, 1, 36, 1,
		27, 1, 1, 1, 34, 1, 1, 1



	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
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
a.play;
c.play;


a.stop;
c.stop;



(
SynthDef(\noise5, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*1.744, -0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)


(
SynthDef(\noise4, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(0.1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 2.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*1.944, -0.1));

 Out.ar(bus,Pan2.ar(sig*0.002 ,0.2));




}).add;
)


(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	//Out.ar(out, Pan2.ar(sig*2.344, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,-0.2));




}).add;
)


(

	m=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



2, 1, 2, 2, 2, 1, 2, 1,   1, 1, 2, 1,  2, 1, 2, 1,
		2, 1, 2, 2, 2, 1, 2, 1,   1, 1, 2, 1,  2, 1, 2, 1,
		2, 1, 2, 2, 2, 1, 2, 1,   1, 1, 2, 1,  2, 1, 2, 1,
		2, 1, 2, 2, 2, 1, 2, 1,   2, 1, 2, 2,  2, 1, 2, 1,

	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.15/2;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise5 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)







(

	n=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



1, 2,

	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.6;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise4 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=1, {0}, {i+1});

		 delta.yield;
	}


});
)



(

	o=Routine({
	var delta;
	var freq;

	var k23=0;




		var freqvect=[



2,   1,  2,  1,  2,   1,   2,   2,

		2,   1,  2,  1,  2,   1,   2,   2,

		2,   1,  2,  1,  2,   1,   2,   2,

		2,   2,  2,  1,  2,   1,   2,   2,




		2,   1,  2,  1,  2,   1,   2,   2,

		2,   1,  2,  1,  2,   1,   2,   2,

		2,   1,  2,  1,  2,   1,   2,   2,

		2,   2,  2,  1,  2,   1,   2,   1,

	];
	var a=1;
	var i=0;
//var bus=Bus.audio(s,2);


	loop{

		delta=0.15;
		freq=freqvect[i];


		k23= if (freqvect[i]==1,{ 0},{ Synth(\noise3 , [freq:[1500].choose , amp: a*2,  vr: [1, 1.5, 2, 2.5, 3, 3.5].choose , pan: [-0.2, -0.1, 0, 0.1, 0.2 ].choose ; ]) ;
		//Synth.new( "verbok", [bus: ~bus6.index]);

		});


    i= if( i>=63, {0}, {i+1});

		 delta.yield;
	}


});
)
m.play;
n.play;
o.play;



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
Out.ar(0,Pan2.ar(sig*4 ,-0.1));

}).add;
)


(


	f=Routine({
	var delta;
	var freqvect=[
         60, 60, 62, 63, 1, 63, 62, 60,
		 1, 1, 60, 58, 60, 60, 67, 65,
		1, 63, 1, 58, 1, 58, 67, 65,
		1, 63, 1, 58, 1, 58, 60, 58

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




(
SynthDef(\noise3, {arg out=0, effectOut=0, freq=400, amp=0.2, vr=3, pan=0.2, bus;

	var sig;

	sig=WhiteNoise.ar(1*amp, 0);
	sig=BPF.ar(sig, (freq+500)*SinOsc.kr(1, 2.5, 0.8, 1.5));

	sig=sig*EnvGen.kr(Env.perc(0.005132, 0.48, 2, -8), doneAction:2);
	Out.ar(out, Pan2.ar(sig*2.044, 0.2));

 Out.ar(bus,Pan2.ar(sig*0.002 ,-0.2));




}).add;
)



(
SynthDef(
	\peassaw2, {|freq, alt, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+24).midicps) * [1, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 2570*SinOsc.kr(0.1, -2.5, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 5.35, 1.7, -4),   doneAction: 2);
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
Out.ar(0,Pan2.ar(sig*4 ,0.2));

}).add;
)

(
SynthDef(
	\peassaw, {|freq, alt, amp, bus, osc|
		var sig, sig1, sig2, sig3;


//sig=LFSaw.ar(freq*2, 0, 2.5, 0);




		sig3 = Mix.ar(LFSaw.ar(((freq+24).midicps) * [1, 1.007]  ));
		//sig3=LFSaw.ar((freq+12).midicps, 0, 3.5, 0);
		sig3=BPF.ar(sig3, 2570*SinOsc.kr(0.1, -2.5, 0.95 ,1.05), 2*SinOsc.kr( 0.04, 2, 0.9, 1.1));
		sig3=sig3*EnvGen.kr(Env.perc(0.05, 12.35, 1.7, -4),   doneAction: 2);
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
Out.ar(0,Pan2.ar(sig*4 ,0.1));

}).add;
)


(


	g=Routine({
	var delta;
	var freqvect=[

60, 1, 58, 1, 56, 1, 55, 1,
		53, 51, 1, 1, 1, 1, 1, 1,
	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw2", [freq: freqvect[i] , alt: [12, 24, 36].choose, amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//


    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)







(


	h=Routine({
	var delta;
	var freqvect=[

1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 51, 1, 1, 1, 1, 1,
	];

	//var bus2=Bus.audio(s, 2);
	var freq;
	var k1;
	var k2=0;
	var k5, k6;
	var a=1;
	var i=0;

	loop{

		delta=0.6;
		freq=freqvect[i];
		k5=if(freqvect[i]==1,  {0 }, {Synth.new("peassaw", [freq: freqvect[i] , alt: [12, 24, 36].choose, amp: 1 ,  osc: [1, 0.8, 0.5, 0.6, ].choose]);

			//k6 = Synth.new( "peasdelaya", [bus: bus2.index]);
		} );

	//

    i= if( i>=15, {0}, {i+1});

		 delta.yield;
	}


});


)
h.play;
g.play;






h.stop;
g.stop;


n.stop;
m.stop;
o.stop;

f.stop;

a.stop;
c.stop;
b.stop;

s.stopRecording;
