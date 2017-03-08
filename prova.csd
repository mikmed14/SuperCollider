<CsoundSynthesizer>


sr=44100
ksmps=32
nchnls=2



ifn1 ftgen 1, 0, 16384, 10, 1                                          ; Sine
ifn2 ftgen 2, 0, 16384, 10, 1, 0.5, 0.3, 0.25, 0.2, 0.167, 0.14, 0.125, .111   ; Sawtooth
ifn3 ftgen 3, 0, 16384, 10, 1, 0,   0.3, 0 ,   0.2, 0,     0.14, 0,     .111   ; Square
ifn4 ftgen 4, 0, 16384, 10, 1, 1,   1,   1,    0.7, 0.5,   0.3,  0.1 




kenv linen 1, .3, p3, .2

 outs oscili(p4*kenv, p5), oscili(p4*kenv, p5)






 
/*
instr 3

kamp = p4
kcps = p5
ifn  = p6


k1 oscili kamp, kcps, ifn
     outs asig,asig
endin



*/




instr 4


kenv linen 1, .5, p3, .5

outs oscili(p4*kenv, p5 ), oscili(p4*kenv, p5)




endin

/*

schedule(1, 0, .5, 0dbfs/2, 440)
schedule(1, .5, .5, 0dbfs/2, cpsmidinn(50))
schedule(1, 1, .5, 0dbfs/2, cpsmidinn(57))
schedule(1, 1.5, .5, 0dbfs/2, cpsmidinn(58))
schedule(1, 2, .5, 0dbfs/2, cpsmidinn(65))
schedule(1, 2.5, .5, 0dbfs/2, cpsmidinn(62))



schedule(1, 3, 1, 0dbfs/2, cpsmidinn(50))
schedule(1, 4, 1, 0dbfs/2, cpsmidinn(57))
schedule(1, 5, 1, 0dbfs/2, cpsmidinn(58))
schedule(1, 6, 1, 0dbfs/2, cpsmidinn(62))
schedule(1, 7, 1, 0dbfs/2, cpsmidinn(69))
schedule(1, 8, 1, 0dbfs/2, cpsmidinn(65))

*/




schedule(1, 3, 2, 0dbfs/2, 240)
schedule(1, 5, 2, 0dbfs/2, 220)

schedule(1, 10, 2, 0dbfs/2, 440)
schedule(1, 12, 2, 0dbfs/2, 400)
schedule(1, 14, 7, 0dbfs/2, 480)

schedule(1, 2, 2, 0dbfs/2, 500+(500/7))
schedule(1, 4, 2, 0dbfs/2, 500+(2*(500/7)))
schedule(1, 6, 2, 0dbfs/2, 500+((500/7)))

schedule(1, 0, 2, 0dbfs/2, 100)

schedule(1, 2, 2, 0dbfs/2, 100+(100/7))
schedule(1, 4, 2, 0dbfs/2, 100+(2*(100/7)))
schedule(1, 6, 2, 0dbfs/2, 100+(3*(100/7)))


/*

label1:
schedule(1 , 7 , 0.025 , 0dbfs/2 , 164.814 , 1300)
schedule(1 , 7.025 , 0.025 , 0dbfs/2 , 174.814 , 1300)
schedule(1 , 7.05 , 0.025 , 0dbfs/2 , 184.814 , 1300)
schedule(1 , 7.075 , 0.025 , 0dbfs/2 , 194.814 , 1300)
schedule(1 , 7.1 , 0.025 , 0dbfs/2 , 204.814 , 1300)
schedule(1 , 7.125 , 0.025 , 0dbfs/2 , 214.814 , 1300)
schedule(1 , 7.15 , 0.025 , 0dbfs/2 , 224.814 , 1300)
schedule(1 , 7.175 , 0.025 , 0dbfs/2 , 234.814 , 1300)
schedule(1 , 7.2 , 0.025 , 0dbfs/2 , 244.814 , 1300)

*/







</CsInstruments> 

<CsScore>

 
/*

i   1   0     0.5   1/2   440
i   1   0.5   0.5   1/2   440
i   1   1     0.5   1/2   440
i   1   1.5   0.5   1/2   440
i   1   2     0.5   1/2   440
i   1   2.5   0.5   1/2   440

e
*/

</CsScore>

</CsoundSynthesizer>