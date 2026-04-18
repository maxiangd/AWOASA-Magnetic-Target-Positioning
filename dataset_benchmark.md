# 16 Standard Benchmark Functions Dataset  
For Optimization Performance Evaluation of the AWOASA Algorithm

---

## 1. Overview
This dataset contains 16 widely used benchmark functions for evaluating the performance of metaheuristic optimization algorithms. The functions are divided into three categories: unimodal, multimodal, and fixed-dimensional functions, to test the algorithm’s convergence speed, global search capability, and stability.

- **Category 1**: Unimodal Functions (F1–F7)
- **Category 2**: Multimodal Functions (F8–F12)
- **Category 3**: Fixed-Dimensional Functions (F13–F16)

---

## 2. Unimodal Functions (F1–F7)
Used to evaluate convergence speed and local search ability.

| No. | Dimension | Search Range | Mathematical Expression | Minimum |
|:----:|:---------|:-------------|:------------------------|:---------------|
| F1 | 30 | [-100, 100] | $f(x) = \sum_{i=1}^n x_i^2$ | 0 |
| F2 | 30 | [-10, 10] | $f(x) = \sum_{i=1}^n \|x_i\| + \prod_{i=1}^n \|x_i\|$ | 0 |
| F3 | 30 | [-100, 100] | $f(x) = \sum_{i=1}^n \left( \sum_{j=1}^i x_j \right)^2$ | 0 |
| F4 | 30 | [-100, 100] | $f(x) = \max_{1 \le i \le n} \|x_i\|$ | 0 |
| F5 | 30 | [-30, 30] | $f(x) = \sum_{i=1}^{n-1} \left[ 100(x_{i+1}-x_i^2)^2 + (x_i-1)^2 \right]$ | 0 |
| F6 | 30 | [-100, 100] | $f(x) = \sum_{i=1}^n (x_i + 0.5)^2$ | 0 |
| F7 | 30 | [-1.28, 1.28] | $f(x) = \sum_{i=1}^n \left( i x_i^4 + \text{rand}(0,1) \right)$ | 0 |

---

## 3. Multimodal Functions (F8–F12)
Used to evaluate global search ability and the ability to avoid local optima.

| No. | Dimension | Search Range | Mathematical Expression | Minimum |
|:----:|:---------|:-------------|:------------------------|:---------------|
| F8 | 30 | [-500, 500] | $f(x) = -\sum_{i=1}^n x_i \sin\left( \sqrt{\|x_i\|} \right)$ | $-418.9829 \times n$ |
| F9 | 30 | [-5.12, 5.12] | $f(x) = \sum_{i=1}^n \left[ x_i^2 - 10\cos(2\pi x_i)\right]$ | 0 |
| F10 | 30 | [-32, 32] | $f(x) = -20\exp\left(-0.2\sqrt{\frac{1}{n}\sum_{i=1}^n x_i^2}\right) - \exp\left(\frac{1}{n}\sum_{i=1}^n \cos(2\pi x_i)\right) + 20 + e$ | 0 |
| F11 | 30 | [-600, 600] | $f(x) = \frac{1}{4000}\sum_{i=1}^n x_i^2 - \prod_{i=1}^n \cos\left( \frac{x_i}{\sqrt{i}} \right) + 1$ | 0 |
| F12 | 30 | [-50, 50] | $f(x) = 0.1\left[ \sin^2(3\pi x_1) + \sum_{i=1}^{n-1} (x_i-1)^2\left(1+\sin^2(3\pi x_{i+1})\right) + (x_n-1)^2\left(1+\sin^2(2\pi x_n)\right) \right] + \sum_{i=1}^n u(x_i,5,100,4)$ | 0 |

---

## 4. Fixed-Dimensional Functions (F13–F16)
Low-dimensional, complex problems used to evaluate algorithm stability and accuracy.

| No. | Dimension | Search Range | Mathematical Expression | Minimum |
|:----:|:---------|:-------------|:------------------------|:---------------|
| F13 | 2 | [-65, 65] | $f(x) = \left( \frac{1}{500} + \sum_{j=1}^{25} \frac{1}{j+\sum_{i=1}^2 (x_i-a_{ij})^6} \right)^{-1}$ | 1 |
| F14 | 4 | [-5, 5] | $f(x) = \sum_{i=1}^{11} \left[ a_i - \frac{x_1(b_i^2+b_i x_2)}{b_i^2+b_i x_3+x_4} \right]^2$ | 0.00030 |
| F15 | 2 | [-5, 5] | $f(x) = 4x_1^2 - 2.1x_1^4 + \frac{1}{3}x_1^6 + x_1x_2 - 4x_2^2 + 4x_2^4$ | -1.0316 |
| F16 | 2 | [-5, 5] | $f(x) = \left( x_2 - \frac{5.1}{4\pi^2}x_1^2 + \frac{5}{\pi}x_1 - 6 \right)^2 + 10\left( 1-\frac{1}{8\pi} \right)\cos x_1 + 10$ | 0.398 |

---

## 5. Usage in the Paper
These 16 benchmark functions are used in the paper to compare the performance of the proposed AWOASA algorithm with other metaheuristic algorithms, such as PSO, WOA, WOA_DW, and WOA_SA.
