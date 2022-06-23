FROM gitpod/workspace-full:latest
USER root


# install rvm
RUN apt-get update --quiet && \
    apt-get install -y --no-install-recommends && \
    apt-get install software-properties-common && \
    apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get update && \
    apt-get install rvm -y && \
    echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc && \
    usermod -a -G rvm $USER && \
    exec /usr/bin/bash

# install node and yarn 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    sudo apt install nodejs -y && \
    apt-get install yarn -y

# install ruby
RUN bash -c 'source /etc/profile.d/rvm.sh && rvm install 3.0.3'
ENTRYPOINT ["/bin/bash"]