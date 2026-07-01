#!/bin/bash

# Get current date and time
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define source and backup locations
SOURCE_DIR="/data/sample-data"
BACKUP_DIR="/data/backups"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Compress sample-data into a tar.gz file
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

# Display success message
echo "Backup created successfully!"
echo "Backup file: $BACKUP_FILE"

# Show backup file details
ls -lh "$BACKUP_FILE"