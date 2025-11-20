function Bpar_eff = DB_compute_faraday(psi, TEC, f)
%DB_COMPUTE_FARADAY  Retrieve Ne-weighted B_parallel from psi and TEC.
%
%   Bpar_eff = DB_compute_faraday(psi, TEC, f)
%
%   Inputs:
%       psi : Faraday rotation angle [rad] (vector or scalar)
%       TEC : total electron content [m^-2], same size as psi
%       f   : carrier frequency [Hz] (scalar)
%
%   Output:
%       Bpar_eff : Ne-weighted line-of-sight magnetic field [T]
%
%   Uses:
%       <B_parallel>_Ne = (8 pi^2 eps0 m_e^2 c / e^3) f^2 psi / TEC

    % Physical constants (SI)
    eps0 = 8.854187817e-12;
    me   = 9.10938356e-31;
    c    = 2.99792458e8;
    e    = 1.602176634e-19;

    Kinv = 8 * pi^2 * eps0 * me^2 * c / e^3;

    TEC = max(TEC, eps);  % avoid division by zero

    Bpar_eff = Kinv * (f.^2) .* (psi ./ TEC);
end
