function [t, conc] = simulate_decay(C0, t_half, t_end, dt)
% SIMULATE_DECAY Computes first-order exponential decay over time.
    arguments
        C0 (1,1) double {mustBeNonnegative}
        t_half (1,1) double {mustBePositive}
        t_end (1,1) double {mustBeNonnegative}
        dt (1,1) double {mustBePositive} = 1
    end
    t = 0:dt:t_end;
    conc = C0 .* (0.5 .^ (t ./ t_half));
end
