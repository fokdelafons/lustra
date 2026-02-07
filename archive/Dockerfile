# Wybieramy lekki obraz Alpine z najnowszym Node.js
FROM node:22-alpine

# Ustawiamy zmienne środowiskowe
ENV NODE_ENV=production
ENV NODE_OPTIONS="--max-old-space-size=2048"

WORKDIR /app

# Kopiujemy package.json
COPY package*.json ./

# ZMIANA: Używamy 'npm install' zamiast 'npm ci'
RUN npm install --only=production

# Kopiujemy kod źródłowy
COPY src ./src

# Tworzymy katalog tymczasowy
RUN mkdir -p /tmp/dist

CMD ["node", "src/index.js"]