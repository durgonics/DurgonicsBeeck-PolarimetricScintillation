# Durgonics–Beeck Polarimetric GNSS Scintillation Formalism

Reference implementation and synthetic experiments for the
Durgonics–Beeck (DB) polarimetric GNSS scintillation formalism:

- Jones + Stokes + tensor-inspired description of L-band GNSS propagation
- Faraday-based retrieval of an electron-density–weighted line-of-sight field ⟨B\_∥⟩\_{Ne}
- Polarization scintillation index S\_pol = sqrt(Var[ψ])
- Var[ψ] f⁴ frequency–geometry collapse diagnostic
- Schematic limb-to-disc (L2D) scintillation mapping

This repository provides:

- MATLAB code for synthetic experiments and operators
- A small Python package (`db_formalism`) for analysis and prototyping
- Documentation and figures that accompany the manuscript:
  “Modeling L-band GNSS Signal Scintillation and Polarization Evolution
  Through the Ionosphere Using Jones and Stokes Formalisms”

> The manuscript is framed as a first demonstration concept, not an
> operational product. The code here mirrors that philosophy.

---

## Repository layout

- `code/matlab/`: Reference MATLAB implementations
- `code/python/`: Python package (`db_formalism`) and examples
- `code/tests/`: Basic tests (Python, using `pytest`)
- `docs/`: Overview, quick start, and API notes
- `figures/`: TikZ schematic(s) for geometry and inversion
- `examples/`: Simple run scripts and a placeholder for sample data

---

## Quick start (MATLAB)

```matlab
cd code/matlab

% Var[psi] f^4 collapse demo
synthetic_varpsi_collapse

% L2D mapping demo
synthetic_L2D_demo
