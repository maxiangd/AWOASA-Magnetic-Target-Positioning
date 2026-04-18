# AWOASA-Magnetic-Target-Positioning
Enhanced WOA with dynamic weight & simulated annealing for high-precision magnetic target localization and geophysical inversion.

This repository contains the official implementation code, benchmark test functions, and real-world magnetic target datasets for the paper **A dual-strategy enhanced metaheuristic for nonlinear geophysical inversion: Application to magnetic target positioning**, submitted to *Computers & Geosciences*.

---

## 1. License
This project is distributed under the **MIT License**. The full license text is available in the `LICENSE` file in this repository.

---

## 2. Dependencies & Computational Requirements
### 2.1 Software Dependencies
- MATLAB R2024a or later versions
- No additional third-party toolboxes are required; all code uses MATLAB built-in functions only

### 2.2 Minimum Computational Requirements
- CPU: Intel Core i5 12th Gen (12600KF) @ 3.70 GHz or equivalent AMD processor
- RAM: ≥ 16.0 GB
- Operating System: Windows 10/11 or Linux/macOS compatible with MATLAB R2024a

---

## 3. Repository Structure & File Description
This repository is organized into modular, non-compacted files (no `.zip`/`.rar`/`.7z` archives) for full transparency and reusability.

| Folder/File | Description |
|-------------|-------------|
| `/AWOASA` | Core implementation of the proposed AWOASA (Adaptive Weighted Whale Optimization Algorithm with Simulated Annealing) |
| `/AWOASA_and_AWOASA_NoEq13` | AWOASA algorithm with ablation variant (removal of random hunting mechanism) for sensitivity analysis |
| `/AWOASA_dynamic_tracking_detection` | Dynamic moving magnetic target tracking implementation of AWOASA |
| `/WOA` | Standard Whale Optimization Algorithm (baseline for comparison) |
| `/WOA_DW` | WOA with only dynamic weighting strategy (ablation study variant) |
| `/WOA_SA` | WOA with only simulated annealing mechanism (ablation study variant) |
| `/CWOA`, `/LWOA`, `/PSO`, `/GWO`, `/HHO` | State-of-the-art comparison algorithms used in the paper |
| `/Gaussian_White_Noise` | Code for adding Gaussian white noise to simulate real magnetic measurement environments |
| `/Multi-Source_Interference_Mode` | Code for multi-source electromagnetic interference robustness test |
| `README.md` | This documentation file |
| `.gitignore` | Standard git ignore file for MATLAB project temporary files |

---

## 4. Installation & Basic Usage Instructions
### 4.1 Installation
1. Clone this repository to your local machine
2. Open MATLAB, and set the repository root folder as your MATLAB working directory.

### 4.2 Basic Usage
To run the core AWOASA algorithm for a custom optimization problem:
1. Define your objective function (fitness function) in a MATLAB `.m` file.
2. Set the algorithm parameters (population size, maximum iterations, search bounds) in the main script.
3. Run the AWOASA main function to get the optimal solution.

---

## 5. How to Reproduce Main Results in the Paper
### 5.1 Reproduce Benchmark Function Test Results
1. Navigate to the `/AWOASA` folder.
2. Open the script `main.m`.
3. Set the experimental parameters (consistent with the paper):
   - Population size `N = 30`
   - Maximum iterations `T_max = 500`
   - 50 independent runs for statistical significance
4. Run the script. The output includes:
   - Mean and standard deviation of fitness values for all 16 benchmark functions
   - Convergence curve plots

### 5.2 Reproduce Magnetic Target Positioning Results
1. Navigate to `/Gaussian_White_Noise` or `/Multi-Source_Interference_Mode`.
2. Open `WOA_main.m` or `AWOASA_main.m`.
3. The script automatically loads the real-world magnetic target dataset from Harbin field tests (included in the repository).
4. Set parameters:
   - Population size `N = 50`
   - Maximum iterations `T_max = 1000`
   - Search bounds for 6 target parameters (position: x/y/z; magnetic moment: Mx/My/Mz)
5. Run the script. The output includes:
   - Static positioning error of AWOASA vs. standard WOA
   - Probability distribution plots of estimated target parameters

### 5.3 Reproduce Ablation Study & Sensitivity Analysis
1. For ablation study: Run scripts in `/WOA_DW` and `/WOA_SA` with the same benchmark settings.
2. For sensitivity analysis: Run scripts in `/AWOASA_and_AWOASA_NoEq13` to test the random hunting mechanism and key parameters.

---

## 6. User Guide: Inputs, Outputs, Options & Expected Behaviour
### 6.1 Core Inputs
| Input Parameter | Description |
|----------------|-------------|
| N | Population size (number of search agents) |
| T_max | Maximum number of iterations |
| lb | Lower bound of the search space for each dimension |
| ub | Upper bound of the search space for each dimension |
| dim | Dimension of the optimization problem |
| fitness | Handle of the objective (fitness) function to be minimized |

### 6.2 Core Outputs
| Output Variable | Description | Expected Behaviour |
|----------------|-------------|---------------------|
| X_best | Optimal solution vector (minimizing the fitness function) | For benchmark functions, converges to the theoretical global optimum; for magnetic positioning, returns the 6 target parameters (x,y,z,Mx,My,Mz) |
| fitness_best | Fitness value of the optimal solution | Decreases monotonically as iterations increase, converging to a stable minimum |
| convergence_curve | Fitness value of the best solution at each iteration | For AWOASA, converges significantly faster than standard WOA and other comparison algorithms |

### 6.3 Optional Configurations
| Option | Description | Usage Scenario |
|--------|-------------|----------------|
| Adaptive initial temperature for SA | Set initial temperature as the difference between max and min initial fitness values | Default setting, optimal for most geophysical inversion problems |
| Fixed initial temperature for SA | Set fixed T=100 or T=1000 | Sensitivity analysis only |
| AWOASA-NoEq13 variant | Remove the random hunting mechanism | Ablation study of the exploration capability |
| Multi-source interference mode | Add 50Hz power line interference and motor impulsive transients | Robustness test for real-world electromagnetic environments |

---

## 7. Code Specification
1. All code in this repository is written in MATLAB, with **100% English comments** for full readability.
2. No compiled binaries, encrypted files, or single compacted archives (`.zip`/`.rar`/`.7z`) are included. All source code is fully visible and editable.

---

## 8. Contact
For questions about the code or paper, please contact:
- Author: Xiangdong Ma
- Email: xiangdongma_181@stu.qau.edu.cn
- Affiliation: College of Science and Information, Qingdao Agricultural University, Qingdao, China
