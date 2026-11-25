function noisy_signal = add_sensor_noise(clean_signal, noise_std)
% ADD_SENSOR_NOISE Adds zero-mean Gaussian measurement noise.
    arguments
        clean_signal double
        noise_std (1,1) double {mustBeNonnegative} = 2
    end
    noisy_signal = clean_signal + noise_std .* randn(size(clean_signal));
end
