# CS-Aggressor-Scripts

Aggressor scripts for easier team collaboration with Cobalt Strike.

## Description

:information_source: This project contains CNA files for Cobalt Strike, parsers for automated editing of the CNA files, and guides to set up webhooks on the Slack or Discord application.

These CNA files will notify you via the `Slack`/`Discord`/`Teams` applications when:

- A new client connects to the team server.
- A CS client disconnects from the team server.
- A new incoming beacon.
- A new web hit occurs.
- A CS client posts something in the event log.
- New site hosts.
- New credentials come in from keylogging.
- A new screenshot is taken from Cobalt Strike.

:information_source: The scripts are compatible with both the Windows and Linux Operating Systems.

The following table illustrates the CNA files included in this project:

| Name | OS | App | Description |
|:-----------:|:-----------:|:-----------:|:-----------:|
|[slack-alerts_linux.cna](/cna-scripts/Slack/slack-alerts_linux.cna)| Linux | Slack | Slack CNA file for Linux CS client |
|[slack-alerts_windows.cna](/cna-scripts/Slack/slack-alerts_windows.cna)| Windows | Slack | Slack CNA file for Windows CS client |
|[discord-alerts_linux.cna](/cna-scripts/Discord/discord-alerts_linux.cna)| Linux | Discord | Discord CNA file for Linux CS Client |
|[teams-alerts_linux.cna](/cna-scripts/Teams/teams-alerts_linux.cna)| Linux | Teams | Teams CNA file for Linux CS Client |

## Acknowledgement

The official author of this project is [@sec_groundzero](https://twitter.com/sec_groundzero).

Special thanks to my friend [@nickvourd](https://twitter.com/nickvourd) for his contributions.

These aggressor scripts were inspired by [@bluescreenofjeff](https://twitter.com/bluescreenofjeff)'s projects.

## Table of Contents
- [CS-Aggressor-Scripts](#cs-aggressor-scripts)
  - [Description](#description)
  - [Acknowledgement](#acknowledgement)
  - [Table of Contents](#table-of-contents)
  - [Webhooks](#webhooks)
    - [Setup Slack and Webhooks](#setup-slack-and-webhooks)
    - [Setup Discord and Webhooks](#setup-discord-and-webhooks)
    - [Setup Teams Webhooks](#setup-teams-webhooks)
  - [Parsers](#parsers)
    - [Linux Parser for Slack](#linux-parser-for-slack)
    - [Windows Parser for Slack](#windows-parser-for-slack)
    - [Linux Parser for Discord](#linux-parser-for-discord)
    - [Linux Parser for Teams]()
  - [Example CNA Output](#example-cna-output)
  - [References](#references)

## Webhooks

### Setup Slack and Webhooks

:information_source: To set up a Slack server and webhook, you can follow these guides provided on the [Slack website](https://api.slack.com/incoming-webhooks).

### Setup Discord and Webhooks

:information_source: To set up a Discord server and webhook, you can follow these guides provided on the [Discord website](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks).

### Setup Teams Webhooks

:information_source: To set up a Microsoft Teams webhook, you can follow these guides provided on [Microsoft website](https://learn.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook?tabs=newteams%2Cdotnet).

## Parsers

In this project, there are four parsers that automate the editing of CNA file according to your personal preferences.

:information_source: However, you can manually edit the CNA files without using the parsers.

In the following table, the parsers of this project are presented:

| Name | Language | OS | App | Description |
|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|
|[slack-cna-parser_linux.sh](/Parsers/Slack/slack-cna-parser_linux.sh)| Bash | Linux | Slack | Slack CNA Parser for Linux systems |
|[slack-cna-parser_windows.ps1](/Parsers/Slack/slack-cna-parser_windows.ps1)| PowerShell | Windows | Slack | Slack CNA Parser for Windows systems |
|[discord-cna-parser_linux.sh](/Parsers/Discord/discord-cna-parser_linux.sh)| Bash | Linux | Discord | Discord CNA Parser for Linux systems |

### Linux Parser for Slack

The [Linux parser for Slack](/Parsers/Slack/slack-cna-parser_linux.sh) uses three mandatory arguments:

- hostname
- channel
- webhook

To run the linux parser, you should use the following usage:

```
./slack-cna-parser_linux.sh --channel "#XXXX" --hostname "XXXX" --webhook "https://hooks.slack.com/services/XXXX"
```

Example:

![linux-parser-example](/Pictures/linux-parser-example.png)

### Windows Parser for Slack

The [Windows parser for Slack](/Parsers/Slack/slack-cna-parser_windows.ps1) uses three mandatory arguments:

- hostname
- channel
- webhook

To run the windows parser, you should use the following usage:

```
.\slack-cna-parser_windows.ps1  -hostname "XXXX" -channel "#XXXX" -webhook "https://hooks.slack.com/services/XXXX"
```

Example:

![windows-parser-example](/Pictures/windows-parser-example.png)

### Linux Parser for Discord

The [Linux parser for Discord](/Parsers/Discord/discord-cna-parser_linux.sh) uses two mandatory arguments:

- hostname
- webhook

To run the linux parser, you should use the following usage:

```
./discord-cna-parser_linux.sh --hostname "XXXX" --webhook "https://discord.com/api/webhooks/XXXXX"
```

Example:

![Discord-Linux-Parser](/Pictures/Discord-Linux-Parser.png)

### Linux Parser for Teams

The Linux parser for Teams uses two mandatory arguments:

- hostname
- webhook

To run the linux parser, you should use the following usage:


## Example CNA Output

#### New incoming Beacon notification example (Slack):

![New-Beacon-Example](/Pictures/New-Beacon-Example1.png)

#### New Web hit notification example (Discord):

![Web-Hit-Example](/Pictures/Web-Hit-Example1.png)

#### New CS client connects to the teamserver notification example (Slack):

![New-CS-Client-Connect-Example](/Pictures/New-CS-Client-Connect-Example1.png)

#### CS Client disconnects from the teamserver notification example (Discord):

![CS-Client-Disconnect](/Pictures/CS-Client-Disconnect.png)

#### CS Client hosts a file or clones a website notification example (Slack):

![Host-File-Clone-Site](/Pictures/Host-File-Clone-Site.png)

#### CS client posts something in the event log (Discord):

![New-message-CS](/Pictures/New-message-CS.png)

#### New credentials come in from keylogging (Discord):

![New-credentials-come-in](/Pictures/Keystrokes-Received.png)

#### New screenshot is taken from Cobalt Strike (Slack):

![New-Screesnhot-taken](/Pictures/New-Screesnhot-taken.png)

## References

- [Aggressor Script Guide by Forta](https://hstechdocs.helpsystems.com/manuals/cobaltstrike/current/userguide/content/topics/agressor_script.htm)
- [Slack Official Site](https://slack.com)
- [Discord Official Site](https://discord.com)
- [Sleep Language 2.1 Tutorial](http://sleep.dashnine.org/manual/)
- [Cobalt Strike Official Site](https://www.cobaltstrike.com)
- [AggressorScripts GitHub by bluscreenofjeff](https://github.com/bluscreenofjeff/AggressorScripts)
