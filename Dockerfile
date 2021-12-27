# Install Node and JDK
FROM node:16.4.2
RUN mkdir -p /node
ADD . /node
WORKDIR /node
RUN npm install
RUN /bin/bash -c "apt-get update && apt-get install software-properties-common -y && apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main' && apt-get update && apt-get install openjdk-8-jdk -y && export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"
RUN /bin/bash -c "apt-get install android-sdk -y && export ANDROID_HOME=/usr/lib/android-sdk"
CMD ["node", "server.js"]