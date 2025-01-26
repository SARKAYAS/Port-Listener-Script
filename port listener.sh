#!/bin/bash

# Function to retrieve all listening ports
get_listening_ports() {
    ss -tuln | awk 'NR > 1 && $5 ~ /:[0-9]+$/ {split($5, a, ":"); print a[2]}' | sort -nu
}

# Function to find the process name and PID for a specific port
get_process_for_port() {
    local port=$1
    local pid=$(lsof -ti :$port 2>/dev/null)
    if [[ -n $pid ]]; then
        local process=$(ps -p $pid -o comm=)
        echo -e "Port: $port\nProcess: $process (PID: $pid)\n"
    else
        echo -e "Port: $port\nProcess: Not found or requires elevated permissions.\n"
    fi
}

# Main script execution
echo -e "Open Ports on $(hostname):"
echo "==========================="

listening_ports=$(get_listening_ports)

if [[ -z $listening_ports ]]; then
    echo "No listening ports found."
else
    for port in $listening_ports; do
        get_process_for_port $port
    done
fi
