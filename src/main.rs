#![no_std]
#![no_main]
#![deny(unsafe_code)]

use embassy_executor::Spawner;
use embassy_nrf::gpio::{Level, Output, OutputDrive};
use embassy_time::Timer;
use {defmt_rtt as _, panic_probe as _};

#[embassy_executor::main]
async fn main(_spawner: Spawner) {
    let p = embassy_nrf::init(Default::default());
    let mut row1 = Output::new(p.P0_22, Level::Low, OutputDrive::Standard);
    let mut col1 = Output::new(p.P0_28, Level::Low, OutputDrive::Standard);

    col1.set_low();

    loop {
        row1.set_high();
        Timer::after_millis(300).await;
        row1.set_low();
        Timer::after_millis(300).await;
    }
}
