---
title: Use Case 1
subtitle: Generalized Robustness of Inference to Replacement (RIR)
comments: false
---



{{< hero-box heading="How believable are the effects of a growth mindset intervention?" >}}

![Students in a classroom](/img/classroom.jpg)

{{< /hero-box >}}



## Background

{{< feature-card >}}

### "A National Experiment Reveals Where a Growth Mindset Improves Achievement" (Yeager et al., 2019)

*Nature, Volume 573*, pages 364–369

> **Abstract:** A global priority for the behavioural sciences is to develop cost-effective, scalable interventions that could improve the academic outcomes of adolescents at a population level, but no such interventions have so far been evaluated in a population-generalizable sample. Here we show that a short (less than one hour), online growth mindset intervention—which teaches that intellectual abilities can be developed—improved grades among lower-achieving students and increased overall enrolment to advanced mathematics courses in a nationally representative sample of students in secondary education in the United States. Notably, the study identified school contexts that sustained the effects of the growth mindset intervention: the intervention changed grades when peer norms aligned with the messages of the intervention. Confidence in the conclusions of this study comes from independent data collection and processing, pre-registration of analyses, and corroboration of results by a blinded Bayesian analysis.

{{< button href="https://www.nature.com/articles/s41586-019-1466-y" >}}
  {{< awesome fas fa-book-open >}} Read Yeager et al. (2019) →
{{< /button >}}

{{< /feature-card >}}


In this study, Yeager et al. (2019), addressed a critical challenge in adolescent development and secondary education: roughly 20% of high school students in the United States fail to graduate on time. Non-completion puts these young adults at a substantially higher risk of poverty, poor health, and early mortality in adulthood. The transition into secondary school—specifically the ninth grade—is a vulnerable period where student grades frequently decline and often never recover. Underperforming early or opting out of rigorous coursework leaves students ill-prepared for college, university, or advanced academic classes later on. 

While educational researchers aim to create low-cost, scalable interventions to improve adolescent achievement, previous multi-session classroom workshops led by highly trained adults were difficult to scale at a population level. 

We need to understand precisely where and for whom short, online interventions work. Yeager et al.'s (2019) study provided key insights, but stakeholders might desire increased assurance that investing in Yeager et al.'s (2019) intervention would be worthwile.



---

## How Sensitivity Analysis Helps

Sensitivity analysis can help provide additional assurance to statistical conclusions. That is, this approach helps researchers, administrators, policymakers, and other stakeholders make informed decisions by evaluating the robustness of statistical inferences.

{{< feature-card >}}

In this specific case, Yeager et al. (2019, p. 366) found that the estimated effect of a **growth mindset intervention** in a randomized controlled trial (RCT) on core course GPA among lower-achieving adolescents was **0.10 grade points** (95% confidence interval = 0.04, 0.16; standard error = 0.03; sample size = 6,320; *t* = 3.51; *p* = 0.001). 

Conducting sensitivity analysis on these findings produces **RIR = 2,603**, which can be interpreted as:

> To nullify the inference that the estimated effect of the growth mindset intervention is 0.10 grade points, **41.2%** of the cases (or **2,603 students**) would have to be due to bias. In other words, to nullify the inference, one would expect to have to replace 41.2% of the observed students with students for whom the treatment effect is zero.

{{< /feature-card >}}

With this insight from RIR, stakeholders can decide how confident they are to proceed with adopting the growth mindset intervention.



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
pkonfound(est_eff = 0.10, 
          std_err = 0.03,
          n_obs = 6320)
```

{{< /feature-card >}}

{{< endcolumns >}}



{{< feature-card >}}

### For detailed, step-by-step instructions of this RIR use case, read [A Practical Guide](/page/guide) (**pages 36-45**).

{{< button href="/page/guide" >}}
  {{< awesome fas fa-book-reader >}} Follow the guide →
{{< /button >}}

{{< /feature-card >}}



---

## Take a Deeper Dive

{{< feature-card >}}

### {{< awesome fas fa-book-open >}} Read Frank et al. (2013)

**Frank, K. A., Maroulis, S. J., Duong, M. Q., & Kelcey, B. M. (2013).** What would it take to change an inference? Using Rubin’s causal model to interpret the robustness of causal inferences. *Educational Evaluation and Policy Analysis, 35*(4), 437-460.

{{< columns >}}

{{< button href="https://doi.org/10.3102/0162373713493129" >}}
  {{< awesome fas fa-globe >}} Read the web version →
{{< /button >}}

{{< column >}}

{{< button href="https://drive.google.com/file/d/1aGhxGjvMvEPVAgOA8rrxvA97uUO5TTMe/view" >}}
  {{< awesome fas fa-file-pdf >}} Read the PDF version →
{{< /button >}}

{{< endcolumns >}}

{{< /feature-card >}}



{{< feature-card >}}

### {{< awesome fas fa-video >}} Watch Frank (2025)

Statistical Horizons: *Quantifying Sensitivity in Causal Inference with Kenneth Frank*

<div class="embed-responsive embed-responsive-16by9" style="margin-top: 15px;">
  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/cIEHaBQRUZk" allowfullscreen></iframe>
</div>

{{< /feature-card >}}
