#!/bin/bash


banner() {
echo -e "

 _______        _                 _______  _        _______ _________
(  ____ \      ( (    /||\     /|(  ____ \( \      (  ____ \\__   __/
| (    \/      |  \  ( || )   ( || (    \/| (      | (    \/   ) (   
| |      _____ |   \ | || |   | || |      | |      | (__       | |   
| | ____(_____)| (\ \) || |   | || |      | |      |  __)      | |   
| | \_  )      | | \   || |   | || |      | |      | (         | |   
| (___) |      | )  \  || (___) || (____/\| (____/\| (____/\___) (___
(_______)      |/    )_)(_______)(_______/(_______/(_______/\_______/
                                                                     

\033[1;32mWelcome to GNuclei Vulnerability Scanner\033[0m

"
}

banner

echo -e "\033[1;4mGNuclei\033[0m"
echo ""

#Function to ask for Nuclei templates file location
get_templates() {
    echo -e "\033[1;32mEnter the location of Nuclei templates files: example: (~/nuclei-templates/ or custom-templates-path)\033[0m"
    read templates
}

#Function to ask for vulnerability severity
get_severity() {
    echo -e "\033[1;34mEnter the vulnerability severity (info, low, medium, high, critical) or all for all severities:\033[0m"
    read severity
}

#Function to ask for target URLs
get_targets() {
    echo -e "\033[1;33mEnter the location of the target URLs file: example: (live-hosts.txt)\033[0m"
    read targets
}

#Function to run Nuclei scan
run_scan() {
    if [ "$severity" = "all" ]; then
    #Loop through all severities
    for s in "info" "low" "medium" "high" "critical"; do
        echo -e "\033[1;31mScanning for $s severity started\033[0m"
        nuclei -t "$templates" -s "$s" -o output_"$s".txt -l "$targets"
    done
    else
    #Run scan for single severity
    echo -e "\033[1;31mScanning for $severity severity started\033[0m"
    nuclei -t "$templates" -s "$severity" -o output_"$severity".txt -l "$targets"
    fi
}

#Main function
main() {
    get_templates
    get_severity
    get_targets
    run_scan
}

#Execute main function
main

echo -e "\033[1;35mNuclei scan complete. Output files can be found in the current directory.\033[0m"
