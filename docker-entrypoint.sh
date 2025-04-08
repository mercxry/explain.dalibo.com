#!/bin/sh
set -e

HTTP_HOST="${HTTP_HOST:-0.0.0.0}"
HTTP_PORT="${HTTP_PORT:-5000}"

echo "Waiting for database to be ready..."
max_attempts=30
count=0

while [ "$count" -lt "$max_attempts" ]; do
    if flask db upgrade; then
        echo "Database migrations completed successfully"
        break
    fi
    count=$((count + 1))
    echo "Migration attempt $count of $max_attempts failed. Retrying in 2 seconds..."
    sleep 2
done

if [ "$count" -eq "$max_attempts" ]; then
    echo "Could not complete database migrations after $max_attempts attempts"
    exit 1
fi

echo "Starting web server on ${HTTP_HOST}:${HTTP_PORT}..."
exec waitress-serve --host "$HTTP_HOST" --port "$HTTP_PORT" app:app
