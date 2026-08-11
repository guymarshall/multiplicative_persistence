#!/bin/bash

if ! command -v hyperfine >/dev/null 2>&1
then
    sudo apt install hyperfine -y
fi

cargo build --release
hyperfine --warmup 5 -n "Multiplicative Persistence" -r 50 'cargo run --release'