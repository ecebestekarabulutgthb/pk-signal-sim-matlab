# Pharmacokinetic Signal Simulation & Filtering (MATLAB)

A modular MATLAB simulation modeling first-order pharmacokinetic drug elimination, zero-mean Gaussian sensor noise injection, and causal moving average filtering, evaluated quantitatively via Root Mean Square Error (RMSE).

## Overview

In biomedical and signal-processing applications, measured concentration profiles are corrupted by sensor noise. This project simulates first-order concentration decay, injects reproducible Gaussian noise (`rng(42)`), smooths the signal using a causal moving average filter, computes raw vs. filtered RMSE, and exports a comparison figure.

## Project Structure

pk-signal-sim-matlab/
├── main_simulation.m
├── functions/
│   ├── simulate_decay.m
│   ├── add_sensor_noise.m
│   └── moving_avg.m
└── outputs/
    └── noisy_vs_filtered.png

## Modules

- `main_simulation.m`: Resolves project paths, runs the simulation and filtering pipeline, reports RMSE, and saves `outputs/noisy_vs_filtered.png`.
- `functions/simulate_decay.m`: Computes first-order exponential decay over time for given `C0`, `t_half`, `t_end`, and `dt`.
- `functions/add_sensor_noise.m`: Adds zero-mean Gaussian measurement noise with configurable `noise_std`.
- `functions/moving_avg.m`: Smooths a 1D signal using a causal moving average filter of length `window_size`.

## Usage

1. Set MATLAB's Current Folder to `pk-signal-sim-matlab`.
2. Run the simulation from the Command Window:

main_simulation

3. Review the RMSE output in the Command Window and inspect `outputs/noisy_vs_filtered.png`.

## Results

Running `main_simulation` with baseline parameters (`C0 = 100`, `t_half = 6` hr, `t_end = 24` hr, `dt = 0.5` hr, `noise_std = 3`, `window_size = 5`) exports `outputs/noisy_vs_filtered.png` comparing noisy sensor readings, ideal first-order decay, and the filtered signal.
