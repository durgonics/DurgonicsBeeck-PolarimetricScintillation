% synthetic_L2D_demo.m
% Synthetic demonstration of L2D mapping S4^(D)(E)
clear; close all;

% Reference limb scintillation level
S4_L = 0.4;  % illustrative

Edeg = linspace(5, 80, 200);
E    = deg2rad(Edeg);

lambda_D = 0.19;
lambda_L = 0.19;
A_D      = 1.0;
A_L      = 1.0;

dp_over_dl = sin(E);
Hpsi       = 0.8 + 0.2*cos(E);
Ne_ratio   = ones(size(E));
L_over_H   = ones(size(E));

G = (lambda_D/lambda_L).^2 .* (A_D./A_L) .* dp_over_dl .* ...
    Hpsi .* Ne_ratio.^2 .* sqrt(L_over_H);

S4_D = S4_L .* G;

figure;
plot(Edeg, S4_D, 'LineWidth', 1.5);
xlabel('Elevation angle E [deg]');
ylabel('S_4^{(D)}');
title('Synthetic L2D mapping: S_4^{(D)}(E) from limb reference S_4^{(L)}');
grid on;
