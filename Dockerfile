# Step 1: Build with Vite
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Step 2: Serve with NGINX
FROM nginx:1.25-alpine
COPY --from=builder /app/dist /usr/share/nginx/html

# Link for mounted assets (Dokku volume will mount to /app/public/assets)
RUN ln -s /app/public/assets /usr/share/nginx/html/assets

# Expose port and run
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
