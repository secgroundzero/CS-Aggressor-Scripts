#!/usr/bin/env bash

#Ascii art print
cat << EOF

 ██████ ███    ██  █████        ██████   █████  ██████  ███████ ███████ ██████  
██      ████   ██ ██   ██       ██   ██ ██   ██ ██   ██ ██      ██      ██   ██ 
██      ██ ██  ██ ███████ █████ ██████  ███████ ██████  ███████ █████   ██████  
██      ██  ██ ██ ██   ██       ██      ██   ██ ██   ██      ██ ██      ██   ██ 
 ██████ ██   ████ ██   ██       ██      ██   ██ ██   ██ ███████ ███████ ██   ██ 																		       

Discord-CNA-Parser v.1.0 - Discord CNA Parser Tool (Linux Edition).
Written with <3 by @nickvourd...
Special thanks to @sec_groundzero... 
Please visit https://github.com/secgroundzero/CS-Aggressor-Scripts for more...
EOF

# Function to display usage information
display_help() {
  echo -e "\nUsage: ./discord-cna-parser_linux.sh --hostname <hostname> --webhook <url>\n"
  echo "Options:"
  echo "  -h, --help  			    Display this help message"
  echo "  --hostname <hostname>	    Set hostname"
  echo "  --webhook <url> 		    Set webhook url"
}

# Check if no arguments are provided
if [[ $# -eq 0 ]]; then
  display_help
  exit 0
fi