#!/bin/bash 
#!/usr/bin/bash 

# script_by Farhan Sadik 
# script_ver 0.3

update_text="auto commit - updated"

function quit() {
	echo
	read -p "press any key to exit (q) is default: " quit_input
	if [[ $quit_input == 'q' ]]; then {
		sleep 0;
	} else {
		printf "[*] invalid input\n";
	}; fi
}

while true 
	do

		clear; printf "Git Manager v0.3\nBy Farhan Sadik\n"; echo; git status; echo;

		printf "[1] status\n"
		printf "[2] auto add\n"
		printf "[3] auto commit\n"
		printf "[4] pull\n"
		printf "[5] push\n"
		printf "[6] log\n"
		printf "[0] quit\n\n"

		read -p "gitman # " input; echo 
		if [[ $input == 1 ]]; then {
			if git status ; then quit; fi 
			
		} elif [[ $input == 2 ]]; then {
			# add 
			printf "[*] adding files \n"
			if git add . ; then printf "[*] added sucessfully \n" && quit; else printf "[*] failed to add\n"; fi; 

		} elif [[ $input == 3 ]]; then {
			# commit 
			printf "[*] adding auto commit \n"
			if git commit -am "$update_text"; then quit; fi

		} elif [[ $input == 4 ]]; then {
			if git pull; then quit; fi

		} elif [[ $input == 5 ]]; then {
			if git push; then quit; fi
			
		} elif [[ $input == 6 ]]; then {
			if git log --oneline; then quit; fi
			
		} elif [[ $input == 0 ]]; then {
			printf "[*] exit \n[*] ok\n"
			exit 0
			
		} else {
			printf "invalid input\n"; 
		}; fi; 

done 
