#!/bin/bash

# Define the URL of your application
# Replace this with the actual URL or IP where your app is accessible
APP_URL="http://192.168.49.2/"

# Duration for which to send requests (in seconds)
DURATION=300

# Check if the server scales every n seconds
CHECK_INTERVAL=30

echo "Starting load generation on $APP_URL for $DURATION seconds."

# Generate load
end=$((SECONDS+$DURATION))
while [ $SECONDS -lt $end ]; do
    curl -s $APP_URL > /dev/null
    # Sleep for a short while to avoid overwhelming the server
    sleep 0.1
done &

echo "Load generation started in the background. Monitoring scaling..."

# Monitor scaling
end_check=$((SECONDS+$DURATION))
while [ $SECONDS -lt $end_check ]; do
    echo "Checking HPA and pod status at $(date)"
    kubectl get hpa
    kubectl get pods -l app=php-webapp
    sleep $CHECK_INTERVAL
done

echo "Load test and monitoring completed."
