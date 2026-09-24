#----------------------------------------
# Stage 1 - Build the React app
#----------------------------------------
FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

#----------------------------------------
# Stage 2 - Serve static files with nginx
#----------------------------------------
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]