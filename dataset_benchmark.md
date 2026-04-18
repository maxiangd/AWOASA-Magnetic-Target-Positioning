# 16 Standard Benchmark Functions Dataset
For Optimization Performance Evaluation of the AWOASA Algorithm

---

## 1. Overview
This dataset includes 16 classic benchmark functions for metaheuristic algorithm testing.
- Category 1: Unimodal Functions (F1–F7)
- Category 2: Multimodal Functions (F8–F13)
- Category 3: Fixed-Dimensional Functions (F14–F16)

---

## 2. Unimodal Functions (F1–F7)
| No. | Name | Dimension | Range | Mathematical Expression | Optimum |
|---|---|---|---|---|---|
| F1 | Sphere | n | [-100,100] | f(x) = sum(xi^2, i=1 to n) | 0 |
| F2 | Schwefel 2.22 | n | [-10,10] | f(x) = sum(|xi|) + prod(|xi|) | 0 |
| F3 | Schwefel 1.2 | n | [-100,100] | f(x) = sum( (sum(xj,j=1 to i))^2, i=1 to n ) | 0 |
| F4 | Schwefel 2.21 | n | [-100,100] | f(x) = max(|xi|) | 0 |
| F5 | Rosenbrock | n | [-30,30] | f(x) = sum( 100*(xi+1-xi^2)^2 + (xi-1)^2, i=1 to n-1 ) | 0 |
| F6 | Step | n | [-100,100] | f(x) = sum( floor(xi+0.5)^2 ) | 0 |
| F7 | Quartic | n | [-1.28,1.28] | f(x) = sum( i*xi^4 ) + random(0,1) | 0 |

---

## 3. Multimodal Functions (F8–F13)
| No. | Name | Dimension | Range | Mathematical Expression | Optimum |
|---|---|---|---|---|---|
| F8 | Schwefel 2.26 | n | [-500,500] | f(x) = -sum( xi*sin(sqrt(|xi|)) ) | -418.9829*n |
| F9 | Rastrigin | n | [-5.12,5.12] | f(x) = sum( xi^2 -10cos(2πxi)+10 ) | 0 |
| F10 | Ackley | n | [-32,32] | f(x) = -20exp(-0.2sqrt(1/n sum xi^2)) - exp(1/n sum cos(2πxi)) + 20 + e | 0 |
| F11 | Griewank | n | [-600,600] | f(x) = 1/4000 sum xi^2 - prod( cos(xi/sqrt(i)) ) +1 | 0 |
| F12 | Penalized 1 | n | [-50,50] | f(x) = π/n [10sin²(πy1)+sum((yi-1)²(1+10sin²(πyi+1)))+(yn-1)²] + sum u(xi,10,100,4), yi=1+(xi+1)/4 | 0 |
| F13 | Penalized 2 | n | [-50,50] | f(x)=0.1[ sin²(3πx1)+sum((xi-1)²(1+sin²(3πxi+1)))+(xn-1)²(1+sin²(2πxn)) ] + sum u(xi,5,100,4) | 0 |

---

## 4. Fixed-Dimensional Functions (F14–F16)
| No. | Name | Dimension | Range | Mathematical Expression | Optimum |
|---|---|---|---|---|---|
| F14 | Shekel's Foxholes | 2 | [-65.536,65.536] | f(x) = 1/(1/500 + sum(1/(j+sum((xi-aij)^6)),j=1 to 25)) | 0.998004 |
| F15 | Kowalik | 4 | [-5,5] | f(x)=sum( (ai - x1(bi²+bi x2)/(bi²+bi x3+x4))² ) | 0.0003075 |
| F16 | Hartman 3D | 3 | [0,1] | f(x) = -sum( ci*exp(-sum( aij(xj-pij)^2, j=1 to 3 )), i=1 to 4 ) | -3.86278 |

---

## 5. Usage
These functions are used to verify the performance of the AWOASA algorithm in the paper.

## 6. Repository
GitHub: https://github.com/maxiangd/AWOASA-Magnetic-Target-Positioning
