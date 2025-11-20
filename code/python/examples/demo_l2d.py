import numpy as np
import matplotlib.pyplot as plt

def main():
    S4_L = 0.4
    Edeg = np.linspace(5, 80, 200)
    E    = np.deg2rad(Edeg)

    lambda_D = 0.19
    lambda_L = 0.19
    A_D = 1.0
    A_L = 1.0

    dp_over_dl = np.sin(E)
    Hpsi       = 0.8 + 0.2 * np.cos(E)
    Ne_ratio   = np.ones_like(E)
    L_over_H   = np.ones_like(E)

    G = (lambda_D/lambda_L)**2 * (A_D/A_L) * dp_over_dl * \
        Hpsi * Ne_ratio**2 * np.sqrt(L_over_H)

    S4_D = S4_L * G

    plt.figure(figsize=(6,4))
    plt.plot(Edeg, S4_D)
    plt.xlabel("Elevation angle E [deg]")
    plt.ylabel("S4^(D)")
    plt.title("Synthetic L2D mapping S4^(D)(E) from S4^(L)")
    plt.grid(True)
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
