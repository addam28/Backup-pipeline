FROM alpine:latest

# Install bash, tar and core utilities
RUN apk add --no-cache bash tar coreutils

# Create directories inside container
RUN mkdir -p /data/sample-data /data/backups

# Copy backup script
COPY backup-script/backup.sh /backup.sh

# Make script executable
RUN chmod +x /backup.sh

# Run backup script when container starts
CMD ["/backup.sh"]