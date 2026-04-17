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

3. Repository Structure & File Description
   
This repository is organized into modular, non-compacted files (no .zip/.rar/.7z archives) for full transparency and reusability. All code comments are written in English.

Folder/File	Description
/AWOASA	Core implementation of the proposed AWOASA (Adaptive Weighted Whale Optimization Algorithm with Simulated Annealing)
/AWOASA_and_AWOASA_NoEq13	AWOASA algorithm with ablation variant (removal of random hunting mechanism) for sensitivity analysis
/AWOASA_dynamic_tracking_detection	Dynamic moving magnetic target tracking implementation of AWOASA
/WOA	Standard Whale Optimization Algorithm (baseline for comparison)
/WOA_DW	WOA with only dynamic weighting strategy (ablation study variant)
/WOA_SA	WOA with only simulated annealing mechanism (ablation study variant)
/CWOA, /LWOA, /PSO, /GWO, /HHO	State-of-the-art comparison algorithms used in the paper
/Gaussian_White_Noise	Code for adding Gaussian white noise to simulate real magnetic measurement environments
/Multi-Source_Interference_Mode	Code for multi-source electromagnetic interference robustness test
README.md	This documentation file
.gitignore	Standard git ignore file for MATLAB project temporary files
