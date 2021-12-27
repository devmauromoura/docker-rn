FROM node:16.4.2
RUN mkdir -p /node
ADD . /node
WORKDIR /node
RUN npm install
CMD ["node", "server.js"]