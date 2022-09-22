#!/bin/bash
# User processes sorted by CPU
ps aux --sort -%cpu | grep "$USER"

