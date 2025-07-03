#!/bin/sh

TARGET=/app/public/assets
LINK=/usr/share/nginx/html/assets

# Remove directory or broken symlink if it exists
if [ -e "$LINK" ] || [ -d "$LINK" ]; then
  echo "Removing existing $LINK"
  rm -rf "$LINK"
fi

# Create fresh symlink
echo "Creating symlink: $LINK → $TARGET"
ln -s "$TARGET" "$LINK"

# Start nginx
exec nginx -g 'daemon off;'

ls -l /usr/share/nginx/html >> /var/log/symlink-check.log

