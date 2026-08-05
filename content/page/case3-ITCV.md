---
title: Use Case 3
subtitle: Impact Threshold of a Confounding Variable (ITCV)
comments: false
---



{{< hero-box heading="How robust is the link between a recent eviction and material hardship?" >}}

![Photo centered on a single, weather-worn apartment door set into a brick wall halfway up a metal staircase](/img/door.jpg)

{{< /hero-box >}}



## Background

{{< feature-card >}}

### "Eviction's Fallout: Housing, Hardship, and Health" (Desmond & Kimbro, 2015)

*Social Forces, Volume 94*, pages 295-324

> **Abstract:** Millions of families across the United States are evicted each year. Yet, we know next to nothing about the impact eviction has on their lives. Focusing on low-income urban mothers, a population at high risk of eviction, this study is among the first to examine rigorously the consequences of involuntary displacement from housing. Applying two methods of propensity score analyses to data from a national survey, we find that eviction has negative effects on mothers in multiple domains. Compared to matched mothers who were not evicted, mothers who were evicted in the previous year experienced more material hardship, were more likely to suffer from depression, reported worse health for themselves and their children, and reported more parenting stress. Some evidence suggests that at least two years after their eviction, mothers still experienced significantly higher rates of material hardship and depression than peers.

{{< button href="https://doi.org/10.1093/sf/sov044" >}}
  {{< awesome fas fa-book-open >}} Read Desmond & Kimbro (2015) →
{{< /button >}}

{{< /feature-card >}}


In this study, Desmond and Kimbro (2015) evaluated the consequences of involuntary housing displacement among low-income urban mothers. Millions of families across the United States experience eviction each year, yet empirical understanding of its aftermath has historically been limited. By applying propensity score analysis to national survey data, the authors examined whether eviction negatively affects mothers across multiple well-being domains.

Across all models evaluated in the study, Desmond and Kimbro (2015) identified a large and robust relationship between a recent eviction and material hardship. Regardless of the estimation technique used, respondents who experienced an eviction in the previous year reported around one standard deviation higher material hardship compared to matched mothers who were not evicted.

Because observational studies cannot randomly assign eviction, stakeholders and policymakers evaluating these findings might desire increased assurance that this strong relationship is not driven by an unobserved or omitted confounding variable.



---

## How Sensitivity Analysis Helps

Sensitivity analysis helps researchers, policymakers, and other stakeholders evaluate the robustness of statistical inferences against potential omitted variables. Specifically, the Impact Threshold of a Confounding Variable (ITCV) quantifies how strong the impact of an unmeasured confounder must be—in terms of its correlation with both the treatment and the outcome—to nullify a statistically significant inference.

{{< feature-card >}}

In this specific case, Desmond and Kimbro (2015) found that the estimated effect of a **recent eviction** on women's **material hardship** using propensity score matching was 1.02 standard deviations (standard error = 0.29; *t* = 3.52; *p* < 0.01; sample size = 122; number of covariates = 41), based on a threshold of 0.219 for statistical significance (alpha = 0.05).

Conducting sensitivity analysis on these findings produces an **ITCV impact of 0.191** (derived from component correlations of 0.437 with the outcome and 0.437 with the predictor of interest), which can be interpreted as:

> To nullify the inference of the estimated effect of a recent eviction on material hardship, an omitted, confounding variable would have to be correlated at 0.439 with the eviction and at 0.439 with the material hardship. In other words, the impact of an omitted variable must be 0.191 (0.437 * 0.437 = 0.191) to reduce the estimate below the threshold effect of 0.219 for statistical significance at the level of alpha = 0.05. In other words, if the link between a recent eviction and material hardship is just a false alarm caused by some missing, unmeasured factor, that hidden factor would have to be very strongly tied to both eviction and material hardship.<br><br>
Unless a powerful unobserved factor is simultaneously driving both the likelihood of eviction and the level of material hardship by a substantial amount, the conclusion that eviction increases material hardship remains statistically sound. In social science, a correlation of 0.437 is quite high, so it is unlikely that the researchers forgot to measure a single hidden variable that is so strongly connected to both eviction and hardship.

{{< /feature-card >}}

With these insights from the ITCV, stakeholders can see exactly how strong an unobserved confounding variable would need to be to convince them to overturn the conclusion that recent eviction increases material hardship. This in turn, can add confidence when moving from looking at research findings to making policy decisions.



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
pkonfound(est_eff = 1.02,
          std_err = 0.29,
          n_obs = 122,
          n_covariates = 41,
          index = 'IT')
```

{{< /feature-card >}}

{{< endcolumns >}}



{{< feature-card >}}

### For detailed, step-by-step instructions of this RIR use case, read [A Practical Guide](/page/guide) (**pages 11-27**).

{{< button href="/page/guide" >}}
  {{< awesome fas fa-book-reader >}} Follow the guide →
{{< /button >}}

{{< /feature-card >}}



---

## Take a Deeper Dive

{{< feature-card >}}

### {{< awesome fas fa-book-open >}} Read Frank (2000)

**Frank, K. (2000).** Impact of a confounding variable on the inference of a regression coefficient. *Sociological Methods and Research, 29*(2), 147-194. 

{{< columns >}}

{{< button href="https://doi.org/10.1177/0049124100029002001" >}}
  {{< awesome fas fa-globe >}} Read the web version →
{{< /button >}}

{{< column >}}

{{< button href="https://drive.google.com/file/d/1F7oGYZ8SS8hnZxSI3Dch_w65Qz6KIRdI/view" >}}
  {{< awesome fas fa-file-pdf >}} Read the PDF version →
{{< /button >}}

{{< endcolumns >}}

{{< /feature-card >}}
