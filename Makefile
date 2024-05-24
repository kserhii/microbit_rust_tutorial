APP = rust_tutorial
CHIP = nrf52833_xxAA

build:
	cargo build

flash:
	cargo flash --chip ${CHIP}

deploy:
	cargo embed

deploy-debug:
	cargo embed debug

clean:
	cargo clean

info-bin:
	cargo readobj --bin ${APP} -- --file-headers

info-size:
	cargo size --bin ${APP} --release -- -A
