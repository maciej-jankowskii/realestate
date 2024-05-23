FROM node:20-alpine AS build
WORKDIR /app
COPY realestate/package*.json ./
RUN npm install
COPY realestate/ ./
RUN npm run build


FROM nginx:1.23-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]