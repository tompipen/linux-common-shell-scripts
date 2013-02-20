#!/bin/bash
read -p "your email : " youremail
read -p "your passphrase : " yourpass
ssh-keygen -t rsa -C $youremail -q -N $yourpass
cat ~/.ssh/id_rsa.pub
