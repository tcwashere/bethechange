FROM mhart/alpine-node:10.9.0
LABEL maintainer="Jon Changkachith <tcwashere@gmail.com>"

RUN apk --update add --no-cache \
    bash \
    curl \
    && rm -rf /var/cache/apk/*

RUN echo 'alias ll="ls -l"' >> ~/.bashrc

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# copy EPR to /${APP_NAME}
COPY www /www

# build/package frontend
WORKDIR /www
RUN npm install

CMD [ "/www/start.sh" ]