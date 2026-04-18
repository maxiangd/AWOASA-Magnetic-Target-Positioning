# 16 Standard Benchmark Functions Dataset  
For Optimization Performance Evaluation of the AWOASA Algorithm

---

## 1. Overview

This dataset contains 16 widely used benchmark functions for evaluating the performance of metaheuristic optimization algorithms. The functions are divided into three categories: unimodal, multimodal, and fixed-dimensional functions, to test the algorithm’s convergence speed, global search capability, and stability.

- **Category 1**: Unimodal Functions (F1–F7)
- **Category 2**: Multimodal Functions (F8–F13)
- **Category 3**: Fixed-Dimensional Functions (F14–F16)

---

## 2. Unimodal Functions (F1–F7)
Used to evaluate **convergence speed and local search ability**.

| No. | Function Name | Search Range | Global Optimum |
|:----:|:--------------|:-------------|:---------------|
| F1 | Sphere | [-100, 100] | \(f(0,0,...,0) = 0\) |
| F2 | Schwefel 2.22 | [-10, 10] | \(f(0,0,...,0) = 0\) |
| F3 | Schwefel 1.2 | [-100, 100] | \(f(0,0,...,0) = 0\) |
| F4 | Schwefel 2.21 | [-100, 100] | \(f(0,0,...,0) = 0\) |
| F5 | Rosenbrock | [-30, 30] | \(f(1,1,...,1) = 0\) |
| F6 | Step | [-100, 100] | \(f(0,0,...,0) = 0\) |
| F7 | Quartic | [-1.28, 1.28] | \(f(0,0,...,0) = 0\) |

---

## 3. Multimodal Functions (F8–F13)
Used to evaluate **global search ability and the ability to avoid local optima**.

| No. | Function Name | Search Range | Global Optimum |
|:----:|:--------------|:-------------|:---------------|
| F8 | Schwefel 2.26 | [-500, 500] | \(f(420.9687,...,420.9687) \approx -418.9829n\) |
| F9 | Rastrigin | [-5.12, 5.12] | \(f(0,0,...,0) = 0\) |
| F10 | Ackley | [-32, 32] | \(f(0,0,...,0) = 0\) |
| F11 | Griewank | [-600, 600] | \(f(0,0,...,0) = 0\) |
| F12 | Penalized 1 | [-50, 50] | \(f(-1,-1,...,-1) = 0\) |
| F13 | Penalized 2 | [-50, 50] | \(f(1,1,...,1) = 0\) |

---

## 4. Fixed-Dimensional Functions (F14–F16)
Low-dimensional, complex problems used to evaluate **algorithm stability and accuracy on small-scale optimization tasks**.

| No. | Function Name | Search Range | Dimension | Global Optimum |
|:----:|:--------------|:-------------|:---------|:---------------|
| F14 | Shekel's Foxholes | [-65.536, 65.536] | 2 | \(f(-32,-32) \approx 0.998004\) |
| F15 | Kowalik | [-5, 5] | 4 | \(f(0.1928,0.1908,0.1231,0.1358) \approx 0.0003075\) |
| F16 | Hartman 3D | [0, 1] | 3 | \(f(0.1140,0.5566,0.8525) \approx -3.86278\) |

---

## 5. Usage in the Paper

These 16 benchmark functions are used in the paper to compare the performance of the proposed AWOASA algorithm with other metaheuristic algorithms, including PSO, WOA, WOA_DW, and WOA_SA.

- **Simulated benchmark data**: Function values are computed during algorithm runs.
- **Real-world data**: The field-collected magnetic target localization dataset is provided separately in the repository.

---

## 6. Repository Information

GitHub: https://github.com/maxiangd/AWOASA-Magnetic-Target-Positioning  
License: MIT License
