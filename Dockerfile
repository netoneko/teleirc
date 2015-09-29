FROM node:4.1-slim

ADD . /opt/teleirc

WORKDIR /opt/teleirc

RUN npm install

ENV CONFIG="module.exports={}"
ENV CHAT_IDS="{}"

# Pass config from environment
CMD mkdir -p /root/.teleirc &&\
  echo "$CONFIG" > /root/.teleirc/config.js &&\
  echo $CHAT_IDS > /root/.teleirc/chat_ids &&\
  node teleirc.js

