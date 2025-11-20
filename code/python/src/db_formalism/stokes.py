import numpy as np

def stokes_from_lin(E_x: np.ndarray, E_y: np.ndarray, win: int = 50):
    """
    Short-time Stokes parameters from linear components.

    Uses a simple moving average over 'win' samples.
    """
    P_x  = np.abs(E_x)**2
    P_y  = np.abs(E_y)**2
    C_xy = E_x * np.conj(E_y)

    def movmean(x, w):
        if w <= 1:
            return x
        kernel = np.ones(w) / w
        return np.convolve(x, kernel, mode="same")

    S0 = movmean(P_x + P_y, win)
    S1 = movmean(P_x - P_y, win)
    S2 = 2 * np.real(movmean(C_xy, win))
    S3 = 2 * np.imag(movmean(C_xy, win))

    return S0, S1, S2, S3


def psi_from_stokes(S1: np.ndarray, S2: np.ndarray):
    """
    Polarization orientation (Faraday) angle psi from S1, S2.
    """
    return 0.5 * np.arctan2(S2, S1)


def dop_from_stokes(S0, S1, S2, S3):
    """
    Degree of polarization from Stokes parameters.
    """
    num = np.sqrt(S1**2 + S2**2 + S3**2)
    return num / np.maximum(S0, np.finfo(float).eps)
