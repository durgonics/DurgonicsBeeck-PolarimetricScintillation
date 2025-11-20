import numpy as np
from db_formalism.faraday import Bpar_from_psi_TEC

def test_faraday_scaling():
    psi = np.array([0.1])
    TEC = np.array([1e16])
    f1  = 1.5e9
    f2  = 2.0e9

    B1 = Bpar_from_psi_TEC(psi, TEC, f1)
    B2 = Bpar_from_psi_TEC(psi, TEC, f2)

    assert B2 > B1
