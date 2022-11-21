FROM rust:1.65

WORKDIR /usr/src/myapp
COPY . .


RUN touch /usr/local/cargo/config

RUN echo '[source.crates-io]\n\
replace-with = "rsproxy"\n\
[source.rsproxy]\n\
registry = "https://rsproxy.cn/crates.io-index"\n\
[registries.rsproxy]\n\
index = "https://rsproxy.cn/crates.io-index"\n\
[net]\n\
git-fetch-with-cli = true'\
    > /usr/local/cargo/config

RUN #cat /usr/local/cargo/config
RUN export RUSTUP_DIST_SERVER="https://rsproxy.cn"
RUN export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

RUN #cargo install --path .

#CMD ["ci_light","--name","xxxx"]