clc; clear; close all;

projectDir = fileparts(mfilename('fullpath'));
functionsDir = fullfile(projectDir, 'functions');
outDir = fullfile(projectDir, 'outputs');

if exist(functionsDir, 'dir'), addpath(functionsDir); end
if ~exist(outDir, 'dir'), mkdir(outDir); end

C0 = 100;
t_half = 6;
t_end = 24;
dt = 0.5;

[t, conc_clean] = simulate_decay(C0, t_half, t_end, dt);

rng(42);
noisy_conc = add_sensor_noise(conc_clean, 3);
filtered_conc = moving_avg(noisy_conc, 5);

rmse_raw = sqrt(mean((noisy_conc - conc_clean).^2));
rmse_filtered = sqrt(mean((filtered_conc - conc_clean).^2));

fprintf('Raw Signal RMSE      : %.4f ug/mL\n', rmse_raw);
fprintf('Filtered Signal RMSE : %.4f ug/mL\n', rmse_filtered);

fig = figure('Visible', 'off');
plot(t, noisy_conc, 'Color', [0.65 0.65 0.65], 'LineWidth', 1.2); hold on;
plot(t, conc_clean, 'b--', 'LineWidth', 1.8);
plot(t, filtered_conc, 'r-', 'LineWidth', 2.2);
hold off; grid on;
xlabel('Time (hours)');
ylabel('Concentration (\mug/mL)');
title(sprintf('Pharmacokinetic Signal (C_0 = %.1f, t_{1/2} = %.1f hr)', C0, t_half));
legend('Noisy Sensor', 'Ideal Decay', 'Moving Avg Filter', 'Location', 'northeast');

outFile = fullfile(outDir, 'noisy_vs_filtered.png');
try, exportgraphics(fig, outFile, 'Resolution', 200); catch, saveas(fig, outFile); end
close(fig);
fprintf('Saved plot to: %s\n', outFile);
