import numpy as np
import matplotlib.pyplot as plt

from db_formalism.phase_screen import generate_phase_screen

def main():
    f = np.array([1.57542e9, 1.22760e9, 1.17645e9])
    nf = len(f)

    dt = 0.1
    t  = np.arange(0, 600 + dt, dt)
    nx = t.size

    Ne0  = 5e11
    Bpar = 50e-6
    K    = 2.3648e4

    phi = generate_phase_screen(nx, dt, slope=11.0/3.0)
    Ne_t = Ne0 * (1 + 0.2 * phi)

    psi = np.zeros((nf, nx))
    for i in range(nf):
        psi[i, :] = (K / f[i]**2) * Ne_t * Bpar * 1e3

    win_sec  = 20
    win_samp = int(round(win_sec / dt))

    def movvar(x, w):
        if w <= 1:
            return np.zeros_like(x)
        kernel = np.ones(w)/w
        mean = np.convolve(x, kernel, mode="same")
        mean2 = np.convolve(x**2, kernel, mode="same")
        return np.maximum(mean2 - mean**2, 0.0)

    varpsi = np.zeros_like(psi)
    for i in range(nf):
        varpsi[i, :] = movvar(psi[i, :], win_samp)

    varpsi_norm = varpsi * (f[:, None]**4)

    plt.figure(figsize=(8, 6))
    plt.subplot(2, 1, 1)
    for i in range(nf):
        plt.plot(t, psi[i, :], label=f"L{i+1}")
    plt.xlabel("Time [s]")
    plt.ylabel("psi [rad]")
    plt.legend()
    plt.title("Synthetic Faraday rotation psi(t)")

    plt.subplot(2, 1, 2)
    for i in range(nf):
        plt.plot(t, varpsi_norm[i, :], label=f"L{i+1}")
    plt.xlabel("Time [s]")
    plt.ylabel("Var[psi] * f^4")
    plt.legend()
    plt.title("Frequency-normalized Var[psi] f^4")
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
