FROM node:12.16.3-alpine3.9 as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html
