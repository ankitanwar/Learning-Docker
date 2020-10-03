FROM node:alpine as builder
#all the things below that are gonna happen is come under builder now 

WORKDIR /app

COPY package.json .
RUN npm install 

COPY . .

RUN npm run build     
#npm run bild node js mei hoti hai production app banane ke liye 


FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html

