# docker/dev/api.Dockerfile
FROM node:20

WORKDIR /app

# Instalar dependencias globales útiles para dev
RUN npm install -g ts-node-dev

# Copiar package.json y lock para instalar deps
COPY ../../apps/api/package*.json ./
RUN npm install

# Copiamos el código fuente (en desarrollo puede ser omitido si usás bind mount)
COPY ../../apps/api ./

# Exponer puertos: API + debug
EXPOSE 3000 9229

CMD ["ts-node-dev", "--respawn", "--transpile-only", "--inspect=0.0.0.0:9229", "src/main.ts"]
