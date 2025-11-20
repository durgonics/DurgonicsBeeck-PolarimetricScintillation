function H = DB_fresnel_filter(k_perp, z)
%DB_FRESNEL_FILTER  Simple Fresnel filter magnitude |H_F|^2.
%
%   H = DB_fresnel_filter(k_perp, z)
%
%   k_perp : transverse spatial frequency [1/m]
%   z      : propagation distance [m]
%
%   This is a schematic form for demonstrations, not a full propagation code.

    % Wavelength is factored out in demos; we just use a Gaussian-like filter.
    rF2 = abs(z);          % effective Fresnel scale^2 (arbitrary units)
    H   = exp(-(k_perp.^2) * rF2);
end
