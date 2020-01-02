#!/bin/bash
#funkcje, podprogramy

#procedura
function moja() {
    echo "Procedura"
}

#wywołanie procedury

moja

#wywołaj procedurę 10 razy metoda iteracyjną (while)

x=1

while [ ${x} -le 10 ]; do
    moja
    x=$[x+1]
done

#wyrażenia arytmetyczne
echo $((2+2))

echo $[2+2]

x=5
y=2

let suma=${x}+${y}
echo ${suma}

#operatory arytmetyczne
# + : dodawanie
# - : odejmowanie
# * : mnożenie
# / : dzielenie
# % : reszta z dzielenia

echo $[x%y]

