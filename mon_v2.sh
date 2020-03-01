#!/usr/bin/env bash

#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]
then
    echo "Usage: mon user"
    exit 1
fi

if [[ "$1" = "-n" ]]
then
    user="$1"
    tty_login=$(who | awk 'FNR == 1 {print $2}')
    until who | grep "^$user" > /dev/null
    do
        sleep 60
    done

    echo "$user logged onto $tty_login"

    if  [[ "$2" = "-f" ]]
    then
        if [[ "$3" = "-m" ]]
        then
            echo "Emailing the file once validated."
            until [[ ! -e "$4" ]]
            do
                $(rm "$4")
                echo "File has been removed."
            done
        fi
        until [[ ! -e "$2" ]]
        do
            $(rm "$4")
            echo "File has been removed."
        done
        exit 0
    else
        echo "You did not use option -n"
    fi
    exit 1
fi

if  [[ "$1" = "-f" ]]
then
    if [[ "$2" = "-m" ]]
    then
        echo "Emailing the file once validated."
        until [[ -e "$3" ]]
        do
            sleep 60
        done
    fi
    until [[ -e "$2" ]]
    do
        echo "Validating the file exists."
        sleep 60
    done
    exit 0
else
    echo "You did not use option -f"
fi

user="$1"
tty_login=$(who | awk 'FNR == 1 {print $2}')
until who | grep "^$user" > /dev/null
do
    sleep 60
done

echo "$user logged onto $tty_login"
