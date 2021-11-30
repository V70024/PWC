#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Need to be root or run with sudo. Exiting."
    exit 1
fi


Github="https://github.com/V70024/PWC"
Email="Zz2f0024@protonmail.com"
Telegram="t.me/V70024"
app_name="pwc"
app_name_dir="pwc-src"
desktop_file_name="pwc.desktop"
location="/usr/bin/"

dir_location="${location}${app_name_dir}"
v_env="${location}${app_name_dir}/v-env"
python_location_v_env="${v_env}/bin/python3"
app_location="${location}${app_name_dir}/main.py"
run_location="${location}${app_name}"
desktop_file_location="/usr/share/applications/${desktop_file_name}"

tput setaf 3;

clear
echo "------------------------------"
echo -e "\n[>] Start uninstalling\n"
echo "------------------------------"
sleep 2 

rm -rf $desktop_file_location
echo "[+] removed  Desktop Icons"
echo "------------------------------"
echo "[>] Start remove app dir ${dir_location}"
rm -rf $dir_location
echo "[+] removed app dir ${dir_location}"
echo "------------------------------"
echo "[>] Start remove runer ${run_location}"
rm -rf $run_location
echo "[+] removed runer ${run_location}"
sleep 0.5
echo "------------------------------"
echo "[U]   Github :    ${Github}"
echo "[U]   Email :     ${Email}"
echo "[U]   Telegram :  ${Telegram}"
sleep 0.5
echo "------------------------------"
echo -e "\n[+] uninstalled app >--=> ${app_name}   \n"
echo "------------------------------"
sleep 0.5