# MRE: Perseus Issue #78

This is a miimum reproducible example for [Perseus](https://github.com/arctic-hen7/perseus) issue [#78](https://github.com/arctic-hen7/perseus/issues/78), which pertains to an issue that only occurs on Arch Linux. For that reason, this repository contains a `Dockerfile` and a `docker-compose.yml` for creating an Arch environment in which the issue can be replicated.

## Resolution

This issue was resolved by downgrading `wasm-pack` to v0.9.1. The latest version includes a bug described [here](https://github.com/rustwasm/wasm-pack/issues/823) that causes a segmentation fault on Arch-based systems (due to an OpenSSL issue). The `Dockerfile` for this repository now includes the downgraded version of `wasm-pack`.

## Usage

### Prerequisites

You'll need to have these installed before working with this repo.

- `wasm-pack` (`cargo install wasm-pack`)
- `perseus-cli` (`cargo install perseus-cli --version "0.3.0-beta.17"`)
- `bonnie` (`cargo install bonnie`)
- Docker and Docker Compose

### Development

Once you have those prerequisites installed, clone this repository to your local machine and run `bonnie sh` in the created folder. That should build the Docker image, and you should then get a shell (Bash) into the container, from which you'll be able to run commands like `perseus serve` to investigate and demonstrate this issue.

If you're running on Arch Linux already, you don't need to run `bonnie sh`, you can run such commands directly in the directory.

## Issue Description

Currently, this issue is reported to include a failure of `perseus serve` without an error message (replicable in this repository). This can be mitigated by running `perseus build` followed by `perseus serve --no-build`, and this will host the example app correctly. The issue is also reported to include a console error in the browser, though I can't replicate this in this repository yet.

## License

See [`LICENSE`](./LICENSE).
