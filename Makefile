APP = rust_tutorial
CHIP = nrf52833_xxAA

build:
	cargo build

build-release:
	cargo build --release

flash:
	cargo flash --chip ${CHIP}

deploy: build flash

run:
	cargo run

run-relese:
	cargo run --release

clean:
	cargo clean

info-bin:
	cargo readobj --bin ${APP} -- --file-headers

info-size:
	cargo size --bin ${APP} --release -- -A
