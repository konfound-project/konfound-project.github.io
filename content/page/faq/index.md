---
title: FAQs
subtitle: Frequently Asked Questions About the Application of KonFound-It for Sensitivity Analysis
comments: false
---

by Kenneth A. Frank, Qinyun Lin, Ran Xu, Spiro Maroulis, Guan Saw, Josh Rosenberg

*Last updated: 8/13/2023*

---

## Introduction

This document addresses some frequently asked questions regarding the KonFound. See the appendices for background readings and software. For quick reference, see:

- [Overview of all KonFound commands](https://www.dropbox.com/s/33zkk861g04hocf/Overview%20of%20KonFound%20commands%20with%20inputs%20and%20outputs.docx?dl=0)
- [Main introductory slides for combined frameworks](https://www.dropbox.com/scl/fi/jfhwfuim4d001usup81c8/quantifying-the-robustness-of-causal-inferences-combined-frameworks-for-stat-horizons-July-23.pptx?rlkey=32srefdir2q6r9pq5998i1q1b&dl=0)

---

## Background

There are two basic frameworks for sensitivity analysis employed within KonFound.  First is the Impact Threshold for a Confounding Variable (ITCV) – Frank (2000).  This generates statements such as “To invalidate an inference an omitted variable would have to be correlated at __ with the predictor of interest and with the outcome.” The second is the Robustness of Inference to Replacement (RIR) – Frank et al., 2013, 2021).  The RIR generates statements such as “To invalidate the inference __% of the estimated effect would have to be due to bias.  That is, to invalidate the inference one would expect to have to replace __% of the cases with cases for which the predictor of interest had no effect on the outcome.” Overviews of the techniques can be found in Frank et al., (2023) or Xu et al (2019). The ITCV is intended for linear models, expressing sensitivity in terms of correlations.  The RIR is essentially non-parametric and can generally be adapted to a broader range of models. 

### Different Models/Estimation Methods

Both the ITCV and RIR have been presented with fairly conventional and simple linear models. Therefore, we consider how the techniques might be adapted to other types of models.

### Weighted Least Squares

[{{< awesome fas fa-images >}} Slides](https://www.dropbox.com/scl/fi/uzliqbhkg77btv09yomt1/robustness-of-inference-to-replacement-for-weighted-data.pptx?rlkey=09x0if4wifo3oluumfpem7rx7&dl=0)

There are several models that can be estimated using weighted least squares.  These include proportional weighting (weights inversely proportional to the propensity for treatment), multilevel models (weighted inversely proportional to the sampling variability) and meta-analysis.

**Recommendation:** RIR

**Conceptualization:** Replacing each weighted case with a case of comparable weight for which there is no effect of the predictor on the outcome.  For example, one conceptualizes replacing a school with a weight of three with a school also with weight three but for which there is no effect of the school level factor on the outcome (for multilevel models one can also conceptualize replacing only some of the level 1 data to make the estimated effect in a particular unit equal to zero – Nicole Ellefson). 

**Assumptions:** the weights assigned to each case do not change as a result of the replacement process.

**Interpretation:** The RIR essentially indicates the total weight of cases that must be replaced to invalidate an inference.  One might consider normalizing the weights by dividing by the mean weight:

 .  As a result,  and the sample size is preserved.  For example, the weights in a multilevel model are defined by   where τ is the level 2 random effect and vj is the sampling variability for a particular unit. Then one could construct w* to preserve the overall number of level two units. Note the assumption is that τand vj would not change with other changes in the data or model (e.g., if omitted variables were added to the model).
For a ITCV-like approach, see: Hong, G., Yang, F., & Qin, X. (2021). Did you conduct a sensitivity analysis? A new weighting‐based approach for evaluations of the average treatment effect for the treated. Journal of the Royal Statistical Society: Series A (Statistics in Society).

### Multinomial Models

There is currently no module specifically designated for multinomial outcomes.  But a multinomial model can be relativeley efficiently estimated through a series of independent logistic regressions (Begg and Gray, 1984).  For example, if the outcome takes values 1,2,3 then one can model 1 vs 2&3.  Or one can model 3 vs 1&2.  One could also have a series of nested models.  For example, one could model 1 vs 2&3 and then 2 vs 3 (omitting those in the 1 category in the second model).  KonFound for logistic can then be applied via the app or via the KonFound command.
 
pKonFound(-0.2, 0.103, 20888, 3, n_treat = 17888, model_type = "logistic")

Begg, Colin B. and Robert Gray. 1984. ‘‘Calculation of Polychotomous Logistic Regression Parameters Using Individualized Regressions.’’ Biometrika 71:11-8.
*Frank, K. A., *Lin, Q., *Maroulis, S., *Mueller, A. S., Xu, R., Rosenberg, J. M., ... & Zhang, L. 2021. Hypothetical case replacement can be used to quantify the robustness of trial results. Journal of Clinical Epidemiology, 134, 150-159. *authors listed alphabetically.

### Probit Models

We do not have a direct solution for Probit models because it is difficult to translate them into 2x2 tables (which we can do for logistic regression).

We recommend either estimating a linear probability model and using RIR or ITCV, or estimating a logistic regression and applying the RIR. See Wooldridge’s comment on probit and linear probability model.

### Survival Analysis 

[{{< awesome fas fa-images >}} Slides]()

Discrete time models can be estimated via logistic regression. 
Continuous time Cox regression can be conceptualized in terms of changes to the rank order of the timing of events.

### Mediation Effects

Many social sciences now investigate the mechanisms through which treatments have their effects through mediation models. See Lin et al (forthcoming)
 
**Recommendation:** ITCV or RIR (work in progress, please email for more details).

**Conceptualization:** ITCV if one uses the product method to estimate the indirect effect and relies on the joint significance test for statistical inference. Specifically, one conceptualizes the ITCV necessary to invalidate either component/pathway (A or B) of the mediating path, with the overall ITCV defined by the least robust path. For example, if path A has a smaller ITCV, then we use the ITCV for path A to evaluate the robustness of mediation effect. If the researcher considers a confounder only impacts a particular pathway (either A or B), then one could also use the ITCV specific to that pathway.

**Assumptions:** For ITCV: linear relationships among the predictor of interest, the mediator and the outcome.

**Interpretation:** For ITCV: The minimum impact an unobserved confounder could have to break the mediation path from X (predictor of interest) to Y (outcome) via M (mediator).

Lin, Q., Nuttall, A., Zhang, Q., Frank, K.A. (2023) “How Do Unobserved Confounding Mediators and Measurement Error Impact Estimated Mediation Effects and Corresponding Statistical Inferences? Introducing R Package ConMed for Sensitivity Analysis.”  Psychological Methods.

### Software

For ConMed, install the development version from GitHub with: 
install.packages(“devtools”)
devtools::install_github(“linqinyu/ConMed”)
Use conmed_ind for evaluating the robustness of inference regarding the indirect effect via mediator M. This is especially useful for those concerned about an omitted confounder potentially impacting the inference regarding both the a pathway (X  M) and the b pathway (M  Y) at the same time. 
devtools::install_github("qinyun-lin/ConMed")
library(ConMed)
conmed_ind(est_eff_a, std_err_a, est_eff_b, std_err_b, n_obs, n_covariates_a, n_covariates_b, alpha, tails) 

### Ordinary Least Squares (OLS) Used at Second Stage

Several estimation approaches use OLS at the second stage of analysis.  These include instrumental variables and some doubly robust propensity approaches.  

**Recommendation:** ITCV or RIR.

**Conceptualization:** For ITCV the omitted variable is conceptualized as entering the second stage of the model. For RIR, cases are replaced in the second stage of the model.  If weights are applied, then the ITCV applies to weighted correlations and the RIR applies to weighted cases.

**Assumptions:** For ITCV: linear relationships are assumed in the final stage.

**Interpretation:** Focus is on the final stage, and the characteristics of an omitted variable or replaced data necessary to change an inference.

### Predictive Models (Use of Machine Learning)

**Under development**

But related:https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3607967
published version:
*Frank, K. A., *Lin, Q., *Maroulis, S., *Mueller, A. S., Xu, R., Rosenberg, J. M., ... & Zhang, L. 2021. Hypothetical case replacement can be used to quantify the robustness of trial results. Journal of Clinical Epidemiology, 134, 150-159. *authors listed alphabetically. 
This could be applied to an accuracy or recall score or maybe even an overall F score.


### Fixed Effects

**Under development.**

If fixed effects are control variables, account for them in df, even if only through mean centering the variables.

If fixed effects as a set are predictors of interest, use R for variance explained, can do ITCV in terms of R.  For individual fixed effects, see Qinyun’s dissertation for RIR.

### Categorical (Factor) Predictor

	1) calculate change in R2 as a result of adding the factor
	2) take square root.  This is the estimated effect
	3) Standard error =sqrt((1-r^2)/(n-2)).  
	4) use pKonFound command with estimate=r as in (2), standard error as in (3), n and # of covariates


**Moderation Effects

There are several models that focus on moderating effects.  These include models with interaction terms, and Diff in Diff. 

**Under development.**

Recommendation: RIR.  
Conceptualization: 
Assumptions: 
Interpretation: 

### What is a good cut-off for RIR or ITCV?

Many people ask what is a good cut-off for RIR or ITCV?  Our first response is that the point of the indices is to quantify the language for informing causal inferences.  Instead of saying qualitatively “there might be an omitted variable” we quantify the characteristics of the omitted variable necessary to change the inference.  In these quantitative terms people can meaningfully debate the robustness of the inference. Therefore, to define a threshold at which point there is or is not concern about an omitted variable is not in the spirit of the indices. In fact, providing a threshold leads to infinite recursion.  If we stated that an RIR above a threshold ZZ was robust,  then what if the RIR is just above ZZ?  One could then ask for a threshold defining how much above or below ZZ constitutes a robust decision.  And then there could be an index for that new threshold, etc.  That said:

### Benchmark

We can benchmark either the RIR or ITCV using observed covariates.  For example, if the observed covariates reduce an estimate effect by .2, and the unobserved covariates would have to reduce the estimated effect by .1 to be below the threshold for inference, then unobserved covariates would have to be 50% as strong as the observed covariates to change the inference.  Similarly, the ITCV can be compared to the impact of any observed covariate Z defined by rX∙Z rY∙Z. For example, if the ITCV is .2 and the observed covariate with the strongest impact has correlations of rX∙Z =.6 and rY∙Z=.17 with rX∙ZrY∙Z=.6x.17=.1 then the impact of an unobserved covariate would have to be twice as strong as the impact of the observed covariate to change the inference.

###Normative

In Frank et al (2013) we quantified the RIR for studies published in Education, Evaluation and Policy Analysis  July 24-Nov 15 2012.  The median value for observational studies and randomized experiments was about 35%.  RIR values in a new study higher than about 33% would imply a more robust inference than as published in EEPA in the interval given. Several notes apply:
- Comparisons across studies are best done using RIR (in terms of a correlation metric – see Frank et al., 2013).  The ITCV does not compare as directly because different standard errors are used for inference in different studies.
- We are currently updating this analysis. 
- Distributions may vary by discipline and journal.

### Absolute

In terms of a debate between a researcher and a skeptic, and RIR of 50% would allow the researcher to retain one observed case for each case that must be replaced with the skeptic’s hypothetical case for which the treatment has no effect.

### Probability

The ITCV can be converted into a probability of observing an impact of a given size from within the reference distribution of observed impacts.  This is described in:
Frank, K. A. 2000. “Impact of a Confounding Variable on a Regression Coefficient.”  Sociological Methods and Research, 29(2), 147-194.
Pan, W., and Frank, K.A. 2004. "An Approximation to the Distribution of the Product of Two Dependent Correlation Coefficients." Journal of Statistical Computation and Simulation, 74, 419-443
Pan, W., and Frank, K.A., 2004. "A probability index of the robustness of a causal inference," Journal of Educational and Behavioral Statistics, 28, 315-337.
Pan, W. (2009). A SAS/IML macro for computing percentage points of Pearson distributions. Journal of Statistical Software, 31(Code Snippet 2), 1-6.

The RIR can be expressed as a probability from a Bayesian perspective
*Frank, K. A. and *Min, K. 2007. Indices of Robustness for Sample Representation. Sociological Methodology.  Vol 37, 349-392. * co first authors.
Li, Tenglong, Frank, K.A., (forthcoming). The probability of a robust inference for internal validity. Sociological Methods and Research. https://doi.org/10.1177/0049124120914922


Other techniques for Sensitivity Analysis
For a review of techniques for sensitivity analysis, see Frank et al., 2023.

### Oster’s Coefficient of Proportionality

The conceptualization is that coefficient stability when observed covariates are added to a model anticipates stability if unobserved covariates were added to the model.  This is in the context of a fixed R2 that can be achieved even when unobserved covariates are added. The intuition is valuable, but Oster’s calculation is somewhat inaccurate and relies on assumptions about a baseline model.  For an exact calculation that makes fewer assumptions see Quantifying Sensitivity to Selection on Unobservables: Refining Oster’s Coefficient of Proportionality.

R code for coefficient of proportionality
install.packages("devtools")
devtools::install_github("jrosen48/KonFound")
library(KonFound)
pKonFound(est_eff = .125, std_err = .050, n_obs = 6265, sdx = .217, sdy = .991, R2 = .251, eff_thr = 0, FR2max = .61, index = "COP", to_return = "raw_output")
Oster, E. (2019). Unobservable selection and coefficient stability: Theory and evidence. Journal of Business & Economic Statistics, 37(2), 187-204. 

### Cinelli and Hazlett’s Robustness Value

Cinelli and Hazlett conceptualize robustness in terms of variance explained in X and Y by omitted variables Z.  The calculations are exact and appeal to intuition based on partial R2.  They can be applied to a threshold defined by inference (accounting for standard error) or an effect size. Cinelli and Hazlett (2020) critique ITCV because it does not directly adapt to thresholds other than statistical significance. We responded in Frank et al., 2023 by noting that sensitivity analyses that focus on an effect size threshold implicitly assume the standard error does not change when omitted variables are included in a model.  We make this explicit for both the ITCV and RIR perspective in Frankl et al., 2023.  Frank (2000) shows that this assumption maximizes the impact (favoring the challenger) for inferences based on statistical significance. 
We also note that under the assumption that  (as in Cinelli and Haslett, page 51)
 .
That is, under the assumption  , the partial correlation that is the basis of the ITCV translates directly to a regression coefficient through  .
R code for sensitivity while preserving the standard error at: 
install.packages("devtools")
devtools::install_github("jrosen48/KonFound")
library(KonFound)
pKonFound(est_eff = .125, std_err = .050, n_obs = 6300, sdx = .217, sdy = .991, R2 = .251, eff_thr = 0, FR2max = .61, index = "PSE", to_return = "raw_output")

Frank, K.A., Lin, Q., Xu, R., Maroulis, S.J., Mueller, A. (2023). Quantifying the Robustness of Causal Inferences: Sensitivity Analysis for Pragmatic Social Science.  Social Science Research.
Cinelli, C., & Hazlett, C. (2020). Making sense of sensitivity: Extending omitted variable bias. Journal of the Royal Statistical Society: Series B (Statistical Methodology), 82(1), 39-67

### Vanderweel E-Value

The E-value quantifies the conditions necessary to reduce an estimated effect on a dichotomous outcome to 0.  The conceptualization is elegant and the technique exact.  Frank et al (2021) evaluates the case switches (from treatment success to treatment failure) necessary to reduce an estimated effect below any threshold, including statistical significance by drawing on the Fragility Index.  Frank et al., (2021) then shows that Fragility can be interpreted in terms of RIR, linking to the application of RIR in other contexts through the potential outcomes framework. See also Baer et al. (2021a, 2021b) for a Bayesian interpretation. Calculations can be done for logistic regression or 2x2 table at: http://KonFound-it.com

- Baer, B. R., Gaudino, M., Charlson, M., Fremes, S. E., & Wells, M. T. (2021a). Fragility indices for only sufficiently likely modifications. Proceedings of the National Academy of Sciences, 118(49).	
- Baer, B. R., Fremes, S. E., Gaudino, M., Charlson, M., & Wells, M. T. (2021b). On clinical trial fragility due to patients lost to follow up. BMC medical research methodology, 21(1), 1-11.
- Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., ... & Zhang, L. 2021. Hypothetical case replacement can be used to quantify the robustness of trial results. Journal of Clinical Epidemiology, 134, 150-159. (authors listed alphabetically.)
- VanderWeele, T. J., and Arah, O. A. (2011). Bias formulas for sensitivity analysis of unmeasured confounding for general outcomes, treatments, and confounders. Epidemiology (Cambridge, Mass.), 22(1), 42-52.
- VanderWeele, T. J., and Ding, P. (2017). Sensitivity analysis in observational research: introducing the E-value. Annals of internal medicine, 167(4), 268-274.

---

## Appendix A: Background Readings

- Frank, K. (2000). Impact of a confounding variable on the inference of a regression coefficient. *Sociological Methods and Research, 29*(2), 147-194. [{{< awesome fas fa-file-pdf >}} PDF](/page/publications/frank-2000.pdf) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/0049124100029002001)
- Frank, K.A., Lin, Q., Xu, R., Maroulis, S.J., Mueller, A. (2023). Quantifying the robustness of causal inferences: Sensitivity analysis for pragmatic social science. *Social Science Research, 110*, 102815. [{{< awesome fas fa-file-pdf >}} PDF](/page/publications/frank-lin-xu-maroulis-mueller-2023.pdf) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.ssresearch.2022.102815)
- Frank, K. A., Maroulis, S. J., Duong, M. Q., & Kelcey, B. M. (2013). What would it take to change an inference? Using Rubin’s causal model to interpret the robustness of causal inferences. *Educational Evaluation and Policy Analysis, 35*(4), 437-460. [{{< awesome fas fa-file-pdf >}} PDF](/page/publications/frank-maroulis-duong-kelcey-2013.pdf) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.3102/0162373713493129)
- Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., Hayter, C. S., Mahmoud, R. A., Kolak, M., Dietz, T., & Zhang, L. (2021). Hypothetical case replacement can be used to quantify the robustness of trial results. *Journal of Clinical Epidemiology, 134*, 150-159. (authors listed alphabetically.) [{{< awesome fas fa-file-pdf >}} PDF](/page/publications/frank-et-al-2021.pdf) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1016/j.jclinepi.2021.01.025)
- Xu, R., Frank, K. A., Maroulis, S. J., & Rosenberg, J. M. (2019). konfound: Command to quantify robustness of causal inferences. *The Stata Journal, 19*(3), 523–550. [{{< awesome fas fa-file-pdf >}} PDF](/page/publications/xu-frank-maroulis-rosenberg-2019.pdf) | [{{< awesome fas fa-globe >}} Web](https://doi.org/10.1177/1536867X19874223)
- [Main introductory slides for combined frameworks](https://www.dropbox.com/scl/fi/jfhwfuim4d001usup81c8/quantifying-the-robustness-of-causal-inferences-combined-frameworks-for-stat-horizons-July-23.pptx?rlkey=32srefdir2q6r9pq5998i1q1b&dl=0)

---

## Appendix B: Software

### R

{{< awesome fas fa-code >}}

```
install.packages("KonFound")
library(KonFound)
pkonfound(est_eff = -9.01, std_err = .68, n_obs = 7639, n_covariates = 221)
```

### Stata

{{< awesome fas fa-code >}}

```
ssc install konfound
ssc install indeplist
ssc install moss
ssc install matsort
pkonfound -9.01 .68 7639 221
```

### KonFound-It Shiny App

{{< awesome fas fa-globe >}} 

- https://konfound-project.shinyapps.io/konfound-it/

### Spreadsheets

{{< awesome fas fa-table >}}

- [KonFound-It! spreadsheet for calculating indices](https://docs.google.com/spreadsheets/d/1AELZ9mA0wrhMZNJYTTudeztVAJjHncl4/edit?usp=sharing&ouid=116345913183792066499&rtpof=true&sd=true)
- [KonFound-It! spreadsheet for nonlinear replacement (beta)](https://drive.google.com/file/d/19eJ0C6P0XwaG6FDsO6FVAxP-evg-HUPz/view?usp=sharing)
