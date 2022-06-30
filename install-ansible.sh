#!/usr/bin/env bash

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
                    if [[ ! -x /usr/bin/ansible ]]
                    then
                        title "[i] Install Ansible"
                        sudo apt update
                        sudo apt install software-properties-common
                        sudo add-apt-repository --yes --update ppa:ansible/ansible
                        sudo apt install -y ansible
                        # TODO: добавить установку shell autocompletion (см. Checkvist)
                    fi
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

title "[i] Done."
