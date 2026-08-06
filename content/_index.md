---
title: KonFound-It!
subtitle: Quantify the robustness of causal inferences
comments: false
---

{{< hero-box heading="How strong must bias be to invalidate your research conclusions?" >}}
KonFound-It! provides interactive sensitivity analyses to help researchers, policy makers, and pragmatists evaluate the robustness of statistical inferences.

{{< columns >}}

{{< button href="https://konfound-project.shinyapps.io/konfound-it/" >}}
  {{< awesome fas fa-calculator >}} Explore with R Shiny App
{{< /button >}}

{{< column >}}

{{< button href="/page/videos" >}}
  {{< awesome fas fa-play-circle >}} Learn Sensitivity Analysis
{{< /button >}}

{{< endcolumns >}}
{{< /hero-box >}}

---

{{< feature-card >}}

## Why Sensitivity Analysis?

> The assumptions underlying statistical analysis are rarely fully met. Pragmatists face the challenge of knowing when evidence is strong enough to justify action—and that is where **sensitivity analysis** helps by expressing the robustness of inferences relative to potential biases.

KonFound-It! quantifies how much of an observed effect would need to be bias-driven to invalidate your research conclusions, bridging the gap between rigorous statistical theory and actionable real-world policy.

{{< /feature-card >}}



{{< feature-card >}}

## {{< awesome fas fa-lightbulb >}}  Examples of Sensitivity Analysis:

<br><br> 

{{< columns >}}

### {{< awesome fas fa-exchange-alt >}} Robustness of Inference to Replacement (RIR)

What proportion of our observed cases would we need to replace with "null effect" cases to change our minds?

{{< column >}}

### {{< awesome fas fa-square-root-alt >}} Impact Threshold for a Confounding Variable (ITCV)

How strongly must an omitted variable be correlated with the focal predictor (e.g., retention) and the outcome (e.g., reading achievement) to nullify an inference of an effect of the focal predictor on the outcome (e.g., retention on achievement)?

{{< endcolumns >}}

{{< /feature-card >}}





---

## Explore the KonFound-It! Ecosystem

{{< columns >}}

{{< feature-card >}}

### {{< awesome fas fa-newspaper >}} Project News
Read the latest release notes, upcoming workshop announcements, and research updates from the KonFound-It! team.

{{< button href="/news" >}}
  Read Latest News →
{{< /button >}}

{{< /feature-card >}}

{{< column >}}

{{< feature-card >}}

### {{< awesome fas fa-book-reader >}} FAQ
New to sensitivity analysis? Browse through our introductory tutorials, frequently asked questions, and practical research guides.

{{< button href="/page/faq" >}}
  Read the FAQ →
{{< /button >}}

{{< /feature-card >}}

{{< endcolumns >}}



{{< columns >}}

{{< feature-card >}}

### {{< awesome fas fa-users >}} Community Forum
Have questions about running a model or interpreting sensitivity indices? Connect with researchers and maintainers.

{{< button href="https://groups.google.com/g/konfound-it" >}}
  Join Google Group →
{{< /button >}}

{{< /feature-card >}}

{{< column >}}

{{< feature-card >}}

### {{< awesome fas fa-warehouse >}} WWC Benchmarks  
Explore sensitivity analyses calculated for the **What Works Clearinghouse (WWC)** through our dedicated interactive benchmark tool.

{{< button href="https://konfound-project.shinyapps.io/wwc-sensitivity-benchmark/" >}}
  Explore Benchmarks →
{{< /button >}}

{{< /feature-card >}}

{{< endcolumns >}}



---

## Install Packages for R & Stata

Prefer working directly in your statistical script? Get the latest development versions of the **konfound** package for your workflow:

{{< columns >}}

{{< feature-card >}}

### {{< awesome fab fa-r-project >}} R Package (GitHub Dev)
Install the latest development release directly from GitHub:

```r
install.packages("devtools")
devtools::install_github("konfound-project/konfound")
```

{{< button href="https://github.com/konfound-project/konfound/" >}}
R Package Details →
{{< /button >}}

{{< /feature-card >}}



{{< column >}}

{{< feature-card >}}

### {{< awesome fab fa-stripe-s >}} Stata Package (SSC)
Install the package and required dependencies directly from SSC:

```Stata
ssc install konfound, replace
ssc install indeplist, replace
ssc install moss, replace
ssc install matsort, replace
```

{{< button href="https://doi.org/10.1177/1536867X19874223" >}}
Stata Package Details →
{{< /button >}}

{{< /feature-card >}}


{{< endcolumns >}}
