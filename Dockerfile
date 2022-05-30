FROM node:alpine AS mapp
WORKDIR /app
COPY package.json .

RUN npm install

COPY . .

RUN npm run build 
# CMD npm start


FROM nginx:alpine
COPY --from=mapp /app/build/ /usr/share/nginx/html