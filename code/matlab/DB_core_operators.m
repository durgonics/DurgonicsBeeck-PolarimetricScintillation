function ops = DB_core_operators()
%DB_CORE_OPERATORS  Core Jones/Stokes helper operators for DB formalism.
%
%   ops = DB_core_operators() returns a struct with function handles:
%       ops.jones_circ_to_lin(E_R, E_L)
%       ops.stokes_from_lin(E_x, E_y, win)
%       ops.psi_from_stokes(S1, S2)
%
%   This is kept minimal and pure; stateful or I/O logic lives elsewhere.

    ops.jones_circ_to_lin = @jones_circ_to_lin;
    ops.stokes_from_lin   = @stokes_from_lin;
    ops.psi_from_stokes   = @psi_from_stokes;
end

% --- Local functions -----------------------------------------------------

function [E_x, E_y] = jones_circ_to_lin(E_R, E_L)
% Transform from circular (R, L) to linear (x, y) basis.
% E_R, E_L: complex arrays (same size)
% E_x, E_y: complex arrays (same size)

    factor = 1/sqrt(2);
    E_x = factor * (E_R + E_L);
    E_y = factor * (-1j * E_R + 1j * E_L);
end

function [S0, S1, S2, S3] = stokes_from_lin(E_x, E_y, win)
% Compute short-time Stokes parameters from linear components.
%
% Inputs:
%   E_x, E_y : complex arrays (1D time series)
%   win      : window length (samples) for moving average
%
% Outputs:
%   S0, S1, S2, S3 : arrays of same size as input

    if nargin < 3 || isempty(win)
        win = 50;
    end

    P_x  = abs(E_x).^2;
    P_y  = abs(E_y).^2;
    C_xy = E_x .* conj(E_y);

    S0 = movmean(P_x + P_y, win);
    S1 = movmean(P_x - P_y, win);
    S2 = 2 * real(movmean(C_xy, win));
    S3 = 2 * imag(movmean(C_xy, win));
end

function psi = psi_from_stokes(S1, S2)
% Compute polarization orientation (Faraday) angle psi from S1, S2.

    psi = 0.5 * atan2(S2, S1);
end
