---
title: Use Case 2
subtitle: Logistic Regression with a Dichotomous Outcome
comments: false
---



{{< hero-box heading="How convincing is the link between cohabitation and poverty?" >}}

![Aerial view of city housing in apartment highrises](/img/houses.jpg)

{{< /hero-box >}}



## Background

{{< feature-card >}}

### "Marriage, Work, and Racial Inequalities in Poverty: Evidence from the U.S" (Thiede et al., 2017)

*Journal of Marriage and Family, Volume 79*, pages 1241–1257

> **Abstract:** This paper explores recent racial and ethnic inequalities in poverty, estimating the share of racial poverty differentials that can be explained by variation in family structure and workforce participation. The authors use logistic regression to estimate the association between poverty and race, family structure, and workforce participation. They then decompose between-race differences in poverty risk to quantify how racial disparities in marriage and work explain observed inequalities in the log odds of poverty. They estimate that 47.7–48.9% of black-white differences in poverty risk can be explained by between-group variance in these two factors, while only 4.3–4.5% of the Hispanic-white differential in poverty risk can be explained by these variables. These findings underscore the continued association between racial disparities in poverty and those in labor and marriage markets. However, clear racial differences in the origin of poverty suggest that family- and worked-related policy interventions will not have uniformly effective or evenly distributed impacts on poverty reduction.

{{< button href="https://doi.org/10.1111/jomf.12427" >}}
  {{< awesome fas fa-book-open >}} Read Thiede et al. (2017) →
{{< /button >}}

{{< /feature-card >}}


When evaluating causal inferences with binary or dichotomous outcomes (e.g., poor vs. not poor; graduated vs. dropped out), researchers typically rely on logistic regression models. To evaluate the robustness of a statistically significant log-odds coefficient against potential unobserved confounding or sample replacement, we apply Robustness of Inference to Replacement (RIR) for logistic models.

In this use case, we examine the empirical findings from Thiede et al. (2017), who investigated racial and ethnic inequalities in poverty across the United States. Specifically, we focus on their estimated effect of cohabitation (compared with being married) on the likelihood of living in poverty among Hispanic households.

Importantly, note that the predictor and outcome variables in this case are categorical (in fact, binary: cohabiting vs. married; poor vs. not poor), in contrast to the continuous variables in [Use Case 1: Generalized Robustness of Inference to Replacement](/page/case1-RIR).



---

## How Sensitivity Analysis Helps

Sensitivity analysis provides essential context and, often, a necessary reality check for statistical conclusions. In this case, it helps demographers, social scientists, and family policymakers avoid over-interpreting a statistically significant link between family structure and poverty. Evaluating the robustness of logistic regression inferences ensures more cautious, nuanced, and evidence-based policy discussions.

{{< feature-card >}}

In this specific case, Thiede et al. (2017) found that the estimated effect of **cohabitation** (compared with being married) on the likelihood of **living in poverty** among Hispanic households was **0.388 in log-odds** (standard error = 0.139; sample size = 14,082; number of covariates = 23; number of cases in the treatment condition = 1,267).

Conducting sensitivity analysis on these findings produces **Fragility = 6; RIR = 7**, which can be interpreted as:

> Although the total sample size is large (14,082 households), the baseline inference relies on the specific distribution of outcomes within the 1,267 cohabiting households. To overturn the statistically significant finding that cohabiting households are more likely to live in poverty than married households, there are two key considerations: fragility and RIR.<br><br>
**Fragility** is tied to **outcome transfer**. To overturn the conclusion, you would only need to reclassify 6 cohabiting households currently living in poverty as not living in poverty. That is, if 6 cohabiting families in the dataset who were recorded as poor had actually been above the poverty line, the apparent link between cohabitation and poverty would no longer be statistically significant.<br><br>
**RIR** is tied to **case replacement**. To overturn the finding, you would need to replace 7 cohabiting families living in poverty (which represents 11.29% of all poor cohabiting families in the sample) with hypothetical families who have the same high probability of not being in poverty (96.62%) as married families.

{{< /feature-card >}}

With these insights, stakeholders can observe that the apparent effect of cohabitation on Hispanic household poverty is highly sensitive to small sample changes (RIR = 7), and they can then decide how confident they are in basing family and socioeconomic policy decisions on the apparent link between cohabitation and poverty.



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
pkonfound(est_eff = 0.388,
          std_err = 0.139,
          n_obs = 14082,
          n_covariates = 23,
          n_treat = 1267,
          model_type = "logistic")
```

{{< /feature-card >}}

{{< endcolumns >}}



{{< feature-card >}}

### For detailed, step-by-step instructions of this RIR use case, read [A Practical Guide](/page/guide) (**pages 56-66**).

{{< button href="/page/guide" >}}
  {{< awesome fas fa-book-reader >}} Follow the guide →
{{< /button >}}

{{< /feature-card >}}



---

## Take a Deeper Dive

{{< feature-card >}}

### {{< awesome fas fa-book-open >}} Read Frank et al. (2021)

**Frank, K. A., Lin, Q., Maroulis, S., Mueller, A. S., Xu, R., Rosenberg, J. M., Hayter, C. S., Mahmoud, R. A., Kolak, M., Dietz, T., & Zhang, L. (2021).** Hypothetical case replacement can be used to quantify the robustness of trial results. *Journal of Clinical Epidemiology, 134*, 150-159. (authors listed alphabetically.) 

{{< columns >}}

{{< button href="https://doi.org/10.1016/j.jclinepi.2021.01.025" >}}
  {{< awesome fas fa-globe >}} Read the web version →
{{< /button >}}

{{< column >}}

{{< button href="https://www.dropbox.com/s/2dzkvalwmgr5v5z/Hypothetical%20case%20replacement%20can%20be%20used%20to%20quantify%20the%20robustness%20of%20trial%20results%20submit.docx?dl=0" >}}
  {{< awesome fas fa-file-pdf >}} Read the PDF version →
{{< /button >}}

{{< endcolumns >}}

{{< /feature-card >}}
