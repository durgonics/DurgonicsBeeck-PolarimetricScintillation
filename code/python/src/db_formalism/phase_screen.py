import numpy as np

def generate_phase_screen(n: int, dt: float, slope: float = 11.0/3.0):
    """
    1-D Kolmogorov-like random series.

    Parameters
    ----------
    n : int
        Number of samples.
    dt : float
        Sampling interval (seconds).
    slope : float
        Spectral slope (default 11/3).

    Returns
    -------
    phi : np.ndarray
        Real-valued normalized series.
    """
    dk = 1.0 / (n * dt)
    k  = (np.arange(-n//2, n//2) * dk)

    Phi = np.abs(k)**(-slope)
    Phi[k == 0] = 0.0

    phase_rand = 2 * np.pi * np.random.rand(k.size)
    spec = np.sqrt(Phi) * np.exp(1j * phase_rand)

    x = np.fft.ifft(np.fft.ifftshift(spec))
    x = np.real(x)
    x /= np.max(np.abs(x)) + 1e-12

    return x[:n]
