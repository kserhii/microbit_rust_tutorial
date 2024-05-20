APP = rust_tutorial

build:
	cargo build

deploy:
	cargo embed

clean:
	cargo clean

info-bin:
	cargo readobj --bin ${APP} -- --file-headers

info-size:
	cargo size --bin ${APP} --release -- -A
