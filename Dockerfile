FROM node:alpine as builder

WORKDIR /app

COPY . /app

RUN npm install && npm run build


FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80