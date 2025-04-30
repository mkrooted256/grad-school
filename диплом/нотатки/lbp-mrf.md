

## [Rotation invariant texture classification using LBP variance (LBPV) with global matching (2010)](../lib/mrf/PR_10_Mar_LBPV.pdf)

Цікаво

Our approach does not extract locally
rotation invariant LBP as in [24], but instead first builds a rotation
variant LBP histogram and then applies a global matching procedure

Fortunately, the extracted LBP features can be used to estimate the
principal orientations and hence we can compute the matching
distances along the principal orientations only.

local variance using circular test points

автори стверджують що дискретність lbp це проблема і погано поєднується з неперервністю variance

запропонована модифікована гістограма LBPV

$H_{R,P}(k) = \sum_{i,j} 1\{LBP_{R,P}(i,j) = k\}$

$LBPV_{R,P}(k) = \sum_{i,j} VAR_{R,P}(i,j) \cdot 1\{LBP_{R,P}(i,j) = k\} $

### Dissimilarity metric [for histograms]
*chi-squared distance*  
N - number of bins  
S,M - histograms  
$D(S,M) = \sum_{n=1}^N\frac{(S_n - M_n)^2}{S_n + M_n}$

Nearest Neighborhood + chi-squared distance.  
it is equivalent to optimal bayesian classification?  
> M. Varma, A. Zisserman, Unifying statistical texture classification framework, Image and Vision Computing 22 (14) (2004) 1175–1183.

### Principal orientations

#### Integral Projection Model
https://besjournals.onlinelibrary.wiley.com/doi/10.1111/1365-2656.12178

#### lookup tables

lbp code is an int (up to 64), so we can just use it as an index

- From binary codes (2^P) to LBP^u2 (drop all nonuniform)
- From binary codes to LBP^riu


## [Gaussian MRF Rotation-Invariant Features for Image Classification](../lib/mrf/huawudeng2004.pdf)

tosee: log-polar transform by Pun and Lee [9]

todo: S.Z. Li, Markov Random Field Modeling in Computer Vision. New York: Springer-Verlag, 2001

### Gaussian Markov Random Field (GMRF)

$S = \{s = (i,j) : i = \overline{1,H}, j = \overline{1,W}\}$ - indices  
$x = \{x_s : s \in S\}$ - pixel values, that are realizaiton of the random variable  
$X = \{X_s : s \in S\}$

Typical GMRF is a stationary noncausual 2d autoregressive process:  
$$x_s = \sum_{r : s+r\in N_s} \beta_r x_{s+r} + \nu_s,$$  
where $r$ is relative position to central pixel s, and $N_s$ is a neighborhood system.

Rotations of rectangular neighborhood (RN) system?
Define NS as a collection of equiradial points (estimated by bilinear interp)

$$x_s = \sum_{k=1}^n \beta_k \left(\sum_{r \colon |r|=k,\; s+r\in N_s} x_r\right) + \nu_s$$

That is, the same coefficient for all points on a circle of given R.
This works poorly as real images are anisotropic.

see: Anisotropic Circular Gaussian MRF (ACGMRF) Model

ACGMRF parameters (estimated $\beta^k_r$) is a 1d vector.
We can apply a DFT.

> DFT(ROT(x)) = DFT(x) !!!  
+ symmetry of DFT for real inputs

todo: Metropolis sampling

### Classification

$f_j$ - фічі сампла текстури j  

Вони порівнювали з ізотропічним варіантом (у цій же статті), із SLP (laplacian pyramid) та GLCP (проведені через DFT для rotation inv)

## Texture Modelling with Nested High–order Markov–Gibbs Random Fields (2015) - [link](../lib/mrf/1510.02364v1.pdf)

nesting

Image g -> image feature vector -> vector of statistics on features f(g)

Additionally, Energy $\phi$ to each vector providing a Gibbs probability distr over images:
$ p(g) \sim \operatorname{exp}(-\phi(f(g)))$

Тут ітеративно будують модель високого порядку.
Навіть з картиночками як виглядає реалізація випадкового поля

Experiments into texture synthesis using MGRFs with LBP histograms as
sufficient statistics can provide insight into the visual features
actually captured by the LBPs

todo: Field-of-Experts [11]. learning the filters. t-distr

largest filter was 11x11

Boltzmann machines [22], Product-of-Experts [23]

IDEA: вручну підігнати lbp фічі щоб отримати схожий на текстуру результат

todo: Nosaka et al. [29] introduced co-occurrence statis-
tics of neighbouring LBPs in a way that is rotationally invariant,

### 3. Nested Markov–Gibbs Random Fields

GPD - Gibbs prob distr

homogenous textures, translational invariance

gibbs factors - functions of complete subgraphs (cliques) of markov network

тут класна нотація для клік. тут зображення це відображення

Iverson bracket!!!

вони будують модель як добуток generalized exp розподілу попередньої моделі на новий exp.
Там є відомі результати які дозволяють перевикористовувати попередні MLE результати від моделей нижчого порядку [18]

 Jensen–Shannon divergence (JSD)

### Texture-specific maximisation of the minimum likelihood

Textons

### 4.4

todo: прочитати нарешті про stable diffusion

Дуже круто про image synthesis, crystallisation та способи боротьби з кристалізацією (взяти драфт картинки)

### 4.5. Binary patterns
generalization of lbp - select offsets arbitrarily

No interpolation between pixels was per-
formed, nor were histogram bins combined as in uniform LBPs

Flat regions are difficult. symmetry breaking.

### Conclusion

Controllable simulated annealling (CSA) [58] to approximate the gradient.
As known as Persistent contrastive divergence (PCD).

Mixing dissimilar potentials in a MGRF typically
shows immediate improvements.

## Local Binary Pattern (LBP) Optimization for Feature Extraction (2024)
[file](../lib/mrf/2407.18665v1.pdf)
LBP in matrix form!

IDEA: може все-таки вийде переписати на GPU щоб покращити швидкодію????

всратий опис алгоритму отримання бітового представлення числа

цікава ідея ділити гістограму в групи за бітмаскою

LBP matrix E, Tiling matrix T, and histogram matrix H

Image is `I : (n,m) -> [0, 255]`  
Let `p = n*m`.
Image vector is `I_k, k = 1..p`

Image divided into `l` tiles

Histogram is divided into m bins `V_i, i=1,m`. (actually V_i = {i-1} and m = 256 is ok)

I : (p,)  
E : (p, 256). E_kj = 1 if lbp code of k-th pixel is j; 0 otherwise  
T : (p, l). T_kj = 1 if k-th pixel is in tile j; 0 otherwise  
H : (256, m). H_ij = 1 if value j is in ith bin V_i; 0 otherwise  

F = T E H

svd, пошук найпотужніших характерних фіч лбп

### Local Binary Patterns and Superpixel-Based Multiple Kernels for Hyperspectral Image Classification (2020)
[файл](Local_Binary_Patterns_and_Superpixel-Based_Multiple_Kernels_for_Hyperspectral_Image_Classification.pdf)

SVM

Mixed SVM ((hyper)spectral) kernel

Sobel filter щоб грубо оцінити масштаб текстур на зображенні

superpixels?


## Random Texture Defect Detection Using 1-D Hidden Markov Models Based on Local Binary Patterns (2008?)
[file](../lib/mrf/IEICE08.pdf)

In [4], Varma et al. argued that a large variety of signals can
be analyzed by just looking at small neighborhoods. The
results demonstrated that textures with global structures can
be discriminated by examining the distribution of local mea-
surements [3].

Texture exemplars (Texems)

similarity measure that can be used to merge “similar” HMMs.

HMM merging

## ! Dominant Local Binary Patterns for Texture Classification (2009)
[text](../lib/mrf/tip09_liao_law_chung.pdf)

Посилаються на результати [Gaussian MRF Rotation-Invariant Features for Image Classification](../lib/mrf/huawudeng2004.pdf)

joint
- dominant local binary patterns (DLBP)
- circularly symmetric Gabor filter

tosee: https://en.wikipedia.org/wiki/Multiresolution_analysis

However, the uniform LBPs are not the dominating patterns
(i.e., patterns of the largest proportions in an image) in some tex-
tures with irregular edges and shapes. This observation will be
further elaborated in Section II

SVM

The value of m is assigned according to the value of R as suggested in [19]

Можна спробувати їх DLBP для біологічних зображень і знайти вручну оптимальний набір фіч

 Since Gabor filters can be
viewed as bandpass filters

Багато порівнянь з іншими моделями і гарний огляд

Фільтри Габора з круговою симетрією. Стратегія підбору фільтрів у [20] та [26]

Нормалізовані фільтри габора

Based on two-class SVMs, a multi-
class classification scheme is constructed by cascading multiple
standard two-class SVM classifiers [25] to classify textures with
multiple classes.

### Inference Tools for Markov Random Fields on Lattices: The R Package mrf2d (2022)

[text](../lib/v101i08.pdf)


