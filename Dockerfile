# ---- build stage ----
    FROM node:20-alpine AS builder
    WORKDIR /app
    COPY package*.json ./
    RUN npm ci
    COPY . .
    RUN npm run build          # outputs to /app/dist
    
    # ---- runtime stage ----
    FROM nginx:alpine
    ENV NODE_ENV=production
      
    COPY --from=builder /app/dist /usr/share/nginx/html
    HEALTHCHECK CMD wget -qO- http://localhost || exit 1
    EXPOSE 80
    