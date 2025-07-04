#!/bin/sh

TARGET=/app/public/assets
LINK=/usr/share/nginx/html/media

# Check if something exists at the link path
if [ -e "$LINK" ] || [ -d "$LINK" ] || [ -L "$LINK" ]; then
  echo "Removing existing path at $LINK"
  rm -rf "$LINK"
fi

# Create the symlink
echo "Creating symlink: $LINK → $TARGET"
ln -s "$TARGET" "$LINK"

# Start nginx
exec nginx -g 'daemon off;'


ls -l /usr/share/nginx/html >> /var/log/symlink-check.log

echo "[Entrypoint] Symlink created at: $(date)"
