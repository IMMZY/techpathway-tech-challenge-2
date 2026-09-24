#----------------------------------------
# Backend - Express API
#----------------------------------------
FROM node:22-alpine

WORKDIR /app
ENV NODE_ENV=production

# Install dependencies first so Docker can cache this layer
COPY package*.json ./
RUN npm ci --omit=dev

# Copy app code - config.js lives at backend root, not in src/
COPY config.js ./
COPY src ./src

EXPOSE 8080

# Run as the non-root user built into the node image
USER node

CMD ["node", "src/server.js"]