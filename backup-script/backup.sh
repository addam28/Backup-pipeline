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
cd "$BACKUP_DIR"

sha256sum "$(basename "$BACKUP_FILE")" > "$(basename "$BACKUP_FILE").sha256"

echo "Checksum generated: $(basename "$BACKUP_FILE").sha256"

cat "$(basename "$BACKUP_FILE").sha256"

# Record metrics for Prometheus
METRICS_FILE="$BACKUP_DIR/metrics.prom"

BACKUP_STATUS=1
BACKUP_SIZE=$(stat -c%s "$(basename "$BACKUP_FILE")" 2>/dev/null || echo 0)
BACKUP_FILES=$(find "$BACKUP_DIR" -name "*.tar.gz" | wc -l)
END_TIME=$(date +%s)

cat > "$METRICS_FILE" << EOF
backup_last_run_timestamp $END_TIME
backup_last_success $BACKUP_STATUS
backup_size_bytes $BACKUP_SIZE
backup_files $BACKUP_FILES
EOF

echo "Metrics written to $METRICS_FILE"
cat "$METRICS_FILE"