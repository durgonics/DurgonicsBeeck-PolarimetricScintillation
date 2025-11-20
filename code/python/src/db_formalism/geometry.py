import numpy as np

def B_parallel_and_costh(Bvec, s_hat):
    """
    Project B onto ray direction.

    Parameters
    ----------
    Bvec : array_like, shape (..., 3)
        Magnetic field vectors [T].
    s_hat : array_like, shape (..., 3)
        Ray direction unit vectors.

    Returns
    -------
    Bpar : np.ndarray
        Line-of-sight component [T].
    costh : np.ndarray
        cos(theta) = (B · s_hat) / |B|.
    """
    Bvec = np.asarray(Bvec, dtype=float)
    s_hat = np.asarray(s_hat, dtype=float)

    dotBs = np.sum(Bvec * s_hat, axis=-1)
    Bnorm = np.linalg.norm(Bvec, axis=-1)
    Bnorm = np.maximum(Bnorm, np.finfo(float).eps)

    Bpar  = dotBs
    costh = dotBs / Bnorm
    return Bpar, costh
