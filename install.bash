#!/bin/bash


if [ "$(whoami)" != "root" ]; then
    echo "Need to be root or run with sudo. Exiting."
    exit 1
fi


cd $(dirname "${BASH_SOURCE[0]}")

if   [[ "$(pip3 --version)" =~ "python 3" ]]; then 
    python_command="python3" ; echo "python3 -->"
elif [[ "$(pip  --version)" =~ "python 3" ]]; then
    if   [[ "$(python3 --version)" =~ "Python 3" ]]; then 
    python_command="python3" ; echo "python -->"
    elif [[ "$(python  --version)" =~ "Python 3" ]]; then
    python_command="python" ; echo "python3 -->"
    fi
else
    echo "Please install python3 and pip. Exiting." ; exit 1
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
tput setaf 3;

clear
echo "------------------------------"
echo -e "\n[>] Start installing\n"
echo "------------------------------"
sleep 2 
rsync -arzvh $app_name_dir $location
echo "[+] Copy the '${app_name_dir}' directory to '${location}'"
sleep 0.5
echo "------------------------------"
rsync -arzvh ./${desktop_file_name} /usr/share/applications
echo "[+] Create desktop icons"
sleep 0.5
echo "------------------------------"
echo "[>] Start installing libraries (prerequisites)"
sleep 0.5
$python_command -m pip install virtualenv
$python_command -m virtualenv $v_env
sleep 0.5
$python_location_v_env -m pip install -r $app_name_dir/requirements.txt
echo -e "[+] Libraries in requirement.txt were installed"
sleep 0.5
echo "------------------------------"
sleep 0.5
chmod u+x $app_location
ln -s $app_location $run_location
chmod +x $run_location
sleep 0.5
echo -e "[+] Create link"
echo "------------------------------"
echo "[U]   Github :    ${Github}"
echo "[U]   Email :     ${Email}"
echo "[U]   Telegram :  ${Telegram}"
sleep 0.5
echo "------------------------------"
echo -e "\n[+] installed app >--=> ${app_name}   \n"
echo "------------------------------"
sleep 0.5

