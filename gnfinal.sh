#!/bin/bash
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White
printf "${BGreen}
   █████████  ██████   █████                     ████            ███ 
  ███░░░░░███░░██████ ░░███                     ░░███           ░░░  
 ███     ░░░  ░███░███ ░███  █████ ████  ██████  ░███   ██████  ████ 
░███          ░███░░███░███ ░░███ ░███  ███░░███ ░███  ███░░███░░███ 
░███    █████ ░███ ░░██████  ░███ ░███ ░███ ░░░  ░███ ░███████  ░███ 
░░███  ░░███  ░███  ░░█████  ░███ ░███ ░███  ███ ░███ ░███░░░   ░███ 
 ░░█████████  █████  ░░█████ ░░████████░░██████  █████░░██████  █████
  ░░░░░░░░░  ░░░░░    ░░░░░   ░░░░░░░░  ░░░░░░  ░░░░░  ░░░░░░  ░░░░░
"
printf "\n\n ${BYellow}This script will launch Nuclei for selected vulnerability severity ${Color_Off} \n\n"
echo""
echo -e "${BBlue}Enter the Nuclei Severity: example:(info,low,medium,high,critical,all) ${Color_Off}"
read crit
echo ""
echo -e "${BBlue}Enter the urls for scan: example:(livesubdomain.txt, liveips.txt)${Color_Off}"
read urls
echo ""
echo -e "${BBlue}Enter the threads number:example:(100,150,200) ${Color_Off}"
read threads
echo ""
echo -e "${BBlue}Enter the Nuclei Templates path: example:(~/nuclei-templates/, orcustomtemplatespath) ${Color_Off}"
read templates
echo ""
printf "${BGreen}Your Entered Options are crit=$crit, urls=$urls, threads=$threads, templates=$templates ${Color_Off}\n\n"
echo ""
if [ $crit = 'info' ]; then
  printf "${BPurple}Scanning Nuclei with $crit severity: ${Color_Off}\n\n"
  nuclei -nts -rl $threads -silent -l $urls -t $templates  -severity $crit -retries 3 -o $crit.txt
  echo ""
  echo -e "${BCyan}Nuclei Successfully completed scanning for $crit severity ${Color_Off}"
  echo -e "${BCyan} Result is saved in  $crit.txt  ${Color_Off}"
elif [ $crit = 'low' ]; then
  printf "${BPurple}Scanning Nuclei with $crit severity: ${Color_Off}\n\n"
  nuclei -nts -rl $threads -silent -l $urls -t $templates  -severity $crit -retries 3 -o $crit.txt
  echo ""
  echo -e "${BCyan} Nuclei Successfully completed scanning for $crit severity ${Color_Off}"
  echo -e "${BCyan} Result is saved in  $crit.txt  ${Color_Off}"
elif [ $crit = 'medium' ]; then
  printf "${BPurple}Scanning Nuclei with $crit severity: ${Color_Off}\n\n"
  nuclei -nts -rl $threads -silent -l $urls -t $templates  -severity $crit -retries 3 -o $crit.txt
  echo ""
  echo -e "${BCyan} Nuclei Successfully completed scanning for $crit severity ${Color_Off}"
  echo -e "${BCyan} Result is saved in  $crit.txt  ${Color_Off}"
elif [ $crit = 'high' ]; then
   printf "${BPurple} Scanning Nuclei with $crit severity: ${Color_Off}\n\n"
   nuclei -nts -rl $threads -silent -l $urls -t $templates  -severity $crit -retries 3 -o $crit.txt
   echo ""
   echo -e "${BCyan} Nuclei Successfully completed scanning for $crit severity ${Color_Off}"
   echo -e "${BCyan} Result is saved in  $crit.txt  ${Color_Off}"
elif [ $crit = 'critical' ]; then
   printf "${BPurple} Scanning Nuclei with $crit severity: ${Color_Off}\n\n"
   nuclei -nts -rl $threads -silent -l $urls -t $templates  -severity $crit -retries 3 -o $crit.txt
   echo ""
   echo -e "${BCyan} Nuclei Successfully completed scanning for $crit severity ${Color_Off}"
   echo -e "${BCyan} Result is saved in  $crit.txt  ${Color_Off}"
elif [ $crit = 'all' ];then
   printf "${BPurple} Scanning Nuclei with $crit severity: ${Color_Off}\n\n"
   #printf "This is a for loop for nuclei all severity scan"
   echo ""
   all="info low medium high critical"
   for i in $all; do
     printf "${BPurple} Scanning nuclei for severity $i ${Color_Off} \n"
     nuclei -nts -rl $threads -silent -l $urls -t $templates  -severity $i -retries 3 -o $i.txt
     echo -e "${BCyan} Done $i ${Color_Off}"
     echo -e "${BCyan} Nuclei Successfully completed scanning for $i severity ${Color_Off}"
     echo -e "${BCyan} Result is saved in  $i.txt  ${Color_Off}"
     echo ""
     echo "" 
   done
   echo ""
   echo ""
else
  printf "${BRed} No Valid option selected. Please enter correct input. ${Color_Off}\n\n"
echo -e "${BGreen}Job Completed.${Color_Off}"
  echo ""
  echo -e "${BGreen}Done${Color_Off}"
fi
