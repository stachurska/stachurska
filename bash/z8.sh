#!/bin/bash

#definicja funkcji f1
function f1() {
    echo -n "f1"
}

function f2() {
    echo "f2"
}

function f3() {
    echo "f3"
}

#menu skrypty
select opcja in lista f1 f2 f3 Quit
do
    case ${opcja} in
	"f1") f1 ;;
	"f2") f2 ;;
	"f3") f3 ;;
	"Quit") exit 0 ;;
	*) echo "Podaj opcje z menu."
    esac
done