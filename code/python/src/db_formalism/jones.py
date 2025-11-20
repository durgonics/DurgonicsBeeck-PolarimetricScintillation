import numpy as np

def circ_to_lin(E_R: np.ndarray, E_L: np.ndarray):
    """
    Convert circular (R,L) complex baseband to linear (x,y) components.

    Parameters
    ----------
    E_R, E_L : np.ndarray
        Complex arrays of identical shape.

    Returns
    -------
    E_x, E_y : np.ndarray
        Linear components.
    """
    factor = 1.0 / np.sqrt(2.0)
    E_x = factor * (E_R + E_L)
    E_y = factor * (-1j * E_R + 1j * E_L)
    return E_x, E_y
