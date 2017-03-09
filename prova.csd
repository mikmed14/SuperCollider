<CsoundSynthesizer><CsOptions>-odac
</CsOptions><CsInstruments>

sr=44100
ksmps=32
nchnls=2



ifn1 ftgen 1, 0, 16384, 10, 1                                          ; Sine
ifn2 ftgen 2, 0, 16384, 10, 1, 0.5, 0.3, 0.25, 0.2, 0.167, 0.14, 0.125, .111   ; Sawtooth
ifn3 ftgen 3, 0, 16384, 10, 1, 0,   0.3, 0 ,   0.2, 0,     0.14, 0,     .111   ; Square
ifn4 ftgen 4, 0, 16384, 10, 1, 1,   1,   1,    0.7, 0.5,   0.3,  0.1 


instr 1  

kenv linen 1, .3, p3, .2

 outs oscili(p4*kenv, p5), oscili(p4*kenv, p5)

endin




 
/*
instr 3

kamp = p4
kcps = p5
ifn  = p6


k1 oscili kamp, kcps, ifn
     outs asig,asig
endin








instr 4


kenv linen 1, .5, p3, .5

outs oscili(p4*kenv, p5 ), oscili(p4*kenv, p5)

endin
*/

instr 4
kenv linen 1, .005, p3, .05
kfreq=p4 
outs oscili((0dbfs/4)*kenv/2, kfreq/2, 2),oscili((0dbfs/4)*kenv/2, kfreq/8, 2)


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


i 4 0  0.25  1661.22
i 4 0.25  0.5  1661.22
i 4 0.75  0.5  1661.22
i 4 1.25  0.25  1661.22
i 4 1.5  0.25  1661.22
i 4 1.75  0.25  1661.22 
i 4 2  0.25  1661.22
i 4 2.25  0.5  1661.22
i 4 2.75  0.5  1661.22
i 4 3.25  0.125  1661.22
i 4 3.375  0.125  1661.22
i 4 3.5  0.25  1661.22
i 4 3.75  0.25  1661.22


  
i 4 4  0.125  2217.46
i 4 4.125  0.125  2217.46
i 4 4.25  0.375  2217.46
i 4 4.75  0.5  2217.46
i 4 5.25  0.25  2217.46
i 4 5.5  0.25  2217.46
i 4 5.75  0.25  2217.46
i 4 6  0.125  2217.46
i 4 6.125  0.125  2217.46
i 4 6.25  0.125  2217.46
i 4 6.375  0.125  2217.46
i 4 6.5  0.125  2217.46
i 4 6.675  0.125  2217.46
i 4 6.75  0.125  2217.46
i 4 6.875  0.125  2217.46
i 4 7  0.25  2217.46
i 4 7.25  0.25  2217.46
i 4 7.5  0.25  2217.46
i 4 7.75  0.25  2217.46


i 4 8  0.375  1318.51
i 4 8.375  0.375  1318.51
i 4 8.75  0.25  1318.51
i 4 9  0.125  1318.51
i 4 9.125  0.125  1318.51
i 4 9.25  0.5  1318.51
i 4 9.75  0.25  1318.51
i 4 10  0.25  1318.51
i 4 10.25  0.25  1318.51
i 4 10.5  0.25  1318.51
i 4 9.75  0.25  1318.51


i 4 10  0.375  1318.51
i 4 10.375  0.375  1318.51
i 4 10.75  0.25  1318.51
i 4 11  0.125  1318.51
i 4 11.125  0.125  1318.51
i 4 11.25  0.5  1318.51
i 4 11.75  0.25  1318.51
i 4 12  0.25  1318.51
i 4 12.25  0.25  1318.51
i 4 12.5  0.25  1318.51
i 4 12.75  0.25  1318.51

i 4 13  (0.375/2)  1318.51
i 4 13+(0.375/2)  (0.375/2)  1318.51
i 4 13.375  0.375  1318.51
i 4 13.75  0.25  1318.51
i 4 14  0.125  1318.51
i 4 14.125  0.125  1318.51
i 4 14.25  0.5  1318.51
i 4 14.75  0.25  1318.51


i 4 15  0.25  1108.73
i 4 15.25  0.25  1108.73
i 4 15.5  0.25  1108.73
i 4 15.75  0.25  1108.73



</CsScore>

</CsoundSynthesizer>