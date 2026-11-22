#!/bin/bash
echo " "
if which box64 >/dev/null 2>&1; then
    box64 -v
fi
if which FEXGetConfig >/dev/null 2>&1; then
    FEXGetConfig --version
fi
uname -r
if [[ -r /etc/os-release ]]; then
    ( source /etc/os-release && printf '%s\n' "$PRETTY_NAME" )
fi
wine --version 2>&1
lscpu | grep -E 'Architecture|CPU op-mode|CPU\(s\)|On-line CPU\(s\)|Model name'
echo " "
