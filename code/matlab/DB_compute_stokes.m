function st = DB_compute_stokes(E_R, E_L, win)
%DB_COMPUTE_STOKES  Convenience wrapper to get Stokes and psi from RHCP/LHCP.
%
%   st = DB_compute_stokes(E_R, E_L, win)
%
%   Inputs:
%       E_R, E_L : complex baseband time series (same length)
%       win      : window length for moving average (samples)
%
%   Output struct st:
%       .S0, .S1, .S2, .S3 : Stokes parameters
%       .psi               : Faraday angle (orientation)
%       .chi               : ellipticity angle
%       .DoP               : degree of polarization

    if nargin < 3 || isempty(win)
        win = 50;
    end

    ops = DB_core_operators();

    % Circular to linear
    [E_x, E_y] = ops.jones_circ_to_lin(E_R, E_L);

    % Stokes
    [S0, S1, S2, S3] = ops.stokes_from_lin(E_x, E_y, win);

    % Orientation and ellipticity
    psi = ops.psi_from_stokes(S1, S2);
    chi = 0.5 * asin( max(min(S3 ./ max(S0, eps), 1), -1) );
    DoP = sqrt(S1.^2 + S2.^2 + S3.^2) ./ max(S0, eps);

    st.S0  = S0;
    st.S1  = S1;
    st.S2  = S2;
    st.S3  = S3;
    st.psi = psi;
    st.chi = chi;
    st.DoP = DoP;
end
