#!/bin/bash
# Ask the user to sort the processes by CPU or Memory
read -p "Sort your processes by CPU or Memory? Type cpu or mem : " sortedby
ps aux --sort -%$sortedby | grep "$USER"