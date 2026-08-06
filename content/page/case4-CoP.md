---
title: Use Case 4
subtitle: Coefficient of Proportionality (CoP)
comments: false
math: true
---



{{< hero-box heading="How robust is the link between low birthweight and childhood IQ when accounting for unobserved selection?" >}}

![Photo of a small newborn baby's hand wrapped around an adult's finger](/img/baby.jpg)

{{< /hero-box >}}



## Background

{{< feature-card >}}

### "Unobservable Selection and Coefficient Stability: Theory and Evidence" (Oster, 2019)

*Journal of Business & Economic Statistics, Volume 37*, Issue 2, pages 187-204

> **Abstract:** A common approach to evaluating robustness to omitted variable bias is to observe coefficient movements after inclusion of controls. This is informative only if selection on observables is informative about selection on unobservables. Although this link is known in theory in existing literature, very few empirical articles approach this formally. I develop an extension of the theory that connects bias explicitly to coefficient stability. I show that it is necessary to take into account coefficient and R-squared movements. I develop a formal bounding argument. I show two validation exercises and discuss application to the economics literature. Supplementary materials for this article are available online.

{{< button href="https://doi.org/10.1080/07350015.2016.1227711" >}}
  {{< awesome fas fa-book-open >}} Read Oster (2019) →
{{< /button >}}

{{< /feature-card >}}


In this study, Oster (2019) evaluated the long-term cognitive implications of adverse birth conditions using data from the National Longitudinal Survey of Youth (NLSY). Because low birthweight and preterm status can affect childhood development and schooling outcomes, establishing a reliable inference is critical for targeting prenatal healthcare and postnatal educational supports.

Across the intermediate regression model evaluated in the study, respondents who experienced low birthweight and preterm birth showed a statistically significant negative relationship with IQ scores, even after controlling for seven maternal and background characteristics. 

Because observational surveys cannot randomly assign birthweight or gestational age, researchers and policymakers evaluating these findings need a transparent way to determine whether this relationship could be explained away by omitted confounding variables.



---

## How Sensitivity Analysis Helps

Sensitivity analysis helps researchers, policymakers, and other stakeholders evaluate the robustness of statistical inferences against potential omitted variables. Specifically, the Coefficient of Proportionality (COP) quantifies how strong selection on unobserved covariates would have to be, relative to selection on observed covariates, to nullify an estimated treatment effect. Recasting the COP within a correlational framework expresses these selection processes as intuitive, scale-free correlations.

{{< feature-card >}}

In this specific case, Oster (2019) found the estimated effect of **low birthweight and preterm status** on **childhood IQ** in the intermediate model to be **-0.125** (standard error = 0.05049; sample size = 6,174; number of covariates = 7; standard deviation of predictor = 0.217; standard deviation of outcome = 0.991; $R^2$ = 0.251).

Conducting a correlation-based sensitivity analysis on these findings, setting the effect threshold to invalidate the inference to 0 ($\beta^\\#$ = 0) with an assumed maximum explainable outcome variance of 0.61 ($R_{max}$ = 0.61), produces a **COP ($\delta$) of 0.583**, which can be interpreted as:

> To nullify the estimated effect of low birthweight and preterm status on IQ (reducing the coefficient to 0 with a maximum $R^2$ of 0.61), selection on unobserved covariates would have to be **58.3% as strong** as selection on the observed covariates ($\delta$ = 0.583). In terms of zero-order component correlations, an omitted confounding variable would need to be correlated at $r_{X \cdot CV}$ = 0.045 with low birthweight/preterm status and at $r_{Y \cdot CV}$ = 0.600 with IQ. Together, this requires a confounding impact ($r_{X \cdot CV} \times r_{Y \cdot CV}$) of 0.027 (0.045 * 0.600 = 0.027), which is roughly 70% of the combined impact of all seven observed covariates (0.078 * 0.500 = 0.039).<br><br>
Notably, this scale-free correlational COP ($\delta$ = 0.583) is less than half of Oster's originally reported two-stage estimate ($\delta_{Oster}$ = 1.37).<br><br>
While Oster's original index suggested that unobserved selection would need to be more than one-third stronger than observed selection to overturn the estimate, the correlation-based framework reveals that an omitted variable with only modest selection strength relative to the observed controls could explain away the relationship.<br><br>
This comparison serves as a warning against false confidence in statistical robustness. If a researcher relies solely on Oster’s (2019) original score (1.37), they might conclude that the link between low birthweight and IQ is rock-solid, assuming an unobserved confounder would need to be unrealistically powerful (more influential than all seven included controls combined) to erase the result.<br><br>
However, the updated, correlation-based approach shows that an omitted variable does not need to be an all-around giant; it simply needs a strong tie to a child's IQ alongside a very slight connection to birthweight (such as unmeasured parental cognitive ability or early nutritional environment) to completely wash away the effect. Ultimately, this means the estimated effect of low birthweight on IQ is much more fragile, and much easier to explain away through hidden bias, than standard robustness metrics would lead a reader to believe.

{{< /feature-card >}}

By recasting the Coefficient of Proportionality within a transparent correlational framework, stakeholders can directly compare the required correlation of an unobserved confounding variable against the explanatory power of all seven known covariates (denoted as $R_{X \cdot Z}$ = 0.078). This prevents overstating the robustness of observational claims and provides policymakers with a clearer basis for weighing evidence.



---

## Explore for Yourself

{{< columns >}}

{{< feature-card >}}

### Input the numbers into the interactive web interface:

{{< button href="https://konfound-project.shinyapps.io/konfound-it/" >}}
  {{< awesome fas fa-calculator >}} Use the R Shiny app →
{{< /button >}}

{{< /feature-card >}}


{{< column >}}


{{< feature-card >}}

### Or, run the code directly in R:

```
library(konfound)
pkonfound(est_eff = -0.125,
          std_err = 0.05049,
          n_obs = 6174,
          n_covariates = 7,
          sdx = 0.217,
          sdy = 0.991,
          R2 = 0.251,
          eff_thr = 0,
          FR2max = 0.61,
          index = 'COP')
```

{{< /feature-card >}}

{{< endcolumns >}}



---

## Take a Deeper Dive

{{< feature-card >}}

### {{< awesome fas fa-book-open >}} Read Frank et al. (2026)

**Frank, K. A., Lin, Q., Maroulis, S., Dai, S., Choi, J., Jess, N., Lin, H.-C., Liu, Y., Maestrales, S., Searle, E., and Tait, J. (2026).** Quantifying sensitivity to selection on unobserved covariates: Recasting the coefficient of proportionality within a correlational framework. *Journal of Educational and Behavioral Statistics*.

{{< button href="https://doi.org/10.3102/10769986261422704" >}}
  {{< awesome fas fa-globe >}} Read the web version →
{{< /button >}}

{{< /feature-card >}}
