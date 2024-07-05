---
title: FAQs
subtitle: Frequently Asked Questions About the Application of KonFound-It for Sensitivity Analysis
comments: false
math: true
---

by Kenneth A. Frank, Qinyun Lin, Ran Xu, Spiro Maroulis, Guan Saw, & Josh Rosenberg

*Last updated: 7/5/2024*

[**FAQ Dev Version**](https://www.dropbox.com/s/9eymdekym5g50o7/frequently%20asked%20questions%20for%20application%20of%20konfound-it.docx?dl=0)

---

## Introduction

This document addresses some frequently asked questions regarding KonFound. See the appendices for background readings and software. For quick reference, see:

- [Overview of all KonFound commands](https://www.dropbox.com/s/33zkk861g04hocf/Overview%20of%20KonFound%20commands%20with%20inputs%20and%20outputs.docx?dl=0)
- [Main introductory slides for combined frameworks](https://www.dropbox.com/scl/fi/jfhwfuim4d001usup81c8/quantifying-the-robustness-of-causal-inferences-combined-frameworks-for-stat-horizons-July-23.pptx?rlkey=32srefdir2q6r9pq5998i1q1b&dl=0)

---

## Background

There are two basic frameworks for sensitivity analysis employed within KonFound. First is the *Impact Threshold for a Confounding Variable* (ITCV)&#8212;[Frank (2000)](/page/publications/frank-2000.pdf). This generates statements such as "To invalidate an inference an omitted variable would have to be correlated at __ with the predictor of interest and with the outcome." 

The second is the *Robustness of Inference to Replacement* (RIR)&#8212;Frank et al. ([2013](/page/publications/frank-maroulis-duong-kelcey-2013.pdf), [2021](/page/publications/frank-et-al-2021.pdf)). The RIR generates statements such as "To invalidate the inference __% of the estimated effect would have to be due to bias. That is, to invalidate the inference one would expect to have to replace __% of the cases with cases for which the predictor of interest had no effect on the outcome." 

Overviews of the techniques can be found in Frank et al. ([2023](/page/publications/frank-lin-xu-maroulis-mueller-2023.pdf)) or Xu et al. ([2019](/page/publications/xu-frank-maroulis-rosenberg-2019.pdf)). The ITCV is intended for linear models, expressing sensitivity in terms of correlations. The RIR is essentially non-parametric and can generally be adapted to a broader range of models. 

### Different Models/Estimation Methods

Both the ITCV and RIR have been presented with fairly conventional and simple linear models. Therefore, we consider how the techniques might be adapted to other types of models.

### Weighted Least Squares

[{{< awesome fas fa-images >}} Slides](https://www.dropbox.com/scl/fi/uzliqbhkg77btv09yomt1/robustness-of-inference-to-replacement-for-weighted-data.pptx?rlkey=09x0if4wifo3oluumfpem7rx7&e=1&dl=0)

There are several models that can be estimated using weighted least squares. These include proportional weighting (weights inversely proportional to the propensity for treatment), multilevel models (weighted inversely proportional to the sampling variability) and meta-analysis (which weights the studies by sample size or as in a multilevel model which may account for multiple estimates per study).

**Recommendation:** RIR

**Conceptualization:** Replacing each weighted case with a case of comparable weight for which there is no effect of the predictor on the outcome. For example, one conceptualizes replacing a school with a weight of three with a school also with weight three but for which there is no effect of the school level factor on the outcome (for multilevel models one can also conceptualize replacing only some of the level 1 data to make the estimated effect in a particular unit equal to zero&#8212;Nicole Ellefson). 

**Assumptions:** The weights assigned to each case do not change as a result of the replacement process.

**Interpretation:** The RIR essentially indicates the sum of the total weight of cases that must be replaced to invalidate an inference. For example, if the RIR is 30% and the sum of the total weights is 100 then one would have to replace a total weight of 30 with cases for which there was no effect to nullify the inference. This could be accomplished by replacing one school of weight 30; two schools of weight 15; or 30 schools each of weight 1.

**Extension:** One might consider normalizing the weights by dividing by the mean weight: $ w^*_i = \frac{w_i}{\bar{w}} $. 

As a result, $ \bar{w}^* = 1 $, and the sample size is preserved. 

For example, the weights in a multilevel model are defined by $ w_j =\frac{\tau}{\tau + v_j} $, where $\tau$ is the level 2 random effect and $v_j$ is the sampling variability for a particular unit. Then one could construct $w^*$ to preserve the overall number of level two units. 

Note the assumption is that $\tau$ and $v_j$ would not change with other changes in the data or model (e.g., if omitted variables were added to the model).

For a ITCV-like approach, see Hong et al. ([2021](https://doi.org/10.1111/rssa.12621)).

- Hong, G., Yang, F., & Qin, X. (2021). Did you conduct a sensitivity analysis? A new weighting‐based approach for evaluations of the average treatment effect for the treated. *Journal of the Royal Statistical Society: Series A (Statistics in Society), 184*(1), 227-254. https://doi.org/10.1111/rssa.12621

### Multinomial Models

There is currently no module specifically designated for multinomial outcomes. But a multinomial model can be relativeley efficiently estimated through a series of independent logistic regressions (Begg & Gray, 1984). For example, if the outcome takes values 1,2,3 then one can model 1 vs 2&3. Or one can model 3 vs 1&2. One could also have a series of nested models. For example, one could model 1 vs 2&3 and then 2 vs 3 (omitting those in the 1 category in the second model). KonFound for logistic can then be applied via the app or via the KonFound command:

```
pKonFound(-0.2, 0.103, 20888, 3, n_treat = 17888, model_type = "logistic")
```

- Begg, C. B., & Gray, R. (1984). Calculation of polychotomous logistic regression parameters using individualized regressions. *Biometrika, 71*(11-8).
- Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., Hayter, C. S., Mahmoud, R. A., Kolak, M., Dietz, T., & Zhang, L. (2021). Hypothetical case replacement can be used to quantify the robustness of trial results. *Journal of Clinical Epidemiology, 134*, 150-159. (authors listed alphabetically.) [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/2dzkvalwmgr5v5z/Hypothetical%20case%20replacement%20can%20be%20used%20to%20quantify%20the%20robustness%20of%20trial%20results%20submit.docx?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.jclinepi.2021.01.025)



### Probit Models

We do not have a direct solution for Probit models because it is difficult to translate them into 2x2 tables (which we can do for logistic regression).

We recommend either estimating a linear probability model and using RIR or ITCV, or estimating a logistic regression and applying the RIR. See [Wooldridge’s comment on probit and linear probability model](https://twitter.com/jmwooldridge/status/1364942341656764433).

### Survival Analysis 

[{{< awesome fas fa-images >}} Slides]()

Discrete time models can be estimated via logistic regression. 

Continuous time Cox regression can be conceptualized in terms of changes to the rank order of the timing of events.

### Mediation Effects

Many social sciences now investigate the mechanisms through which treatments have their effects through mediation models. See Lin et al. (forthcoming).
 
**Recommendation:** ITCV or RIR (work in progress, please email for more details).

**Conceptualization:** ITCV if one uses the product method to estimate the indirect effect and relies on the joint significance test for statistical inference. Specifically, one conceptualizes the ITCV necessary to invalidate either component/pathway (A or B) of the mediating path, with the overall ITCV defined by the least robust path. For example, if path A has a smaller ITCV, then we use the ITCV for path A to evaluate the robustness of mediation effect. If the researcher considers a confounder only impacts a particular pathway (either A or B), then one could also use the ITCV specific to that pathway.

**Assumptions:** For ITCV: linear relationships among the predictor of interest, the mediator and the outcome.

**Interpretation:** For ITCV: The minimum impact an unobserved confounder could have to break the mediation path from X (predictor of interest) to Y (outcome) via M (mediator).

- Lin, Q., Nuttall, A., Zhang, Q., Frank, K.A. (2023) How do unobserved confounding mediators and measurement error impact estimated mediation effects and corresponding statistical inferences? Introducing R Package ConMed for sensitivity analysis. *Psychological Methods, 28*(2), 339-358. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1037/met0000567)

### Software

For ConMed, install the development version from GitHub with:

```
install.packages(“devtools”)
devtools::install_github("qinyun-lin/ConMed")
```

Use `conmed_ind()` for evaluating the robustness of inference regarding the indirect effect via mediator M. This is especially useful for those concerned about an omitted confounder potentially impacting the inference regarding both the a pathway ($ X \rightarrow M $) and the b pathway ($ M \rightarrow Y $) at the same time.

```
devtools::install_github("qinyun-lin/ConMed")
library(ConMed)
conmed_ind(est_eff_a, std_err_a, est_eff_b, std_err_b, n_obs, n_covariates_a, n_covariates_b, alpha, tails) 
```

### Ordinary Least Squares (OLS) Used at Second Stage

Several estimation approaches use OLS at the second stage of analysis. These include instrumental variables and some doubly robust propensity approaches.

**Recommendation:** ITCV or RIR.

**Conceptualization:** For ITCV, the omitted variable is conceptualized as entering the second stage of the model. For RIR, cases are replaced in the second stage of the model. If weights are applied, then the ITCV applies to weighted correlations and the RIR applies to weighted cases.

**Assumptions:** For ITCV, linear relationships are assumed in the final stage.

**Interpretation:** Focus is on the final stage, and the characteristics of an omitted variable or replaced data necessary to change an inference.

### Predictive Models (Use of Machine Learning)

**Under development.**

But, Frank et al. (2021) is related.

- Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., Hayter, C. S., Mahmoud, R. A., Kolak, M., Dietz, T., & Zhang, L. (2021). Hypothetical case replacement can be used to quantify the robustness of trial results. *Journal of Clinical Epidemiology, 134*, 150-159. (authors listed alphabetically.) [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/2dzkvalwmgr5v5z/Hypothetical%20case%20replacement%20can%20be%20used%20to%20quantify%20the%20robustness%20of%20trial%20results%20submit.docx?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.jclinepi.2021.01.025)

This could be applied to an accuracy or recall score or maybe even an overall $F$ score.

### Fixed Effects

**Under development.**

If fixed effects are control variables, account for them in $df$, even if only through mean centering the variables.

If fixed effects as a set are predictors of interest, use $R$ for variance explained, can do ITCV in terms of $R$. For individual fixed effects, see [Dr. Qinyun Lin’s](https://www.linkedin.com/in/qinyun-lin-b72763112/) dissertation for RIR.

### Categorical (Factor) Predictor

**Procedure:**

1. Calculate change in $R^2$ as a result of adding the factor.
2. Take square root. This is the estimated effect.
3. Standard error = $\sqrt{ \frac{1 - r^2}{n - 2} }$.
4. Use `pKonFound()` command with `estimate = r` as in (2), standard error as in (3), $n$ and # of covariates.

### Moderation Effects

There are several models that focus on moderating effects. These include models with interaction terms, and Diff in Diff. 

**Under development.**

**Recommendation:** RIR.

**Conceptualization:**

**Assumptions:**

**Interpretation:**

### What is a good cut-off for RIR or ITCV?

Many people ask: What is a good cut-off for RIR or ITCV? Our first response is that the point of the indices is to quantify the language for informing causal inferences. Instead of saying qualitatively "There might be an omitted variable," we quantify the characteristics of the omitted variable necessary to change the inference. In these quantitative terms people can meaningfully debate the robustness of the inference. Therefore, to define a threshold at which point there is or is not concern about an omitted variable is not in the spirit of the indices. In fact, providing a threshold leads to infinite recursion. If we stated that an RIR above a threshold ZZ was robust, then what if the RIR is just above ZZ? One could then ask for a threshold defining how much above or below ZZ constitutes a robust decision. And then there could be an index for that new threshold, etc. That said:

### Benchmark

We can benchmark either the RIR or ITCV using observed covariates. For example, if the observed covariates reduce an estimate effect by .2, and the unobserved covariates would have to reduce the estimated effect by .1 to be below the threshold for inference, then unobserved covariates would have to be 50% as strong as the observed covariates to change the inference. 

Similarly, the ITCV can be compared to the impact of any observed covariate $Z$ defined by $ r_{X·Z}r_{Y·Z} $. For example, if the ITCV is .2 and the observed covariate with the strongest impact has correlations of $r_{X·Z} = .6$ and $r_{Y·Z} = .17$ with $r_{X·Z}r_{Y·Z} = .6 * .17 = .1$, then the impact of an unobserved covariate would have to be twice as strong as the impact of the observed covariate to change the inference.

### Normative

In Frank et al. (2013), we quantified the RIR for studies published in *Education, Evaluation and Policy Analysis*, July 24-November 15, 2012. The median value for observational studies and randomized experiments was about 35%. RIR values in a new study higher than about 33% would imply a more robust inference than as published in EEPA in the interval given. Several notes apply:

- Comparisons across studies are best done using RIR (in terms of a correlation metric&#8212;see Frank et al., 2013). The ITCV does not compare as directly because different standard errors are used for inference in different studies.
  - Frank, K. A., Maroulis, S. J., Duong, M. Q., & Kelcey, B. M. (2013). What would it take to change an inference? Using Rubin’s causal model to interpret the robustness of causal inferences. *Educational Evaluation and Policy Analysis, 35*(4), 437-460. [{{< awesome fas fa-file-pdf >}} PDF](https://drive.google.com/file/d/1aGhxGjvMvEPVAgOA8rrxvA97uUO5TTMe/view) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.3102/0162373713493129)
- We are currently updating this analysis. 
- Distributions may vary by discipline and journal.



### Absolute

In terms of a debate between a researcher and a skeptic, an RIR of 50% would allow the researcher to retain one observed case for each case that must be replaced with the skeptic's hypothetical case for which the treatment has no effect.

### Probability

The ITCV can be converted into a probability of observing an impact of a given size from within the reference distribution of observed impacts. This is described in:

- Frank, K. (2000). Impact of a confounding variable on the inference of a regression coefficient. *Sociological Methods and Research, 29*(2), 147-194. [{{< awesome fas fa-file-pdf >}} PDF](https://drive.google.com/file/d/1F7oGYZ8SS8hnZxSI3Dch_w65Qz6KIRdI/view) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/0049124100029002001)
- Pan, W. (2009). A SAS/IML macro for computing percentage points of Pearson distributions. *Journal of Statistical Software, 31*(Code Snippet 2), 1-6. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.18637/jss.v031.c02)
- Pan, W., & Frank, K. A. (2003). A probability index of the robustness of a causal inference. *Journal of Educational and Behavioral Statistics, 28*(4), 315-337. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.3102/10769986028004315)
- Pan, W., & Frank, K. A. (2004). An approximation to the distribution of the product of two dependent correlation coefficients. *Journal of Statistical Computation and Simulation, 74*(6), 419-443. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1080/00949650310001596822)

The RIR can be expressed as a probability from a Bayesian perspective:

- Frank, K. A., & Min, K. (2007). Indices of robustness for sample representation. *Sociological Methodology. 37*(1). 349-392. (equal first authors.) [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/o0rmduhe8pj3khd/INDICES%20OF%20ROBUSTNESS%20FOR%20SAMPLE%20REPRESENTATION.pdf?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1111/j.1467-9531.2007.00186.x)
- Li, T., & Frank, K. (2022). The probability of a robust inference for internal validity. *Sociological Methods & Research, 51*(4), 1947-1968. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/0049124120914922)



### Other Techniques for Sensitivity Analysis

For a review of techniques for sensitivity analysis, see Frank et al. (2023).

- Frank, K. A., Lin, Q., Xu, R., Maroulis, S. J., Mueller, A. (2023). Quantifying the robustness of causal inferences: Sensitivity analysis for pragmatic social science. *Social Science Research, 110*, 102815. [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/rn8a4jbxtiynefh/Quantifying%20the%20Robustness%20of%20Causal%20Inferences%20Frank%20SSR%20final.pdf?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.ssresearch.2022.102815)



### Oster’s Coefficient of Proportionality

The conceptualization is that coefficient stability when observed covariates are added to a model anticipates stability if unobserved covariates were added to the model. This is in the context of a fixed $R^2$ that can be achieved even when unobserved covariates are added. The intuition is valuable, but Oster's (2019) calculation is somewhat inaccurate and relies on assumptions about a baseline model. 

For an exact calculation that makes fewer assumptions see Frank, Lin, and Maroulis (2023).

- Frank, K. A., Lin, Q., & Maroulis, S. (2023). *Quantifying sensitivity to selection on unobservables: Refining Oster’s coefficient of proportionality*. White paper. [{{< awesome fas fa-file-pdf >}} PDF](/page/publications/frank-lin-maroulis-2023.pdf)
- Oster, E. (2019). Unobservable selection and coefficient stability: Theory and evidence. *Journal of Business & Economic Statistics, 37*(2), 187-204. https://doi.org/10.1080/07350015.2016.1227711



**R Code for Coefficient of Proportionality:**

```
install.packages("konfound")
library(konfound)
pKonFound(est_eff = .125, std_err = .050, n_obs = 6265, sdx = .217, sdy = .991, R2 = .251, eff_thr = 0, FR2max = .61, index = "COP", to_return = "raw_output")
```

### Cinelli and Hazlett's Robustness Value

Cinelli and Hazlett (2020) conceptualized robustness in terms of variance explained in $X$ and $Y$ by omitted variables $Z$. The calculations are exact and appeal to intuition based on partial $R^2$. They can be applied to a threshold defined by inference (accounting for standard error) or an effect size. Cinelli and Hazlett (2020) critiqued ITCV because it does not directly adapt to thresholds other than statistical significance. We responded in Frank et al. (2023) by noting that sensitivity analyses that focus on an effect size threshold implicitly assume the standard error does not change when omitted variables are included in a model. We make this explicit for both the ITCV and RIR perspective in Frankl et al. (2023). Frank (2000) showed that this assumption maximizes the impact (favoring the challenger) for inferences based on statistical significance.

We also note that under the assumption that $ r_{X·CV} = r_{Y·CV} = r_{∙·CV}$ (as in Cinelli and Haslett [2020, p. 51]):

$$
\hat\beta = \frac{\hat\sigma_Y}{\hat\sigma_X} \frac{r_{X·Y} - r_{X·CV}r_{Y·CV}}{1 - r^2_{X·CV}} =  \frac{\hat\sigma_Y}{\hat\sigma_X} \frac{r_{X·Y} - r^2_{∙·CV}}{1 - r^2_{∙·CV}} = \frac{\hat\sigma_Y}{\hat\sigma_X}r_{X·Y|CV}
$$

That is, under the assumption $ r_{X·CV} = r_{Y·CV} = r_{∙·CV}$, the partial correlation that is the basis of the ITCV translates directly to a regression coefficient through $ \frac{\hat\sigma_Y}{\hat\sigma_X} $.

**R Code for Sensitivity While Preserving the Standard Error:**

```
install.packages("konfound")
library(konfound)
pKonFound(est_eff = .125, std_err = .050, n_obs = 6300, sdx = .217, sdy = .991, R2 = .251, eff_thr = 0, FR2max = .61, index = "PSE", to_return = "raw_output")
```

- Cinelli, C., & Hazlett, C. (2020). Making sense of sensitivity: Extending omitted variable bias. *Journal of the Royal Statistical Society: Series B (Statistical Methodology), 82*(1), 39-67. https://doi.org/10.1111/rssb.12348
- Frank, K. A., Lin, Q., Xu, R., Maroulis, S. J., Mueller, A. (2023). Quantifying the robustness of causal inferences: Sensitivity analysis for pragmatic social science. *Social Science Research, 110*, 102815. [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/rn8a4jbxtiynefh/Quantifying%20the%20Robustness%20of%20Causal%20Inferences%20Frank%20SSR%20final.pdf?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.ssresearch.2022.102815)



### Vanderweel E-Value

The E-value quantifies the conditions necessary to reduce an estimated effect on a dichotomous outcome to 0. The conceptualization is elegant and the technique exact. Frank et al. (2021) evaluated the case switches (from treatment success to treatment failure) necessary to reduce an estimated effect below any threshold, including statistical significance by drawing on the *Fragility Index*. Frank et al. (2021) then showed that Fragility can be interpreted in terms of RIR, linking to the application of RIR in other contexts through the potential outcomes framework. See also Baer et al. (2021a, 2021b) for a Bayesian interpretation. Calculations can be done for logistic regression or 2x2 table at http://KonFound-it.com.

- Baer, B. R., Gaudino, M., Charlson, M., Fremes, S. E., & Wells, M. T. (2021a). Fragility indices for only sufficiently likely modifications. *Proceedings of the National Academy of Sciences, 118*(49).	https://doi.org/10.1073/pnas.2105254118
- Baer, B. R., Fremes, S. E., Gaudino, M., Charlson, M., & Wells, M. T. (2021b). On clinical trial fragility due to patients lost to follow up. *BMC Medical Research Methodology, 21*(1), 1-11. https://doi.org/10.1186/s12874-021-01446-z
- Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., Hayter, C. S., Mahmoud, R. A., Kolak, M., Dietz, T., & Zhang, L. (2021). Hypothetical case replacement can be used to quantify the robustness of trial results. *Journal of Clinical Epidemiology, 134*, 150-159. (authors listed alphabetically.) [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/2dzkvalwmgr5v5z/Hypothetical%20case%20replacement%20can%20be%20used%20to%20quantify%20the%20robustness%20of%20trial%20results%20submit.docx?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.jclinepi.2021.01.025)
- Vanderweele, T. J., and Arah, O. A. (2011). Bias formulas for sensitivity analysis of unmeasured confounding for general outcomes, treatments, and confounders. *Epidemiology, 22*(1), 42-52. https://doi.org/10.1097/ede.0b013e3181f74493
- Vanderweele, T. J., and Ding, P. (2017). Sensitivity analysis in observational research: introducing the E-value. *Annals of Internal Medicine, 167*(4), 268-274. https://doi.org/10.7326/M16-2607

---

## Appendix A: Background Readings

*For the most current list, please visit the [Publications](/page/publications) webpage.*

- [{{< awesome fas fa-images >}} Main introductory slides for combined frameworks](https://www.dropbox.com/scl/fi/jfhwfuim4d001usup81c8/quantifying-the-robustness-of-causal-inferences-combined-frameworks-for-stat-horizons-July-23.pptx?rlkey=32srefdir2q6r9pq5998i1q1b&dl=0)
- Frank, K. (2000). Impact of a confounding variable on the inference of a regression coefficient. *Sociological Methods and Research, 29*(2), 147-194. [{{< awesome fas fa-file-pdf >}} PDF](https://drive.google.com/file/d/1F7oGYZ8SS8hnZxSI3Dch_w65Qz6KIRdI/view) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/0049124100029002001)
- Frank, K. A., Lin, Q., & Maroulis, S. (2023). *Quantifying sensitivity to selection on unobservables: Refining Oster’s coefficient of proportionality*. White paper. [{{< awesome fas fa-file-pdf >}} PDF](frank-lin-maroulis-2023.pdf)
- Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., Hayter, C. S., Mahmoud, R. A., Kolak, M., Dietz, T., & Zhang, L. (2021). Hypothetical case replacement can be used to quantify the robustness of trial results. *Journal of Clinical Epidemiology, 134*, 150-159. (authors listed alphabetically.) [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/2dzkvalwmgr5v5z/Hypothetical%20case%20replacement%20can%20be%20used%20to%20quantify%20the%20robustness%20of%20trial%20results%20submit.docx?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.jclinepi.2021.01.025)
- Frank, K. A., Lin, Q., Xu, R., Maroulis, S. J., Mueller, A. (2023). Quantifying the robustness of causal inferences: Sensitivity analysis for pragmatic social science. *Social Science Research, 110*, 102815. [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/rn8a4jbxtiynefh/Quantifying%20the%20Robustness%20of%20Causal%20Inferences%20Frank%20SSR%20final.pdf?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.ssresearch.2022.102815)
- Frank, K. A., Maroulis, S. J., Duong, M. Q., & Kelcey, B. M. (2013). What would it take to change an inference? Using Rubin’s causal model to interpret the robustness of causal inferences. *Educational Evaluation and Policy Analysis, 35*(4), 437-460. [{{< awesome fas fa-file-pdf >}} PDF](https://drive.google.com/file/d/1aGhxGjvMvEPVAgOA8rrxvA97uUO5TTMe/view) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.3102/0162373713493129)
- Frank, K. A., & Min, K. (2007). Indices of robustness for sample representation. *Sociological Methodology. 37*(1). 349-392. (equal first authors.) [{{< awesome fas fa-file-pdf >}} PDF](https://www.dropbox.com/s/o0rmduhe8pj3khd/INDICES%20OF%20ROBUSTNESS%20FOR%20SAMPLE%20REPRESENTATION.pdf?dl=0) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1111/j.1467-9531.2007.00186.x)
- Frank, K. A., Sykes, G., Anagnostopoulos, D., Cannata, M., Chard, L., Krause, A., & McCrory, R. (2008). Does NBPTS certification affect the number of colleagues a teacher helps with instructional matters?. *Educational Evaluation and Policy Analysis, 30*(1), 3-30. [{{< awesome fas fa-file-pdf >}} PDF](https://drive.google.com/file/d/1aOvAXEVnQCe9-dbWkgTqtq56Y3Z1tpkg/view) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.3102/0162373707313781)
- Li, T., & Frank, K. (2022). The probability of a robust inference for internal validity. *Sociological Methods & Research, 51*(4), 1947-1968. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/0049124120914922)
- Lin, Q., Nuttall, A., Zhang, Q., Frank, K.A. (2023) How do unobserved confounding mediators and measurement error impact estimated mediation effects and corresponding statistical inferences? Introducing R Package ConMed for sensitivity analysis. *Psychological Methods, 28*(2), 339-358. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1037/met0000567)
- Narvaiz, S., Lin, Q., Rosenberg, J. M., Frank, K. A., Maroulis, S. J., Wang, W., & Xu, R. (2024). konfound: An R sensitivity analysis package to quantify the robustness of causal inferences. *Journal of Open Source Software, 9*(95), 5779. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.21105/joss.05779)
- Pan, W. (2009). A SAS/IML macro for computing percentage points of Pearson distributions. *Journal of Statistical Software, 31*(Code Snippet 2), 1-6. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.18637/jss.v031.c02)
- Pan, W., & Frank, K. A. (2003). A probability index of the robustness of a causal inference. *Journal of Educational and Behavioral Statistics, 28*(4), 315-337. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.3102/10769986028004315)
- Pan, W., & Frank, K. A. (2004). An approximation to the distribution of the product of two dependent correlation coefficients. *Journal of Statistical Computation and Simulation, 74*(6), 419-443. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1080/00949650310001596822)
- Xu, R., Frank, K. A., Maroulis, S. J., & Rosenberg, J. M. (2019). konfound: Command to quantify robustness of causal inferences. *The Stata Journal, 19*(3), 523–550. [{{< awesome fas fa-file-pdf >}} PDF](https://www.researchgate.net/profile/Ran-Xu-6/publication/335956720_konfound_Command_to_quantify_robustness_of_causal_inferences/links/5e49a3d2a6fdccd965ac3564/konfound-Command-to-quantify-robustness-of-causal-inferences.pdf) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/1536867X19874223)



---

## Appendix B: Software

### {{< awesome fab fa-r-project >}} KonFound R Package

| Monthly Downloads | Total Downloads |
| :---------------- | :-------------- |
| ![](https://cranlogs.r-pkg.org/badges/konfound?color=9bbb59) | ![](https://cranlogs.r-pkg.org/badges/grand-total/konfound?color=9bbb59) |

```
install.packages("konfound")
library(konfound)
pkonfound(est_eff = -9.01, std_err = .68, n_obs = 7639, n_covariates = 221)
```

- CRAN version of the R package: Rosenberg, J. M., Xu, R., Lin, Q., Maroulis, S., & Frank, K. A. (2023). *konfound: Quantify the robustness of causal inferences* (v. 0.4.0). https://CRAN.R-project.org/package=konfound
- Narvaiz, S., Lin, Q., Rosenberg, J. M., Frank, K. A., Maroulis, S. J., Wang, W., & Xu, R. (2024). konfound: An R sensitivity analysis package to quantify the robustness of causal inferences. *Journal of Open Source Software, 9*(95), 5779. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.21105/joss.05779)
- Development version of the R package: [KonFound Project on GitHub](https://github.com/konfound-project/konfound)



### {{< awesome fab fa-stripe-s >}} KonFound Stata Package

```
ssc install konfound
ssc install indeplist
ssc install moss
ssc install matsort
pkonfound -9.01 .68 7639 221
```

- Xu, R., Frank, K. A., Maroulis, S. J., & Rosenberg, J. M. (2019). konfound: Command to quantify robustness of causal inferences. *The Stata Journal, 19*(3), 523-550. https://doi.org/10.1177/1536867X19874223



### {{< awesome fas fa-calculator >}} KonFound-It! Shiny App

- Rosenberg, J. M., Narvaiz, S., Xu, R., Lin, Q., Maroulis, S., Frank, K. A., Saw, G. & Staudt Willet, K. B. (2023). *KonFound-it!: Quantify the robustness of causal inferences* (v. 2.0.0). https://konfound-project.shinyapps.io/konfound-it/



### {{< awesome fas fa-table >}} Spreadsheets

- [{{< awesome fas fa-table >}} KonFound-It! spreadsheet for calculating indices](/page/resources/konfound-it-indice-spreadsheet.xlsx)
- [KonFound-It! spreadsheet for calculating indices (beta)](https://docs.google.com/spreadsheets/d/1AELZ9mA0wrhMZNJYTTudeztVAJjHncl4/edit?usp=sharing&ouid=116345913183792066499&rtpof=true&sd=true)
- [KonFound-It! spreadsheet for nonlinear replacement (beta)](https://drive.google.com/file/d/19eJ0C6P0XwaG6FDsO6FVAxP-evg-HUPz/view?usp=sharing)
