# Stage 1: Build with Vite
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx:1.25-alpine
COPY --from=builder /app/dist /usr/share/nginx/html

# Mount will attach to /app/public/assets at runtime; symlink to NGINX root
RUN mkdir -p /usr/share/nginx/html/assets && \
    ln -s /app/public/assets /usr/share/nginx/html/assets

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
