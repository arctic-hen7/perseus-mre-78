FROM rnestler/archlinux-rust:1.56.1

RUN pacman --noconfirm -Sy lsb-release base-devel
RUN rustup target add wasm32-unknown-unknown
RUN cargo install wasm-pack
RUN cargo install perseus-cli --version "0.3.0-beta.17"
WORKDIR /app
COPY . .
ENV HOST=0.0.0.0

ENTRYPOINT ["/bin/sh"]
