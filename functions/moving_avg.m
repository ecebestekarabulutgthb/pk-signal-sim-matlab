function filtered_signal = moving_avg(signal, window_size)
% MOVING_AVG Smooths a 1D signal using a causal moving average filter.
    arguments
        signal double
        window_size (1,1) double {mustBeInteger, mustBePositive} = 5
    end
    n = length(signal);
    filtered_signal = zeros(size(signal));
    for i = 1:n
        start_idx = max(1, i - window_size + 1);
        filtered_signal(i) = mean(signal(start_idx:i));
    end
end
