FROM silex/emacs:28.2-alpine

RUN apk update && apk add \
    git \
    tar

ADD home-generate/.emacs  /root/.emacs
RUN emacs -batch -l /root/.emacs
