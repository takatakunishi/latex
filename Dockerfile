FROM paperist/texlive-ja:latest
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install make
RUN apt install -y curl
RUN apt install texlive-extra-utils -y
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs
RUN apt-get install -y locales \
    && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
COPY ./lint /workspace/lint
RUN cd /workspace/lint && npm install