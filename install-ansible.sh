#!/usr/bin/env bash

set -e

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "[i] Ask for sudo password"
sudo -v

if [[ -x /usr/bin/ansible ]]
then
    title "[i] Ansible is already installed"
else
    title "[i] Install Ansible"
    case "$(uname -s)" in
        Linux)
            if [ -f /etc/os-release ]
            then
                source /etc/os-release
                case "$ID" in
                    fedora)
                        sudo dnf install -y ansible
                        ;;
                    ubuntu)
                        sudo apt-get update
                        sudo apt-get install -y software-properties-common
                        sudo add-apt-repository --yes --update ppa:ansible/ansible
                        sudo apt-get install -y ansible
                        ;;
                    *)
                        title "[!] Unsupported Linux Distribution: $ID"
                        exit 1
                        ;;
                esac
            else
                title "[!] Unsupported Linux Distribution"
                exit 1
            fi
            ;;
            # TODO: добавить установку shell autocompletion (см. Checkvist)
        *)
            title "[!] Unsupported OS"
            exit 1
            ;;
    esac
fi

title "[i] Install Ansible Requirements"
ansible-galaxy install -r ansible/requirements.yml

title "[i] Done."
echo
