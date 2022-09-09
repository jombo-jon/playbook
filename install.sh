#!/bin/bash

echo "Installation Jombo-Jon"

# Get Distro

# DISTRONAME=$(grep '^NAME' /etc/os-release)
if ! command -v task-go &> /dev/null
then
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d
fi

# Create Base Directories
mkdir $HOME/repo
mkdir $HOME/personal
mkdir $HOME/projects

echo "Which Operating System are you using?"  
echo "Pop!Os, ArchLinux, Ubuntu?"  
read -p "Type your OS Name:" OS  
  
case $OS in  
    Ubuntu|ubuntu|Pop!Os|popos)  
        task install_ubuntu
        ;;  
    Arch|ArchLinux)  
        task-go install_arch
        ;;  
    *)  
        echo "Not a supported OS"  
        echo  
        ;;  
esac
