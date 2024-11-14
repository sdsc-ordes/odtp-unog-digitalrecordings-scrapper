#!/bin/bash

# Default values
start_date="01/07/2014"
output_file="meetings.jsonl"

# Parse command line options
while getopts ":s:e:o:g:m:k:" opt; do
    case $opt in
        s) start_date="$OPTARG" ;;
        e) end_date="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        g) organization="$OPTARG" ;;
        m) meeting_type="$OPTARG" ;;
        k) keywords="$OPTARG" ;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
        :) echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
    esac
done

# Check for required end_date
if [ -z "$end_date" ]; then
    echo "Error: -e (end_date) is required" >&2
    exit 1
fi

# Build command with optional parameters
cmd="python3 /odtp/odtp-app/app.py --start_date $start_date --end_date $end_date --output_file $output_file"

# Add optional parameters if they exist
[ ! -z "$organization" ] && cmd="$cmd --organization $organization"
[ ! -z "$meeting_type" ] && cmd="$cmd --meeting_type $meeting_type"
[ ! -z "$keywords" ] && cmd="$cmd --keywords $keywords"

# Execute command
eval $cmd