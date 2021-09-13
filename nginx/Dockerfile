FROM nginx

# добавим редактор внутрь образа - для отладки
RUN curl https://getmic.ro | bash
RUN mv micro /usr/bin

RUN rm /etc/nginx/nginx.conf
COPY ./nginx/nginx.conf /etc/nginx/
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/app.conf /etc/nginx/conf.d/

COPY ./nginx /usr/share/nginx/html

RUN apt update && apt install iproute2 -y

#USER test
#ARG USERNAME=appuser
#RUN useradd --create-home $USERNAME
#USER root

COPY .bashrc /root
#COPY .bashrc /home/$USERNAME
#USER $USERNAME
#COPY run.sh .

#RUN mkdir /myvol
#RUN echo "hello world" > /myvol/greeting
#VOLUME /myvol

#RUN chmod +x /run.sh
#RUN ["/run.sh"]
#ENTRYPOINT ["/run.sh"]
#CMD ["aaa"]
