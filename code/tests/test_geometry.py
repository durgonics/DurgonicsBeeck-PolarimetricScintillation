import numpy as np
from db_formalism.geometry import B_parallel_and_costh

def test_geometry_simple():
    Bvec = np.array([[0.0, 0.0, 50e-6]])
    s    = np.array([[0.0, 0.0, 1.0]])

    Bpar, costh = B_parallel_and_costh(Bvec, s)

    assert np.allclose(Bpar, 50e-6)
    assert np.allclose(costh, 1.0)
