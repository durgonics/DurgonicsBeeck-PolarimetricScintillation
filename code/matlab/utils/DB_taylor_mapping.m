function k = DB_taylor_mapping(ft, v_eff)
%DB_TAYLOR_MAPPING  Map temporal frequency to spatial wavenumber.
%
%   k = DB_taylor_mapping(ft, v_eff)
%
%   ft    : temporal frequency [Hz]
%   v_eff : effective scan speed [m/s]

    k = 2 * pi * ft ./ max(abs(v_eff), eps);
end
