FROM node:alpine AS builder
WORKDIR /app
COPY . .
RUN yarn install && yarn cache clean && yarn build

FROM nginx:latest
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY  --from=builder /app/build .