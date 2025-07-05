#########################
# --- build stage ---   #
#########################
# Using Debian (glibc) so the lock-file you committed works on the same libc
FROM node:20-bullseye AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci                    

COPY . .
RUN npm run build             



#########################
# --- runtime stage --- #
#########################
FROM nginx:alpine             
ENV NODE_ENV=production

COPY --from=builder /app/dist /usr/share/nginx/html

HEALTHCHECK CMD wget -qO- http://localhost || exit 1
EXPOSE 80
