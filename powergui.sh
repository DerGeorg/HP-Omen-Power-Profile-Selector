#!/bin/bash


ADVSEL=""
GUI=false
TERMINAL=true
VERBOSE=false
TXTONLY=false
NOINPUTSET=true
NOFLAG=false


black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`
reset=`tput sgr0`

function gui(){
	if $VERBOSE
	then
		echo "${cyan}Showing Gui selection list"
	fi
	ADVSEL=$(zenity --list --radiolist --height=275 --width=400 \
	--title="Choose the Bugs You Wish to View" \
  	--column="Profile" 	--column="Profile" --column="Description"\
    FALSE "cool" "Cool Power Profile" \
	TRUE "balanced" "Balanced Power Profile" \
	FALSE "performance" "Performance Power Profile" )
	NOINPUTSET=false
}

function terminal(){
	if $VERBOSE
	then
		echo "${cyan}Showing terminal selection"
	fi
	ADVSEL=$(whiptail --title "HP OMEN Profile selection" --fb --menu "Select option" 11 50 3 \
	"cool" "Cool Power Profile" \
	"balanced" "Balanced Power Profile" \
	"performance" "Performance Power Profile" 3>&1 1>&2 2>&3)
	NOINPUTSET=false
}


function selectProfile(){
	var_a=""

	if $NOINPUTSET
	then 
		if $VERBOSE
		then
			echo "${cyan}No input set, asking user now"
		fi
		if $GUI 
		then
			gui
		else
			if $TERMINAL 
			then
				terminal
			fi
		fi
	else
		if $VERBOSE
		then
			echo "${cyan}Input already selected, skip asking user"
		fi
	fi

	if $TXTONLY
	then
		if $VERBOSE
		then
			echo "${cyan}Text only mode selected"
		fi
		if $NOINPUTSET
		then 
			if $VERBOSE
			then
				echo "${cyan}Got no user input, asking user now"
			fi
			terminal
		fi
	fi

	case $ADVSEL in

	"cool")
		var_a="cool"
		;;

	"balanced")
		var_a="balanced"
		;;

	"performance")
		var_a="performance"
		;;
	*)
		usage
		exit 1
		;;
	esac

	if $VERBOSE
	then
		echo "${cyan}Mode: ${red}$var_a ${cyan}selected!"
	fi

	if $GUI
	then
		if $VERBOSE
		then
			echo "${cyan}Show notification to user"
		fi
		 zenity --notification\
		--window-icon="info" \
		--text="Selected HP Omen power profile: $var_a"
	else
		if $TERMINAL
		then
			if $VERBOSE
			then
				echo "${cyan}Show terminal info to user"
			fi
			whiptail --title "HP Omen Power Profile" --msgbox "Selected HP Omen power profile: $var_a" 8 78
		fi
	fi

	

	if $TXTONLY
	then
		if $VERBOSE
		then
			echo "${cyan}Show Text only mode to user"
		fi
		echo "${green}Selected HP Omen power profile: ${red} $var_a ${reset}"
	fi

	if $VERBOSE
	then
		echo "${cyan}Set Platform Profile now"
	fi

	echo $var_a > /sys/firmware/acpi/platform_profile
	
	if $VERBOSE
	then
		echo "${cyan}DerGeorg --> FINISH"
	fi

	if $NOFLAG
	then
		usage
	fi
} 

function usage() {
	echo "OPTIONS: "
	echo "	-t, --txtonly 		 Text only mode"
	echo "	-g, --gui 		 GUI Mode"
	echo "	-h, --help 		 This help"
	echo "	-s, --profile <PROFILE>  Set to profile without user selection. <PROFILE>=['cool', 'balanced', 'performance']"
	echo "	-c, --cool 		 Select cool profile"
	echo "	-b, --balanced 		 Select balanced profile"
	echo "	-p, --performance 	 Select performance profile"
}

# if no arguments are provided, return usage function
if [ $# -eq 0 ]; then
	NOFLAG=true
fi


while [ "$1" != "" ]; do
    case $1 in
    -t | --textonly)
		TXTONLY=true
		TERMINAL=false
        ;;
    -h | --help)
        usage
		exit 1
        ;;
    -g | --gui)
	    TERMINAL=false
		GUI=true
        ;;
	-s | --profile)
		shift
		NOINPUTSET=false
		echo $1
		ADVSEL=$1
        ;;
	-b | --balanced)
		NOINPUTSET=false
		ADVSEL="balanced" 
        ;;
	-c | --cool)
		ADVSEL="cool" 
		NOINPUTSET=false
        ;;
	-p | --performance)
		ADVSEL="performance"
		NOINPUTSET=false
        ;;
	-v | --verbose)
		VERBOSE=true
		;;
    *)
		NOFLAG=true
        ;;
    esac
    shift # remove the current value for `$1` and use the next
done
selectProfile