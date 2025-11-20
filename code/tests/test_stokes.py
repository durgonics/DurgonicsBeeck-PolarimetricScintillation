import numpy as np
from db_formalism.jones import circ_to_lin
from db_formalism.stokes import stokes_from_lin, psi_from_stokes

def test_stokes_trivial():
    n = 1000
    E_R = np.ones(n, dtype=complex)
    E_L = np.zeros(n, dtype=complex)

    E_x, E_y = circ_to_lin(E_R, E_L)
    S0, S1, S2, S3 = stokes_from_lin(E_x, E_y, win=50)
    psi = psi_from_stokes(S1, S2)

    assert np.allclose(S0.mean(), 1.0, atol=1e-2)
    assert np.abs(psi.mean()) < 0.2
