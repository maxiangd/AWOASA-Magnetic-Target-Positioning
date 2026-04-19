# Field Magnetic Target Localization Simulation Dataset
## For AWOASA Algorithm Practical Validation

---

## 1. Core Test Configuration
| Category | Details |
|:---------|:--------|
| **Location** | Harbin, China |
| **Geomagnetic Parameters** | Geomagnetic Inclination $I = 63^\circ$ (rad: $63/180 \times \pi$)<br>Geomagnetic Declination $D = -10^\circ$ (rad: $-10/180 \times \pi$)<br>Permeability of Free Space $\mu_0 = 4\pi \times 10^{-7} \, \text{H/m}$ |
| **Sensor Array** | 7-channel planar cross-shaped fluxgate magnetometer array<br>Array baseline length $d = 1 \, \text{m}$<br>Array coordinates (unit: m):<br>$[0,0,0], [-1,0,0], [1,0,0], [0,-1,0], [0,1,0], [0,1,1], [0,-1,1]$ |
| **Target Ground Truth** | True 3D position: $[-3, 17, -1] \, \text{m}$<br>True magnetic moment: $[435, 115, 780] \, \text{A·m}^2$ |
| **Inversion Dimension** | 6 dimensions: Target 3D coordinates ($x/y/z$) + Magnetic moment components ($M_x/M_y/M_z$) |
| **Interference Modes** | 1. Gaussian white noise (amplitude: 0.016)<br>2. Multi-source composite interference: 50Hz power line interference + random pulse interference |

---

## 2. Usage
This study uses a self-contained simulation testbed. All core configurations (including Harbin geomagnetic parameters, 7-channel sensor array layout, magnetic target ground truth, and multi-source interference models) are embedded as hard-coded logic in the `Fitness.m` objective function. No separate dataset files need to be downloaded or loaded. The standard workflow is as follows:
1. Integrate the `Fitness.m` objective function (with complete simulation configurations and ground truth data) into the main optimization process of metaheuristic algorithms such as AWOASA.
2. Use `Fitness.m` as the objective function to calculate the fitting error between the inversion results output by the algorithm iteration and the preset target ground truth.
3. Verify the anti-interference performance and robustness of the algorithm under different noise levels by adjusting the interference amplitude parameters in `Fitness.m`.
