#!/usr/bin/env bash

function modifyJSON()
{
    read -p "Please provide the full path to your config file directory: "  config
    read -p "Please provide the full name of the tiso you would like to modify: (e.g. wc4-tiso3) "  tiso
    read -p "Thank you :). What degree celcius would you like to modify $tiso to? (e.g. 37) "  temperature

    if [[ $temperature -eq "4" ]]
    then
        condition="cold_${temperature}"
    else
        condition="warm_${temperature}"
    fi

    tiso_json="${tiso}.json"
    wc=${tiso:0:3}
    mcx_json="${tiso:0:3}-mcx1.json"
    tiso_temp="${temperature}:celsius"

    echo "Modifying ${tiso}'s config file temperature to ${tiso_temp}"
    cd "$config"
    cat "$tiso_json" |  jq '.temp_setpoint = "'"${tiso_temp}"'"' > INPUT.tmp && mv INPUT.tmp "$tiso_json"
    echo "Done..."
    echo "Now I'll modify ${tiso:0:3}'s mcx file to reflect the changes to ${tiso_json}"
    cat "$mcx_json" |  jq '.device_set."'"${tiso}"'".class.condition = "'"${condition}"'"' > INPUT.tmp && mv INPUT.tmp "$mcx_json"
    echo "Done..."

    echo "Would you like to now scp those changes over to their respective homes :)? 
    1. yes please 
    2. No thank you"
    read ssh_choice

    case "$ssh_choice" in

    "1") echo "That is great to hear! I'm more than happy to assist you with that..."
         transferFiles "$config" "$tiso_json" "$mcx_json" "$wc" "$tiso";;
    "2") echo "We'll take you back to the entry screen now..."
         userPrompt;;
    "*") echo "Input Error";;

    esac
}

function transferFiles()
{
    scp "$1/$2 ubuntu@$5.txhq.net:/opt/tcle && scp $1/$3 ubuntu@$4.txhq.net:/opt/tcle"

    echo "Should I restart those device services now? 
    1. yes please 
    2. No thank you"
    read restart_choice

    case "$restart_choice" in

    "1") echo "Awesome, but be warned, these changes may effect a currently scheduled run..."
         restartDevices "$1" "$2" "$3" "$4" "$5";;
    "2") echo "We'll take you back to the entry screen now..."
         userPrompt;;
    "*") echo "Input Error";;

    esac
}

function restartDevices()
{
    mcx="$4-mcx1"

    ssh "ubuntu@$5.txhq.net && sudo service $5 restart && exit"
    ssh "ubuntu@$4.txhq.net && sudo service $mcx restart && exit"

    echo "Woohoo! We are now done. Please ensure the webapp supply-chain reflects the changes made to the tisos.."

    echo "Please reach out if you need anything :)."
}

function userPrompt()
{
    echo "Hello and welcome!"

    tput clear
    echo "What would you like to do?
    1. Edit a tiso's temperature
    2. Exit Program"
    read choice

    case "$choice" in

    "1") echo "Woohoo! Okay awesome. I'll just need some information from you before we begin..."
         modifyJSON;;
    "2") echo "Exiting Script"
         exit 1;;
    "*") echo "Input Error";;

    esac   
}

userPrompt
