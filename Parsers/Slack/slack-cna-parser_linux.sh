#!/usr/bin/env bash

#Ascii art print
cat << EOF

 ██████ ███    ██  █████        ██████   █████  ██████  ███████ ███████ ██████  
██      ████   ██ ██   ██       ██   ██ ██   ██ ██   ██ ██      ██      ██   ██ 
██      ██ ██  ██ ███████ █████ ██████  ███████ ██████  ███████ █████   ██████  
██      ██  ██ ██ ██   ██       ██      ██   ██ ██   ██      ██ ██      ██   ██ 
 ██████ ██   ████ ██   ██       ██      ██   ██ ██   ██ ███████ ███████ ██   ██ 																		       

Slack-CNA-Parser v.1.0 - Slack CNA Parser Tool (Linux Edition).
Written with <3 by @nickvourd...
Special thanks to @sec_groundzero... 
Please visit https://github.com/secgroundzero/CS-Aggressor-Scripts for more...
EOF

# Initialize variables with default values
hostname=""
channel=""
webhook=""

# Function to display usage information
display_help() {
  echo -e "\nUsage: ./slack-cna-parser_linux.sh --hostname <hostname> --channel <channel> --webhook <url>\n"
  echo "Options:"
  echo "  -h, --help  			      Display this help message"
  echo "  --hostname <hostname>	  Set hostname"
  echo "  --channel <#channel>   	Set channel(Staring with #)"
  echo "  --webhook <url> 		    Set webhook url"
}

# Check if no arguments are provided
if [[ $# -eq 0 ]]; then
  display_help
  exit 0
fi

# Function to validate if the channel starts with '#'
validate_channel_format() {
  local channel="$1"
  if [[ $channel == "#"* ]]; then
    return 0 # Channel starts with '#'
  else
    return 1 # Channel does not start with '#'
  fi
}

# Function to replace placeholders in the cna file
replace_values_in_cna_file() {
  local cna_file="slack-alerts_linux.cna"
  absolute_path=$(find / -type f -name "slack-alerts_linux.cna" 2>/dev/null)
  local channel=$1
  local webhook=$2
  local hostname=$3

  # Replace placeholders with provided values in the cna file
  sed -i "s|#XXXXXX|$channel|g; s|https://hooks.slack.com/services/XXXXXXXXXXX/XXXXXXXXXXXXXx|$webhook|g; s|XXXXXX|$hostname|g" "$absolute_path"

  echo -e "\n[+] The $absolute_path has been successfully edited!\n"
}

# Function to validate webhook URL
validate_webhook_url() {
  local url="$1"
  # Regex pattern to check if the URL matches the basic format
  local url_regex="^https://hooks.slack.com/services/.+"

  
  if [[ $url =~ $url_regex ]]; then
    # Check if the URL contains "https://hooks.slack.com/services/"
    if [[ $url == *"https://hooks.slack.com/services/"* ]]; then
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
    --channel)
      if [[ -n "$2" ]]; then
        channel="$2"
      	if ! validate_channel_format "$channel"; then
          echo -e "\n[!] Error: Channel should start with '#' symbol" >&2
          display_help
          exit 1
        fi
        shift
      else
        echo -e "\n[!] Error: Argument for --channel is missing" >&2
        display_help
        exit 1
      fi
      ;;
    --webhook)
      if [[ -n "$2" ]]; then
        webhook="$2"
        if ! validate_webhook_url "$webhook"; then
          echo -e "\n[!] Error: Invalid webhook URL or missing 'https://hooks.slack.com/services/'" >&2
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
if [[ -z "$hostname" || -z "$channel" || -z "$webhook" ]]; then
  echo -e "\n[!] Error: Required argument(s) missing" >&2
  display_help
  exit 1
fi

# Replace placeholders in the cna file
replace_values_in_cna_file $channel $webhook $hostname