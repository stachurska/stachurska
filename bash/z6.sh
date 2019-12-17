#!/bin/bash
#pętla until

i=10

until [ ${i} -eq 10 ]; do
    echo ${i}
    i=$[i+1]
done

#pętla select

echo "Podaj opcje:"

select opcja in File Edit Quit
do
    case ${opcja} in
	"File") echo "Wybrano opcje ${opcja}" ;;
	"Edit") echo "Wybrano opcje ${opcja}" ;;
	"Quit") echo exit ;;
	*) echo "Podaj liczby z zakresu [1..3]" ;;
    esac
done






