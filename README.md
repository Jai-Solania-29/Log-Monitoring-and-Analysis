# Log Monitoring and Analysis

This bash shell script automates the monitoring and analysis of a log file named `sample.log`. It continuously monitors the log file for new entries in real-time and performs basic analysis on each entry, including counting occurrences of error messages, extracting HTTP status codes, and generating a summary report of the top error messages.

## Script Overview

The `log_monitor.sh` script consists of several key steps to achieve log monitoring and analysis functionality:

1. **Trap Ctrl+C Signal:**
   The script starts by setting up a trap to handle the Ctrl+C signal (`SIGINT`). This allows the script to gracefully exit the monitoring loop when the user interrupts the execution.

2. **Define Log File Path:**
   The path to the log file (`sample.log`) to be monitored is specified in a variable called `LOG_FILE`.

3. **Monitor Log File:**
   The `monitor_log` function is defined to continuously monitor the log file for new entries. It uses the `tail -F` command to follow the file in real-time and reads new entries as they are appended to the file.

4. **Process Log Entry:**
   For each new log entry, the `process_log_entry` function is called. This function extracts relevant information from the log entry and performs basic analysis.

5. **Count Occurrences of Error Messages:**
   The script checks each log entry for the presence of the string "ERROR" using `grep`. If an error message is found, it is echoed to the console.

6. **Extract HTTP Status Codes:**
   HTTP status codes are extracted from each log entry using `grep` with a regular expression pattern. If HTTP status codes are found, they are echoed to the console.

7. **Generate Summary Report of Top Error Messages:**
   The script identifies error messages in log entries and generates a summary report of the top error messages. It sorts the error messages, counts their occurrences using `uniq -c`, sorts them in descending order, and displays the top 3 error messages.

## How to Use

1. **Clone the Repository:**

```git clone https://github.com/Jai-Solania-29/Log-Monitoring-and-Analysis.git```

2. **Navigate to the Directory:**

```cd log_monitor.sh```

3. **Make the Script Executable:**

```chmod +x log_monitor.sh```

4. **Run the Script:**

```./log_monitor.sh```

This will start monitoring the `sample.log` file located in the same directory.

5. **Stop Monitoring:**

To stop the monitoring loop, press `Ctrl+C`.

## Customization

- You can customize the log file path by modifying the `LOG_FILE` variable in the script.
- Additional log analysis or monitoring functionalities can be added by extending the `process_log_entry` function.
