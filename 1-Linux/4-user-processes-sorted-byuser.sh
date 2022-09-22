#!/bin/bash
# Ask the user to sort the processes by CPU or Memory, and how many results to show
read -p "Sort your processes by CPU or Memory? Type cpu or mem : " sortedby
read -p "How many processes you want to see? " numberofps
ps aux --sort -%$sortedby | grep "$USER" | head -n "$numberofps"

