#!/usr/bin/env bash

osascript<<EOF
tell application "Skim" to open POSIX file "$1"
EOF
