FROM ubuntu:latest

RUN apt update && apt install -y \
    git \
    curl \
    jq \
    gum \
    zsh \

ENV ALCHEMY_HOME=/root/.alchemy

COPY . $ALCHEMY_HOME

RUN chmod +x $ALCHEMY_HOME/bin/alchemy

WORKDIR /root

CMD ["bash"]