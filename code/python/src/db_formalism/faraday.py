import numpy as np

def Bpar_from_psi_TEC(psi, TEC, f):
    """
    Retrieve Ne-weighted B_parallel from psi and TEC.

    Parameters
    ----------
    psi : array_like
        Faraday rotation angle [rad].
    TEC : array_like
        Total electron content [m^-2].
    f : float
        Carrier frequency [Hz].

    Returns
    -------
    Bpar_eff : np.ndarray
        Electron-density–weighted line-of-sight field [T].
    """
    eps0 = 8.854187817e-12
    me   = 9.10938356e-31
    c    = 2.99792458e8
    e    = 1.602176634e-19

    Kinv = 8 * np.pi**2 * eps0 * me**2 * c / e**3

    psi = np.asarray(psi, dtype=float)
    TEC = np.asarray(TEC, dtype=float)

    TEC = np.maximum(TEC, np.finfo(float).eps)

    return Kinv * (f**2) * (psi / TEC)
