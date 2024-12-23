FROM digiwomb/kubuk:1.2.0

RUN apt-get update && apt upgrade -y && apt-get install -y \
    crystal \
    libc6-dev \
    libevent-dev \
    libpcre2-dev \
    libpng-dev \
    libssl-dev \
    libyaml-dev \
    zlib1g-dev

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install luckyframework/homebrew-lucky/lucky

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install mailpit

RUN sudo -u kasm-user /bin/bash -c "code --install-extension crystal-lang-tools.crystal-lang \
    && code --install-extension stephendolan.lucky"

RUN sudo -u kasm-user /home/linuxbrew/.linuxbrew/bin/brew install postgresql@17

RUN echo >> /home/kasm-user/.bashrc \
    && echo 'export PATH="$HOMEBREW_PREFIX/opt/postgresql@17/bin:$PATH"' >> /home/kasm-user/.bashrc

RUN /bin/bash -c "echo 'deb [signed-by=/usr/share/keyrings/beekeeper.gpg] https://deb.beekeeperstudio.io stable main' | tee /etc/apt/sources.list.d/beekeeper-studio-app.list"

RUN /bin/bash -c "wget -O- https://deb.beekeeperstudio.io/beekeeper.key | gpg --dearmor | tee /usr/share/keyrings/beekeeper.gpg"

RUN apt update && apt install -y beekeeper-studio

RUN mkdir -p /etc/apt/keyrings

RUN mkdir /config/.gnupg

RUN gpg --no-default-keyring --keyring /etc/apt/keyrings/bruno.gpg --keyserver keyserver.ubuntu.com --recv-keys 9FA6017ECABE0266

RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list

RUN apt update && apt install -y bruno

USER kasm-user
RUN /home/linuxbrew/.linuxbrew/bin/brew install node
RUN /home/linuxbrew/.linuxbrew/bin/npm install --global yarn
USER root