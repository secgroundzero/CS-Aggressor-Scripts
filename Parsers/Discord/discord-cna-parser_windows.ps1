$global:version = "1.0"

$ascii = @"

 ██████ ███    ██  █████        ██████   █████  ██████  ███████ ███████ ██████  
██      ████   ██ ██   ██       ██   ██ ██   ██ ██   ██ ██      ██      ██   ██ 
██      ██ ██  ██ ███████ █████ ██████  ███████ ██████  ███████ █████   ██████  
██      ██  ██ ██ ██   ██       ██      ██   ██ ██   ██      ██ ██      ██   ██ 
 ██████ ██   ████ ██   ██       ██      ██   ██ ██   ██ ███████ ███████ ██   ██ 																		       
  
~ Created with <3 by @nickvourd
~ Special thanks to @sec_groundzero
~ Version: $global:version
~ Type: Discord CNA Parser Tool (Windows Edition)

"@

Write-Host $ascii

# Initialize variables with default values
$hostname = ""
$webhook = ""

# Function to display usage information
function Show-Help {
    Write-Host ""
    Write-Host "Usage: .\discord-cna-parser_windows.ps1 -hostname <hostname> -webhook <url>`n"
    Write-Host "Options:`n"
    Write-Host "  -h, --help                Display this help message"
    Write-Host "  -hostname <hostname>      Set hostname"
    Write-Host "  -webhook <url>            Set webhook url`n"
}

# Check if no arguments are provided
if ($args.Count -eq 0) {
    Show-Help
    exit 0
}

# Find-CnaFile function
function Find-CnaFile {
    param (
        [string]$rootPath = "C:\"  # Specify the root directory where you want to start the search
    )

    # Use the Get-ChildItem cmdlet to recursively search for the cna file
    $cnaFile = Get-ChildItem -Path $rootPath -Recurse -Filter "discord-alerts_windows.cna" -File -ErrorAction SilentlyContinue

    if ($null -ne $cnaFile) {
        return $cnaFile.FullName
    } else {
        Write-Host "CNA file not found in $rootPath or its subdirectories."
        return $null
    }
}

# ReplaceValues function
function ReplaceValues {
    param (
        [string]$webhook,
        [string]$hostname
    )

    # Find the CNA file
    $cnaFilePath = Find-CnaFile

    if ($null -eq $cnaFilePath) {
        Write-Host "Cannot proceed. CNA file not found."
        return
    }

    # Replace placeholders with provided values in the cna file
    (Get-Content $cnaFilePath) | ForEach-Object {$_ -replace 'https://discord.com/api/webhooks/XXXX', $webhook -replace 'XXXXXX', $hostname} | Set-Content $cnaFilePath

    Write-Host "`n[+] The $cnaFilePath has been successfully edited!`n"
}

# Function to validate webhook URL
function ValidateUrl {
    param([string]$url)
    # Regex pattern to check if the URL matches the basic format
    $urlRegex = '^https://discord.com/api/webhooks/.+'
    
    if ($url -match $urlRegex) {
        # Check if the URL contains "https://discord.com/api/webhooks/"
        if ($url -like '*https://discord.com/api/webhooks/*') {
            return $true  # Valid URL
        } else {
            return $false  # Invalid URL (doesn't contain required string)
        }
    } else {
        return $false  # Invalid URL
    }
}

# Parse command-line options
for ($i = 0; $i -lt $args.Count; $i++) {
    switch ($args[$i]) {
        '-hostname' {
            if ($i + 1 -lt $args.Count) {
                $hostname = $args[$i + 1]
                $i++
            } else {
                Write-Host "`n[!] Error: Argument for -hostname is missing" -ForegroundColor Red
                Show-Help
                exit 1
            }
            break
        }
        '-webhook' {
            if ($i + 1 -lt $args.Count) {
                $webhook = $args[$i + 1]
                if (-not (ValidateUrl $webhook)) {
                    Write-Host "`n[!] Error: Invalid webhook URL or missing 'https://discord.com/api/webhooks/'" -ForegroundColor Red
                    Show-Help
                    exit 1
                }
                $i++
            } else {
                Write-Host "`n[!] Error: Argument for -webhook is missing" -ForegroundColor Red
                Show-Help
                exit 1
            }
            break
        }
        '-h' {
            Show-Help
            exit 0
        }
        '--help' {
            Show-Help
            exit 0
        }
        default {
            Write-Host "`n[!] Error: Invalid option $($args[$i])" -ForegroundColor Red
            Show-Help
            exit 1
        }
    }
}

# Check if required arguments are missing
if (-not $hostname -or -not $webhook) {
    Write-Host "`n[!] Error: Required argument(s) missing" -ForegroundColor Red
    Show-Help
    exit 1
}

# Replace placeholders in the cna file
ReplaceValues $webhook $hostname