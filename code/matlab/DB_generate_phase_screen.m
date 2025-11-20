function phi = DB_generate_phase_screen(n, dt, slope)
%DB_GENERATE_PHASE_SCREEN  1-D Kolmogorov-like phase screen.
%
%   phi = DB_generate_phase_screen(n, dt, slope)
%
%   Inputs:
%       n      : number of samples
%       dt     : sampling interval (seconds)
%       slope  : spectral slope (e.g. 11/3 for Kolmogorov-like)
%
%   Output:
%       phi    : real-valued phase-like fluctuation series (length n)

    if nargin < 3 || isempty(slope)
        slope = 11/3;
    end

    dk = 1 / (n * dt);
    k  = (-n/2:n/2-1) * dk;

    Phi = abs(k).^(-slope);
    Phi(k == 0) = 0;

    phase_rand = 2 * pi * rand(size(k));
    spec = sqrt(Phi) .* exp(1j * phase_rand);

    x = real(ifft(ifftshift(spec)));
    x = x / max(abs(x));

    phi = x(1:n);
end
