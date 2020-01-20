#!/bin/bash

#Zmienna globalna
#ładowanie użytkowników
user_list=(`cat users.txt`)
status="FAIL"
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[1;32m'


function checkStatusCode() {
    if  [ $? == 0 ]; then
	status="PASS"
    else
	status="FAIL"
    fi
}

function showUsers() {
    echo "showUsers ..."
    echo "Lista"
    for(( i=0; i<=${#user_list[@]}; i++ ))
    do
	echo "	${user_list[i]}"
    done
}

function addUsers() {
    echo  "addUsers ..."
    echo -n "Are you sure? [y/n]"
    read sure
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}"
	do
	     sudo useradd ${user} -m -s /sbin/nologin -g "users" 2> /dev/null
	     checkStatusCode
	    echo "Add user: ${user} [${status}]"    
	done
    fi
}



function delUsers() {
    echo "delUsers ..."
    echo -n "Are you sure? [y/n]"
    read sure
    if [ "${sure}" == "y" ]; then
	for user in "${user_list[@]}"
	do
	    sudo userdel -r ${user} 2> /dev/null
	    checkStatusCode
	    echo "Remove user ${user} [${status}]"   
	done
    fi
}




function acceptRemoteLogin() {
    echo "acceptRemotLogin ..."
    for user in "${user_list[@]}"
    do
	sudo usermod -s /bin/bash ${user} 2> /dev/null
        checkStatusCode
	echo "Accept remote Login for ${user} [${status}]"
    done
}

function deniRemoteLogin() {
    echo "deniRemotUsers ..."
    for user in "${user_list[@]}"
    do
	sudo usermod -s /sbin/nologin ${user} 2> /dev/null
	checkStatusCode
	echo "Denied remote Login for ${user} [${status}]"
    done
}

function quit() {
    exit 0
}

function help() {
cat << EndOfMessage
    Opis opcji skryptu:
    -------------------
    SU-pokarz urzytkowników z pliku
    AU-dodawanie urzytkowników z pliku
EndOfMessage
}

#menu

select option in SU AU DU ARL DRL HELP QUIT
do
    case ${option} in
	"SU") showUsers ;;
	"AU") addUsers ;;
	"DU") delUsers ;;
	"ARL") acceptRemoteLogin ;;
	"DRL") deniRemoteLogin ;;
	"HELP") help ;;
	"QUIT") quit ;;
	*) help
    esac
done

