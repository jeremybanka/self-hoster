#!bin/zsh

# Variables
DB_NAME="tempest"
BACKUP_DIR="./backups"
BACKUP_NAME="db_backup_$(date +%F).sql"
ENCRYPTED_BACKUP="${BACKUP_NAME}.gpg"
B2_BUCKET="your-backblaze-bucket"
RETENTION_DAYS=7

# Create PostgreSQL dump
pg_dump $DB_NAME > "$BACKUP_DIR/$BACKUP_NAME"

# Encrypt the dump
gpg --output "$BACKUP_DIR/$ENCRYPTED_BACKUP" --encrypt --recipient your_gpg_key "$BACKUP_DIR/$BACKUP_NAME"

# Upload to Backblaze B2
b2 upload-file $B2_BUCKET "$BACKUP_DIR/$ENCRYPTED_BACKUP" "$ENCRYPTED_BACKUP"

# Remove unencrypted dump
rm "$BACKUP_DIR/$BACKUP_NAME"

# Clean up old backups (older than 7 days)
find "$BACKUP_DIR" -type f -name "*.gpg" -mtime +$RETENTION_DAYS -exec rm {} \;

# Optionally: Clean up old backups from Backblaze B2 (using B2 lifecycle rules)
