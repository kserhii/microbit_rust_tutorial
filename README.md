# MicroBit on Rust

## Documentation

* https://docs.rust-embedded.org/discovery/microbit/

## Setup

### libs

``` console
sudo apt-get install \
  gdb-multiarch \
  minicom
```

### udev rules

``` console
sudo cat <<EOF >>/etc/udev/rules.d/99-microbit.rules
# CMSIS-DAP for microbit
SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", ATTR{idProduct}=="0204", MODE:="666"
EOF
```

Reload udev rules

``` console
sudo udevadm control --reload-rules
```

### Rust libs

``` console
rustup component add llvm-tools-preview
rustup target add thumbv7m-none-eabi
cargo install cargo-binutils
cargo install probe-rs --features cli
cargo install flip-link
```

## Verify permissions

Connect micro:bit board to USB cabel and check for USB device

``` console
lsusb | grep -i "NXP ARM mbed"
Bus 001 Device 065: ID 0d28:0204 NXP ARM mbed
```

Check device permissions

``` console
$ ls -l /dev/bus/usb/001/065
crw-rw-rw-. 1 root root 189, 64 Sep  5 14:27 /dev/bus/usb/001/065
```
