# ---------- build stage ----------
    FROM node:20-bullseye AS builder          # ❶ glibc, not musl
    WORKDIR /app
    
    # copy lock file; works fine on glibc
    COPY package*.json ./
    RUN npm ci                                  # deterministic install
    
    COPY . .
    RUN npm run build                           # → /app/dist
    
    # ---------- runtime stage ----------
    FROM nginx:alpine                           # runtime can stay Alpine
    ENV NODE_ENV=production
    COPY --from=builder /app/dist /usr/share/nginx/html
    HEALTHCHECK CMD wget -qO- http://localhost || exit 1
    EXPOSE 80
    