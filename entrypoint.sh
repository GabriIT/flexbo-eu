#!/bin/sh

# Create the symlink at runtime (in case it's missing)
TARGET=/app/public/assets
LINK=/usr/share/nginx/html/assets

if [ ! -L "$LINK" ]; then
  echo "Creating symlink: $LINK → $TARGET"
  ln -s "$TARGET" "$LINK"
fi

# Start nginx
exec nginx -g 'daemon off;'
