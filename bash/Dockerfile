FROM nginx

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
RUN rm /etc/nginx/conf.d/default.conf
COPY app.conf /etc/nginx/conf.d/

RUN apt update
# netcat нужен для тестирования доступности узла mongodb: nc -zv mongodb 27017
RUN apt-get install netcat -y
