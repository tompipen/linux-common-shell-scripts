#!/bin/bash
read -p "your name : " yourname
read -p "your email : " youremail
git config --global user.name $yourname
git config --global user.email $youremail
echo "export VISUAL=vim" > ~/.bash_profile
