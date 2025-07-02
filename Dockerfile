# Stage 1: Build frontend with Vite
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx:1.25-alpine
COPY --from=builder /app/dist /usr/share/nginx/html

# Symlink mounted assets to be accessible from /assets/
RUN mkdir -p /usr/share/nginx/html/assets && \
    ln -s /app/public/assets /usr/share/nginx/html/assets

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
