/*

//mano destra
dod
mi
sold
dod

dod
mi
si
sold

si 
red
fad
si

sold
si
mi
red


//mano sinistra

dod
mi
red
si

dod
fad 
mi
red
*/


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


kenv linen 1, .3, p3, .1
kfreq=p4

 outs oscili((0dbfs/2+ oscili:k(0dbfs/2, 20))*kenv, kfreq, 1), oscili((0dbfs/2*kenv+oscili:k(0dbfs/2, 220))*kenv, kfreq, 1)


endin


instr 2


kenv linen 1, .3, p3, .1
kfreq=p4

 outs oscili((0dbfs/2+ oscili:k(0dbfs/2, 200))*kenv, kfreq, 2), oscili((0dbfs/2*kenv+oscili:k(0dbfs/2, 2))*kenv, kfreq, 2)


endin




</CsInstruments> 

<CsScore>



m theme   //md
i 1  0     0.159    277.183 
i 1  0.25   0.159    329.628
i 1  0.5     0.159    415.305
i 1  0.75   0.159    554.365
i 1  1     0.159    277.183
i 1  1.25   0.159    329.628
i 1  1.5     0.159    493.883
i 1  1.75   0.159    415.305


 




i 1  2     0.25    246.942
i 1  2.25  0.25    311.127
i 1  2.5   0.25    369.994
i 1  2.75  0.25    493.883


i 1 3      0.25    207.652
i 1 3.25   0.25    246.942
i 1 3.5    0.25    329.628
i 1 3.75   0.25    311.127
s

n theme
s
m go
//ms

i 2  0     1   69.2957  
i 2  1  1   82.4069   
i 2  2     1   77.7817 
i 2  3   1   61.7354 
i 2  4     1   69.2957 
i 2  5   1   92.4986 
i 2  6     1   82.4069
i 2  7   1   77.7817 


//md
i 1  0     0.159    277.183 
i 1  0.25   0.159    329.628
i 1  0.5     0.159    415.305
i 1  0.75   0.159    554.365
i 1  1     0.159    277.183
i 1  1.25   0.159    329.628
i 1  1.5     0.159    493.883
i 1  1.75   0.159    415.305

i 1  2     0.25    246.942
i 1  2.25  0.25    311.127
i 1  2.5   0.25    369.994
i 1  2.75  0.25    493.883


i 1 3      0.25    207.652
i 1 3.25   0.25    246.942
i 1 3.5    0.25    329.628
i 1 3.75   0.25    311.127


i 1  4     0.159    277.183 
i 1  4.25   0.159    329.628
i 1  4.5     0.159    415.305
i 1  4.75   0.159    554.365
i 1  5     0.159    277.183
i 1  5.25   0.159    329.628
i 1  5.5     0.159    493.883
i 1  5.75   0.159    415.305

i 1  6     0.25    246.942
i 1  6.25  0.25    311.127
i 1  6.5   0.25    369.994
i 1  6.75  0.25    493.883


i 1 7      0.25    207.652
i 1 7.25   0.25    246.942
i 1 7.5    0.25    329.628
i 1 7.75   0.25    311.127


n go

s



e

</CsScore>

</CsoundSynthesizer>