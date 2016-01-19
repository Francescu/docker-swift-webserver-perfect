FROM francescu/swift-linux:latest

# Install Dependencies
RUN apt-get update && \
    apt-get install -y \
    libssl-dev libevent-dev libsqlite3-dev \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone --depth 1 https://github.com/PerfectlySoft/Perfect.git perfect && \
    cd perfect/PerfectLib && \
    make && \
    make install && \
    cd ../PerfectServer && \
    make && \
    ln -s /perfect/PerfectServer/perfectserverhttp /usr/local/bin && \
    ln -s /perfect/PerfectServer/perfectserverfcgi /usr/local/bin


