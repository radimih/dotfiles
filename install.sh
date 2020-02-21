#!/usr/bin/env bash
# Based on https://github.com/elnappo/dotfiles/blob/master/init/setup.sh

set -e

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "[i] Ask for sudo password"
sudo -v

case "$(uname -s)" in

    Linux)
        if [ -f /etc/os-release ]
        then
            source /etc/os-release

            case "$ID_LIKE" in

                debian | ubuntu)
                    title "[i] Install Ansible"
                    sudo apt-get install -y ansible
                    ;;

                *)
                    title "[!] Unsupported Linux Distribution: $ID (like $ID_LIKE)"
                    exit 1
                    ;;
            esac
        else
            title "[!] Unsupported Linux Distribution"
            exit 1
        fi
        ;;

    *)
        title "[!] Unsupported OS"
        exit 1
        ;;
esac

path_current=`pwd`
cd $(dirname $0)/ansible

title "[i] Run Playbook"
ansible-playbook playbook.yml --ask-become-pass
cd $path_current

title "[i] Done."
