#!/bin/bash

# Function to handle Ctrl+C functionality
trap 'echo -e "\nLog monitoring interrupted. Exiting." && exit 0' SIGINT

# Log file that needs to be monitored
LOG_FILE="sample.log"

# Function to monitor the given log file
monitor_log() {
    echo "Monitoring log file: $LOG_FILE"
    tail -n 0 -F "$LOG_FILE" | while read -r line; do
        process_log_entry "$line"
    done
}

# Function to process log entry
process_log_entry() {
    local entry="$1"

    # Logic to count the occurrence of error messages
    if grep -q 'ERROR' <<< "$entry"; then
        echo "Error found in log entry: $entry"
    fi

    # Logic to extract HTTP status codes and count their occurrences
    http_status_codes=$(grep -o '\b[0-9]\{3\}\b' <<< "$entry")
    if [ -n "$http_status_codes" ]; then
        echo "HTTP Status Codes found: $http_status_codes"
    fi

    # Logic to generate summary report of top error messages
    error_messages=$(grep -o 'ERROR.*' <<< "$entry")
    if [ -n "$error_messages" ]; then
        echo "Top Error Messages:"
        echo "$error_messages" | sort | uniq -c | sort -rn | head -n 3
    fi
}

main() {
    echo "Starting log monitoring and analysis..."
    monitor_log
}

main
