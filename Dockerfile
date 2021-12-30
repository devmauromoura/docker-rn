# Install Node and JDK
FROM node:16.4.2
RUN mkdir -p /node
ADD . /node
WORKDIR /node
RUN npm install
RUN /bin/bash -c "apt-get update && apt-get install software-properties-common -y && apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main' && apt-get update && apt-get install openjdk-8-jdk -y && export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"
RUN /bin/bash -c "cd /usr/lib/ && mkdir Android && cd /usr/lib/Android/"
RUN /bin/bash -c "cd /usr/lib/Android/ && wget https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip"
RUN /bin/bash -c "cd /usr/lib/Android/ && unzip commandlinetools-linux-7583922_latest.zip"
RUN /bin/bash -c "cd /usr/lib/Android/ && rm -rf commandlinetools-linux-7583922_latest.zip"
RUN /bin/bash -c "cd /usr/lib/Android/cmdline-tools/ && mkdir latest"
RUN /bin/bash -c "mv /usr/lib/Android/cmdline-tools/bin /usr/lib/Android/cmdline-tools/latest/"
RUN /bin/bash -c "mv /usr/lib/Android/cmdline-tools/lib /usr/lib/Android/cmdline-tools/latest/"
RUN /bin/bash -c "mv /usr/lib/Android/cmdline-tools/NOTICE.txt /usr/lib/Android/cmdline-tools/latest/"
RUN /bin/bash -c "mv /usr/lib/Android/cmdline-tools/source.properties /usr/lib/Android/cmdline-tools/latest/"
RUN /bin/bash -c "cd /usr/lib/Android/cmdline-tools/latest && cd bin"
RUN /bin/bash -c 'cd /usr/lib/Android/cmdline-tools/latest/bin/ && ./sdkmanager "system-images;android-30;google_apis_playstore;x86_64" "sources;android-30" "platforms;android-30" "ndk;21.0.6113669" "build-tools;30.0.0" "platform-tools"'
RUN /bin/bash -c "export ANDROID_HOME=/usr/lib/Android/sdk"
RUN /bin/bash -c "export ANDROID_SDK_ROOT=/usr/lib/Android/sdk"
RUN /bin/bash -c 'cd /usr/lib/Android/cmdline-tools/latest/bin/ && ./avdmanager create avd -n "aditiva_avd" -k "system-images;android-30;google_apis_playstore;x86_64" -n'
CMD ["node", "server.js"]