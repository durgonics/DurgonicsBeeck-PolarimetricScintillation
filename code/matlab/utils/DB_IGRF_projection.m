function [Bpar, costh] = DB_IGRF_projection(Bvec, s_hat)
%DB_IGRF_PROJECTION  Project B onto ray direction.
%
%   [Bpar, costh] = DB_IGRF_projection(Bvec, s_hat)
%
%   Bvec : [3 x N] geomagnetic field vectors [T]
%   s_hat: [3 x N] ray-direction unit vectors
%
%   Returns:
%       Bpar  : line-of-sight magnetic field component [T]
%       costh : cos(theta) = (B · s_hat) / |B|

    Bnorm = sqrt(sum(Bvec.^2, 1));
    dotBs = sum(Bvec .* s_hat, 1);

    Bpar  = dotBs;
    costh = dotBs ./ max(Bnorm, eps);
end
