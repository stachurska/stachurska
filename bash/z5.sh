#!/bin/bash

#loop for

for x in j d t 
do
    echo ${x}
done

for plik in *
do
    echo ${plik}
done

#i++ = i+1 inkrementacja (zwiekszanie wartosci zmiennej) 
#i-- - i=-1 dekrementacja (zmiejszanie wartosci zmiennej)
# i=1 1<=3 ->true i=1+1 (wyrazenie warunkowe)
# i=2 2<=3 ->true i=2+1
# i=3 3<=3 ->true i=3+1
# i=4 3<=4 ->false koniec
for ((i=1; i<=10; i++))
do
    echo ${i}
done

#pętla while
j=1 

while [ ${j} -lt 30 ]; do
    echo -e "\0227"
    j=$[j+1]
done






