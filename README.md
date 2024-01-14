# CS-Aggressor-Scripts

Aggressor script for easier team collaboration with Cobalt Strike.

## Description

These scripts will notify you via the Slack application when:

- A new client connects to the team server.
- A CS client disconnects from the team server.
- A new incoming beacon.
- A new web hit occurs.
- A CS client posts something in the event log.
- New site hosts.
- New credentials come in from keylogging.
- A new screenshot is taken from Cobalt Strike.

:information_source: The scripts are compatible with both the Windows and Linux operating systems.

The following table illustrates the CNA files included in this project:

| Name | OS | App | Description |
|:-----------:|:-----------:|:-----------:|:-----------:|
|[slack-alerts_linux.cna](/cna-scripts/Slack/slack-alerts_linux.cna)| Linux | Slack | Slack CNA file for Linux CS client |
|[slack-alerts_windows.cna](/cna-scripts/Slack/slack-alerts_linux.cna)| Windows | Slack | Slack CNA file for Windows CS client |

## Acknowledgement

The official author of this project is [@sec_groundzero](https://twitter.com/sec_groundzero).

Special thanks to my friend [@nickvourd](https://twitter.com/nickvourd) for his contributions.

This aggressor script was inspired by [@bluescreenofjeff](https://twitter.com/bluescreenofjeff)'s projects.

## Table of Contents
- [CS-Aggressor-Scripts](#cs-aggressor-scripts)
  - [Description](#description)
  - [Acknowledgement](#acknowledgement)
  - [Table of Contents](#table-of-contents)
  - [Parsers](#parsers)
    - [Linux Parser for Slack](#linux-parser-for-slack)
    - [Windows Parser for Slack](#windows-parser-for-slack)
  - [Setup Slack and Webhooks](#setup-slack-and-webhooks)
  - [References](#references)

## Parsers

In this project, there are two parsers that automate the editing of CNA file according to your personal preferences.

In the following table, the parsers of this project are presented:

| Name | Language | OS | App | Description |
|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|
|[slack-cna-parser_linux.sh](/Parsers/Slack/slack-cna-parser_linux.sh)| Bash | Linux | Slack | Slack CNA Parser for Linux systems |
|[slack-cna-parser_windows.ps1](/Parsers/Slack/slack-cna-parser_windows.ps1)| PowerShell | Windows | Slack | Slack CNA Parser for Windows systems |

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

## Setup Slack and Webhooks

To setup slack server and webhook, you can follow these [guides] or visit the [Slack Website](https://api.slack.com/incoming-webhooks).

## References

- [Aggressor Script Guide by Forta](https://hstechdocs.helpsystems.com/manuals/cobaltstrike/current/userguide/content/topics/agressor_script.htm)
- [Slack Official Site](https://slack.com)
- [Sleep Language 2.1 Tutorial](http://sleep.dashnine.org/manual/)
- [Cobalt Strike Official Site](https://www.cobaltstrike.com)
- [AggressorScripts GitHub by bluscreenofjeff](https://github.com/bluscreenofjeff/AggressorScripts)