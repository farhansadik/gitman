#!/bin/bash 
#!/usr/bin/bash 

# script_by Farhan Sadik 
# script_ver 0.3

red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; 
stop='\e[0m'; blink='\e[5m';

print_ok=" no functionality has been installed "
auto_commit="auto commit - updated"

function quit() {
	echo
	read -p "press any key to exit (q) is default: " quit_input
	if [[ $quit_input == 'q' ]]; then {
		sleep 0;
	} else {
		printf "[*] invalid input\n";
	}; fi
}

function main_menu() {
	printf " [ 1]  status\n"
	printf " [ 2]  auto add\n"
	printf " [ 3]$yellow  custom add\n$stop"
	printf " [ 4]  auto commit\n"
	printf " [ 5]$yellow  custom commit$blue [all] \n$stop"
	printf " [ 6]  pull\n"
	printf " [ 7]  push\n"
	printf " [ 8]  log\n"
	printf " [ 9]  view specific file from log\n"
	printf " [10]  view repository info\n"
	printf " [ 0]  quit\n\n"
}

function pause(){
    # Purpose: Display pause prompt
    local message="$@"
    [ -z $message ] && message="Press [Enter] key to continue..."
    read -p "$message" readEnterKey
}

while true 
	do

		clear; printf "Git Manager v0.3\nBy Farhan Sadik\n"; echo; git status; echo;
		main_menu
		
		read -p "gitman # " input; echo 
		if [[ $input == 1 ]]; then git status; echo && pause
		elif [[ $input == 2 ]]; then {
			# add 
			printf "[*] adding files \n"
			if git add . ; then printf "[*] added sucessfully \n" && quit; else printf "[*] failed to add\n"; fi; 
		}
		elif [[ $input == 3 ]]; then {
			# commit 
			printf "[*] adding auto commit \n"
			if git commit -am "$update_text"; then quit; fi
		}
		elif [[ $input == 4 ]]; then {
			if git pull; then quit; fi

		} 
		elif [[ $input == 5 ]]; then {
			if git push; then quit; fi
			
		} 
		elif [[ $input == 6 ]]; then {
			if git log --oneline; then quit; fi
			
		} 
		elif [[ $input == 0 ]]; then {
			printf "[*] exit \n[*] ok\n"
			exit 0
		} 
		else {
			printf "invalid input\n"; 
		}; fi; 

done 
