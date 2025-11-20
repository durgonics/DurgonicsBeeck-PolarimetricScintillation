% synthetic_varpsi_collapse.m
% Synthetic demonstration of Var[psi] and Var[psi]*f^4 collapse
clear; close all;

% Frequencies (Hz) for L1/L2/L5-like bands
f = [1.57542e9, 1.22760e9, 1.17645e9];
nf = numel(f);

% Time axis and effective scan velocity
dt   = 0.1;
t    = 0:dt:600;                     % 10 minutes

Ne0  = 5e11;                         % background Ne (m^-3)
Bpar = 50e-6;                        % 50 microtesla

% Faraday constant K (same as in manuscript appendix)
K = 2.3648e4;

nx = numel(t);

% Synthetic 1-D Kolmogorov-like irregularity field
phi = DB_generate_phase_screen(nx, dt, 11/3);
Ne_t = Ne0 * (1 + 0.2 * phi(:).');   % 20% fluctuation

psi = zeros(nf, nx);

for i = 1:nf
    psi(i,:) = (K / f(i)^2) * Ne_t * Bpar * 1e3;  % effective path length 1 km
end

% Sliding-window variance
win_sec  = 20;
win_samp = round(win_sec / dt);
varpsi   = zeros(nf, nx);

for i = 1:nf
    varpsi(i,:) = movvar(psi(i,:), win_samp);
end

varpsi_norm = varpsi .* (f(:).^4);

figure;
subplot(2,1,1);
plot(t, psi);
xlabel('Time [s]');
ylabel('\psi [rad]');
legend('L1','L2','L5','Location','best');
title('Synthetic Faraday rotation \psi(t)');

subplot(2,1,2);
plot(t, varpsi_norm);
xlabel('Time [s]');
ylabel('Var[\psi]\cdot f^4');
legend('L1','L2','L5','Location','best');
title('Frequency-normalized Var[\psi]f^4 (collapse diagnostic)');
grid on;
