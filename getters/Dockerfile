# === BUILD ===
FROM node:22-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN apk add --no-cache python3 make g++

RUN npm ci --only=production

COPY . .


# === PRODUCTION ===
FROM node:22-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/package*.json ./
COPY --from=builder /usr/src/app .

ENV NODE_ENV=production
USER node
EXPOSE 8080
CMD [ "npm", "start" ]