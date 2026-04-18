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

| No. | Function Name | Dimension | Search Range | Mathematical Expression | Global Optimum |
|:----:|:--------------|:---------|:-------------|:------------------------|:---------------|
| F1 | Sphere | n | [-100, 100] | $f(x) = \sum_{i=1}^n x_i^2$ | 0 |
| F2 | Schwefel 2.22 | n | [-10, 10] | $f(x) = \sum_{i=1}^n \|x_i\| + \prod_{i=1}^n \|x_i\|$ | 0 |
| F3 | Schwefel 1.2 | n | [-100, 100] | $f(x) = \sum_{i=1}^n \left( \sum_{j=1}^i x_j \right)^2$ | 0 |
| F4 | Schwefel 2.21 | n | [-100, 100] | $f(x) = \max_{i} \|x_i\|$ | 0 |
| F5 | Rosenbrock | n | [-30, 30] | $f(x) = \sum_{i=1}^{n-1} \left[ 100(x_{i+1}-x_i^2)^2 + (x_i-1)^2 \right]$ | 0 |
| F6 | Step | n | [-100, 100] | $f(x) = \sum_{i=1}^n (\lfloor x_i + 0.5 \rfloor)^2$ | 0 |
| F7 | Quartic | n | [-1.28, 1.28] | $f(x) = \sum_{i=1}^n i x_i^4 + \text{rand}(0,1)$ | 0 |

---

## 3. Multimodal Functions (F8–F13)
Used to evaluate **global search ability and the ability to avoid local optima**.

| No. | Function Name | Dimension | Search Range | Mathematical Expression | Global Optimum |
|:----:|:--------------|:---------|:-------------|:------------------------|:---------------|
| F8 | Schwefel 2.26 | n | [-500, 500] | $f(x) = -\sum_{i=1}^n x_i \sin(\sqrt{\|x_i\|})$ | -418.9829 × n |
| F9 | Rastrigin | n | [-5.12, 5.12] | $f(x) = \sum_{i=1}^n [x_i^2 - 10\cos(2\pi x_i) + 10]$ | 0 |
| F10 | Ackley | n | [-32, 32] | $f(x) = -20\exp\left(-0.2\sqrt{\frac{1}{n}\sum_{i=1}^n x_i^2}\right) - \exp\left(\frac{1}{n}\sum_{i=1}^n \cos(2\pi x_i)\right) + 20 + e$ | 0 |
| F11 | Griewank | n | [-600, 600] | $f(x) = \frac{1}{4000}\sum_{i=1}^n x_i^2 - \prod_{i=1}^n \cos\left(\frac{x_i}{\sqrt{i}}\right) + 1$ | 0 |
| F12 | Penalized 1 | n | [-50, 50] | $f(x) = \frac{\pi}{n} \left[ 10\sin^2(\pi y_1) + \sum_{i=1}^{n-1} (y_i-1)^2[1+10\sin^2(\pi y_{i+1})] + (y_n-1)^2 \right] + \sum_{i=1}^n u(x_i,10,100,4)$  
$y_i = 1 + \frac{x_i+1}{4}$ | 0 |
| F13 | Penalized 2 | n | [-50, 50] | $f(x) = 0.1 \left[ \sin^2(3\pi x_1) + \sum_{i=1}^{n-1} (x_i-1)^2[1+\sin^2(3\pi x_{i+1})] + (x_n-1)^2[1+\sin^2(2\pi x_n)] \right] + \sum_{i=1}^n u(x_i,5,100,4)$ | 0 |

---

## 4. Fixed-Dimensional Functions (F14–F16)
Low-dimensional, complex problems used to evaluate **algorithm stability and accuracy on small-scale optimization tasks**.

| No. | Function Name | Dimension | Search Range | Mathematical Expression | Global Optimum |
|:----:|:--------------|:---------|:-------------|:------------------------|:---------------|
| F14 | Shekel's Foxholes | 2 | [-65.536, 65.536] | $f(x) = \left( \frac{1}{500} + \sum_{j=1}^{25} \frac{1}{j+\sum_{i=1}^2 (x_i-a_{ij})^6} \right)^{-1}$ | 0.998004 |
| F15 | Kowalik | 4 | [-5, 5] | $f(x) = \sum_{i=1}^{11} \left[ a_i - \frac{x_1(b_i^2+b_i x_2)}{b_i^2+b_i x_3+x_4} \right]^2$ | 0.0003075 |
| F16 | Hartman 3D | 3 | [0, 1] | $f(x) = -\sum_{i=1}^4 c_i \exp\left( -\sum_{j=1}^3 a_{ij}(x_j-p_{ij})^2 \right)$ | -3.86278 |

---

## 5. Usage in the Paper
These 16 benchmark functions are used in the paper to compare the performance of the proposed AWOASA algorithm with other metaheuristic algorithms, including PSO, WOA, WOA_DW, and WOA_SA.

- **Simulated benchmark data**: Function values are computed during algorithm runs.
- **Real-world data**: The field-collected magnetic target localization dataset is provided separately in the repository.

---

## 6. Repository Information
GitHub: https://github.com/maxiangd/AWOASA-Magnetic-Target-Positioning  
License: MIT License
