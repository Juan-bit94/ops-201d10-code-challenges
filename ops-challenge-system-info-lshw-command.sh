#!/bin/bash

# Script Name:              ops-challenge-system-information
# Author:                   juan maldonado
# Date of latest revision:  10/31/2023
# Purpose:                  Ops challenge - providing system information

#!/bin/bash

# Declaration of variables
intromessage="Welcome to the system information script."
questiontouser="Please choose the following options to provide you with current system and performance information: "
subchoiceoption="Which option do you want information on?(choose 1 - 5): "
List_of_options=("Name of the computer" "CPU" "RAM" "Display adapter" "Network adapter")
list_of_CPU_options=("Product" "Vendor" "Physical ID" "Bus info" "Width")
list_of_RAM_options=("Description" "Physical ID" "Size")
list_of_Display_adapter_options=("Description" "Product" "Vendor" "Physical ID" "Bus info" "Width" "Clock" "Capabilities" "Configuration" "Resources")
list_of_Network_adapter_options=("Description" "Product" "Vendor" "Physical ID" "Bus info" "Logical name" "Version" "Serial" "Size" "Capacity" "Width" "Clock" "Capabilities" "Configuration" "Resources")

# Declaration of functions
systemInformationIntro () {
    continueloop=1
    while [ $continueloop -eq 1 ]; do
    echo "$intromessage"
    echo "$questiontouser"
    echo " "
    for chose in "${!List_of_options[@]}"; do
        echo "${List_of_options[$chose]}"
    done
    read -p "Please choose which option you want information on (choose 1 - 5): " userChoice

    case "$userChoice" in
        1) systemInformationComputerName ;;
        2) systemcpuinformation ;;
        3) systemraminformation ;;
        4) systemdisplayadapterinformation ;;
        5) systemnetworkadapterinformation ;;
        *) echo "Sorry, we could not get data for that choice. Please try again." ;;
    esac

    read -p "Do you wish to continue? [Y/n]: " continueChoice
    if [ "$continueChoice" != "Y" ]; then   
        continueloop=0
        echo "I hope you found the information you needed."
    fi  
done 
}

systemInformationComputerName () {
    sudo lshw -C system | grep "product:"
    echo "Thanks for using our script"
}

systemcpuinformation () {
    echo "Please look at the options for the CPU information"
    for cpuchoice in "${!list_of_CPU_options[@]}"; do
        echo "${list_of_CPU_options[$cpuchoice]}"
    done
    read -p "$subchoiceoption" userChoice2

    case "$userChoice2" in
        1) sudo lshw -c cpu | grep "product:" ;;
        2) sudo lshw -c cpu | grep "vendor:" ;;
        3) sudo lshw -c cpu | grep "physical id:" ;;
        4) sudo lshw -c cpu | grep "bus info:" ;;
        5) sudo lshw -c cpu | grep "width:" ;;
        *) sudo lshw -c cpu | grep -E "product:|vendor:|physical id:|bus info:|width:" ;;
    esac
}

systemraminformation () {
    echo "Please look at the options for the RAM information"
    for ramchoice in "${!list_of_RAM_options[@]}"; do
        echo "${list_of_RAM_options[$ramchoice]}"
    done
    read -p "Which option do you want information on? (choose 1 - 3): " userChoice2

    case "$userChoice2" in
        1) sudo lshw -c memory | grep "description:" ;;
        2) sudo lshw -c memory | grep "physical id:" ;;
        3) sudo lshw -c memory | grep "size:" ;;
        *) sudo lshw -c memory | grep -E "description:|physical id:|size:" ;;
    esac
}

systemdisplayadapterinformation () {
    for chose in "${!list_of_Display_adapter_options[@]}"; do
        echo "${list_of_Display_adapter_options[$chose]}"
    done
    read -p "Please choose which option you want information on (choose 1 - 10): " userChoice

    case "$userChoice" in
        1) sudo lshw -c display | grep "description:" ;;
        2) sudo lshw -c display | grep "product:" ;;
        3) sudo lshw -c display | grep "vendor:" ;;
        4) sudo lshw -c display | grep "physical id:" ;;
        5) sudo lshw -c display | grep "bus info:" ;;
        6) sudo lshw -c display | grep "width:" ;;
        7) sudo lshw -c display | grep "clock:" ;;
        8) sudo lshw -c display | grep "capabilities:" ;;
        9) sudo lshw -c display | grep "configuration" ;;
        10) sudo lsh -c display | grep "resources" ;;
        *) sudo lshw -C network | grep -E "description:|product:|vendor:|physical id:|bus info:|width:|clock:|capabilities:|configuration:|resources:" ;;
    esac
}

systemnetworkadapterinformation () {
    for choice in "${!list_of_Network_adapter_options[@]}"; do
        echo "${list_of_Network_adapter_options[$choice]}"
    done
    read -p "Please choose which option you want information on (choose 1 - 15): " userChoice

    case "$userChoice" in
        1) sudo lshw -C network | grep "description:" ;;
        2) sudo lshw -C network | grep "product:" ;;
        3) sudo lshw -C network | grep "vendor:" ;;
        4) sudo lshw -C network | grep "physical id:" ;;
        5) sudo lshw -C network | grep "bus info:" ;;
        6) sudo lshw -C network | grep "logical name:" ;;
        7) sudo lshw -C network | grep "version:" ;;
        8) sudo lshw -C network | grep "serial:" ;;
        9) sudo lshw -C network | grep "size" ;;
        10) sudo lshw -C network | grep "capacity" ;;
        11) sudo lshw -C network | grep "width" ;;
        12) sudo lshw -C network | grep "clock" ;;
        13) sudo lshw -C network | grep "capabilities" ;;
        14) sudo lshw -C network | grep "configuration" ;;
        15) sudo lshw -C network | grep "resources" ;;
        *) sudo lshw -C network | grep -E "description:|product:|vendor:|physical id:|bus info:|logical name:|version:|serial:|size:|capacity:|width:|clock:|capabilities:|configuration:|resources:" ;;
    esac
}


# Main

systemInformationIntro

# End 