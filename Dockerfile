FROM digiwomb/kubuk:1.1.0

RUN apt-get update && apt-get install -y \
    crystal \
    libc6-dev \
    libevent-dev \
    libpcre2-dev \
    libpng-dev \
    libssl-dev \
    libyaml-dev \
    zlib1g-dev

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install luckyframework/homebrew-lucky/lucky