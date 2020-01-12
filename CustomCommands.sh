#!/bin/bash

#MAKE SURE to add this line into .bashrc
#source ~/.CustomCommands.sh

hell(){
	echo "This is the output Man"
}

#a function to download youtube videos in mp3 format
ytmp3(){
	youtube-dl --extract-audio --audio-format mp3 -i -o "%(title)s.%(ext)s" $1
}

#a function to download youtube videos mp4/mkv 
ytd(){
	youtube-dl -i -o "%(title)s.%(ext)s" $1
}

#info to display every terminal session startup  
startup(){
	echo -ne "Good Morning, Madara! It's "; date '+%A, %B %-d %Y'

	echo "Hardware Information:"
	uptime   # Needs: 'sudo apt-get install lsscsi'
	echo -e "\n"
	lsscsi
	echo -e "\n"
	free -m
}

#creating a c file with default layout
c(){
	#checking if arguments have been given
	if ["$1" == ""]; then
		echo "No arguments given"
		echo "E.G. c trial OR c trial.c"
		return
	fi
	
	#removing the extension just incase its wrong or there isn't any
	name=$(echo "$1" | cut -f 1 -d '.')

	#create c file
	touch $name.c
	
	#appending to c file

	echo "//FileName: $name BY: Ibrahim George" >> $name.c	
	echo -n "//Date: ">>$name.c 
	date '+%A, %B %-d %Y' >> $name.c
	echo -e "\n\n#include <stdio.h>\n\n" >> $name.c

	echo -e "int main() {\n\n}">>$name.c

	#opening c file
	vim $name.c

}

#creating a python programme
py(){
        #checking if arguments have been given
        if ["$1" == ""]; then
                echo "No arguments given"
                echo "E.G. p filename OR p filename.py"
                return
        fi

        #removing the extension
        name=$(echo "$1" | cut -f 1 -d '.')

        #create python file
        touch $name.py


        echo "#FileName: $name BY: Ibrahim George" >> $name.py
        echo -n "#Date: ">>$name.py
        date '+%A, %B %-d %Y' >> $name.py


        echo -e "\ndef main(): \n\nmain()">>$name.py



        #opening c file
        vim $name.py

}


# Typing `serve` with no arguments will start the PHP inbuilt
# server, listening on port 8000.
# If you provide an argument, that is assumed to be the port
# on which to listen.
function serve() {
	if [ $# -eq 0 ]; then
		php -S localhost:8000
	else
		php -S localhost:"$@"
	fi
}




startup
