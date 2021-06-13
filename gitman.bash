#!/bin/bash 
#!/usr/bin/bash 

red='\033[1;91m'; deep_green='\033[0;32m'; green='\033[1;92m'; yellow='\033[1;93m'; blue='\033[1;94m'; white='\033[1;97m'; 
stop='\e[0m'; blink='\e[5m';

print_ok=" no functionality has been installed "
auto_commit="auto commit - updated"
script_version="0.4.53 Community Edition" 	# pre 0.3


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
	do {
		clear; printf "$deep_green"
		printf "Git Manager$yellow $script_version$deep_green \nBy Farhan Sadik\n$stop"; echo; git status; echo;
		main_menu

		read -p "gitman % " input; echo 
		if [[ $input == 1 ]]; then git status; echo && pause
		elif [[ $input == 2 ]]; then {
			# add 
			printf "[*] adding files \n"
			if git add . ; then printf "[*] added sucessfully \n"; echo && pause; else printf "[*] failed to add\n"; fi; 
		} 
		elif [[ $input == 3 ]]; then {
			# custom add
			read -p "enter addr % : " custom_add
			
			if [[ `find $custom_add` == $custom_add || `ls | grep $custom_add` == $custom_add ]]; then {
				printf "\n[*] adding files \n"
				git add $custom_add
				printf "[*] file has been added \n"
			} else echo "failed to locate file"; fi
			echo && pause
		} 
		elif [[ $input == 4 ]]; then {
			# auto commit 
			printf "[*] adding auto commit \n"
			git commit -am "$auto_commit"
			echo && pause
		} 
		elif [[ $input == 5 ]]; then {
			# custom commit 
			read -p "commit % : " custom_commit 
			printf "[*] adding custom commit \n"
			git commit -am "$custom_commit"
			echo && pause
		}
		elif [[ $input == 6 ]]; then git pull; echo && pause
		elif [[ $input == 7 ]]; then git push; echo && pause
		elif [[ $input == 8 ]]; then git log --oneline; echo && pause
		elif [[ $input == 9 ]]; then {
			# view specific file from log
			read -p "revision % : " r
			if [[ $r == 'q' || $r == 'exit' || $r == 'quit' ]]; then echo "Bye, Bye!!" && exit 0; fi
			read -p "addr     % : " a
			git show $r:$a
			echo && pause
		}
		elif [[ $input == 10 ]]; then {
			# view repository info
			echo $print_ok
			echo && pause
		}
		elif [[ $input == 0 || $input == 'q' || $input == 'exit' || $input == 'quit' || $input == 'quit()'  ]]; then printf "[*] exit \n[*] ok\n" && exit 0
		fi
	}
done 


# script_by Farhan Sadik