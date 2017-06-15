#!/bin/bash


declare -r \
        ansi_black='\033[30m' \
        ansi_black_bold='\033[0;30;1m' \
        ansi_red='\033[31m' \
        ansi_red_bold='\033[0;31;1m' \
        ansi_green='\033[32m' \
        ansi_green_bold='\033[0;32;1m' \
        ansi_yellow='\033[33m' \
        ansi_yellow_bold='\033[0;33;1m' \
        ansi_blue='\033[34m' \
        ansi_blue_bold='\033[0;34;1m' \
        ansi_magenta='\033[35m' \
        ansi_magenta_bold='\033[0;35;1m' \
        ansi_cyan='\033[36m' \
        ansi_cyan_bold='\033[0;36;1m' \
        ansi_white='\033[37m' \
        ansi_white_bold='\033[0;37;1m' \
        ansi_reset='\033[0m'

declare -r ansi_grey="$ansi_black_bold"

function menu()
{
    echo
    echo
    echo -ne $ansi_red
    echo    "   +========================================================="
    echo -e "   ‖ $ansi_red_bold                                    __                $ansi_reset $ansi_red‖";
    echo -e "   ‖ $ansi_red_bold   |\/| _ .|   /\  _ _ _     _ |_  (_    .|_ _|_  _ _ $ansi_reset $ansi_red‖";
    echo -e "   ‖ $ansi_red_bold   |  |(_|||  /--\(_(_(_)|_|| )|_  __)\)/||_(_| )(-|  $ansi_reset $ansi_red‖";
    echo -e "   ‖ $ansi_red_bold                                                      $ansi_reset $ansi_red‖";
    echo    "   =========================================================="
    echo -e "   ‖ $ansi_green                                                       $ansi_red‖"
    echo -e "   ‖ $ansi_green 1) alessandro@madfarm.it                              $ansi_red‖"
    echo -e "   ‖ $ansi_green 2) aleskandro@lucylaika.ovh                           $ansi_red‖"
    echo -e "   ‖ $ansi_green 3) mail@alessandrodistefano.eu                        $ansi_red‖"
    echo -e "   ‖ $ansi_green 4) alessandro.distefano1@gmail.com                    $ansi_red‖"
    echo -e "   ‖ $ansi_green 0|q) Exit mutt                                        $ansi_red‖"
    echo -e "   ‖ $ansi_green                                                       $ansi_red‖"
    echo    "   =========================================================="
    echo
    echo -ne "   $ansi_cyan_bold--> $ansi_reset"
}

function mutt_open()
{
    case "$1" in
        1)
            MUTTRC="madfarm"
            ;;
        2)
            MUTTRC="lucylaika"
            ;;
        3)
            MUTTRC="mail"
            ;;
        4)
            MUTTRC="gmail"
            ;;
        [0q]*)
            exit 0
            ;;
        *)
            echo
            echo "Unknown account or command. Press any key to continue..."
            read -n 1
            return
    esac
    mutt -e "source ~/.mutt/$MUTTRC.muttrc"
}

while [ 1 ]
do
    clear
    menu
    read -n 1 -r RPY
    mutt_open $RPY
done


