# AWOASA-Magnetic-Target-Positioning
Enhanced WOA with dynamic weight & simulated annealing for high-precision magnetic target localization and geophysical inversion.
This repository contains the official implementation code, benchmark test functions, and real-world magnetic target datasets for the paper A dual-strategy enhanced metaheuristic for nonlinear geophysical inversion: Application to magnetic target positioning, submitted to Computers & Geosciences.
1. License
   
This project is distributed under the MIT License, the full license text is available in the LICENSE file in this repository.

2. Dependencies & Computational Requirements

   2.1 Software Dependencies

      MATLAB R2024a or later versions
      No additional third-party toolboxes are required; all code uses MATLAB built-in functions only

   2.2 Minimum Computational Requirements

      CPU: Intel Core i5 12th Gen (12600KF) @ 3.70 GHz or equivalent AMD processor
   
      RAM: ≥ 16.0 GB

      Operating System: Windows 10/11 or Linux/macOS compatible with MATLAB R2024a

4. Repository Structure & File Description
   
| Folder/File | Description |
|-------------|-------------|
| `/AWOASA` | Core implementation of the proposed AWOASA algorithm<br>Adaptive Weighted WOA with Dynamic Weighting & Simulated Annealing |
| `/WOA` | Standard Whale Optimization Algorithm (baseline for comparison) |
| `/WOA_DW` | WOA variant with dynamic weighting only (for ablation study) |
| `/WOA_SA` | WOA variant with simulated annealing only (for ablation study) |
| `/CWOA`, `/LWOA`, `/PSO`, `/GWO`, `/HHO` | State-of-the-art comparison algorithms used in the paper |
| `/Gaussian_White_Noise` | Code for simulating real magnetic measurement environments with Gaussian white noise |
| `/Multi-Source_Interference_Mode` | Code for robustness test under multi-source electromagnetic interference |
