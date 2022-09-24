FROM node:alpine as builder
RUN apk add --update nodejs npm
RUN apk add --update npm
WORKDIR /app
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build


FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html
