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
  echo "  -h, --help    Display this help message"
  echo "  --hostname <hostname>     Set hostname"
  echo "  --webhook <url>   Set webhook url"
}

# Check if no arguments are provided
if [[ $# -eq 0 ]]; then
  display_help
  exit 0
fi

# Function to replace placeholders in the cna file
replace_values_in_cna_file() {
  local cna_file="slack-alerts_linux.cna"
  absolute_path=$(find / -type f -name "discord-alerts_linux.cna" 2>/dev/null)
  local webhook=$1
  local hostname=$2

  # Replace placeholders with provided values in the cna file
  sed -i "s|https://discord.com/api/webhooks/XXXX|$webhook|g; s|XXXXXX|$hostname|g" "$absolute_path"

  echo -e "\n[+] The $absolute_path has been successfully edited!\n"
}

# Function to validate webhook URL
validate_webhook_url() {
  local url="$1"
  # Regex pattern to check if the URL matches the basic format
  local url_regex="^https://discord.com/api/webhooks/.+"

  
  if [[ $url =~ $url_regex ]]; then
    # Check if the URL contains "https://discord.com/api/webhooks/"
    if [[ $url == *"https://discord.com/api/webhooks/"* ]]; then
      return 0 # Valid URL
    else
      return 1 # Invalid URL (doesn't contain required string)
    fi
  else
    return 1 # Invalid URL
  fi
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    --hostname)
      if [[ -n "$2" ]]; then
        hostname="$2"
        shift
      else
        echo -e "\n[!] Error: Argument for --hostname is missing" >&2
        display_help
        exit 1
      fi
      ;;
    --webhook)
      if [[ -n "$2" ]]; then
        webhook="$2"
        if ! validate_webhook_url "$webhook"; then
          echo -e "\n[!] Error: Invalid webhook URL or missing 'https://discord.com/api/webhooks/'" >&2
          display_help
          exit 1
        fi
        shift
      else
        echo -e "\n[!] Error: Argument for --webhook is missing" >&2
        display_help
        exit 1
      fi
      ;;
    -h | --help)
      display_help
      exit 0
      ;;
    *)
      echo -e "\n[!] Error: Invalid option $1" >&2
      display_help
      exit 1
      ;;
  esac
  shift
done

# Check if required arguments are missing
if [[ -z "$hostname" || -z "$webhook" ]]; then
  echo -e "\n[!] Error: Required argument(s) missing" >&2
  display_help
  exit 1
fi

# Replace placeholders in the cna file
replace_values_in_cna_file $webhook $hostname