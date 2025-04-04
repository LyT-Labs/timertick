# docker/prod/Dockerfile
FROM node:20 AS builder

WORKDIR /app
COPY ../../apps/api/package*.json ./
RUN npm install

COPY ../../apps/api ./
RUN npm run build


# STAGE FINAL: solo lo que necesitamos para correr
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
RUN npm install --production

EXPOSE 3000
CMD ["node", "dist/main"]
