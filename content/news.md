---
title: News
subtitle: Latest Updates from the KonFound-It! Team
comments: false
---



## Latest News

![Newspapers on a News Stand](/img/news-wide.png)



---



### Announcing the NEW AND IMPROVED KonFound-it app and upcoming workshops

**12/19/2024**
 
Happy holidays to you!
 
We have released new versions of the {{< awesome fas fa-box-open >}} **konfound package** in R (1.0.2) and in Stata. New and updated features include:

- **Conditional Robustness of Inference for Replacement (CRIR)** in which there is no relationship between predictor and outcome in the replacement data conditional on other terms in the model (e.g., for use with interaction effects when models include main effects as applied in diff in diff).
- **2x2 and logistic regression added to Stata** (already in R). 
  - More options for Fragility index (e.g., `switch_trm`)
- **Unconditional Impact Threshold for a Confounding Variable** is provided when possible.
  - See Lonati, S., & Wulff, J. N. (2024). [Hic Sunt Dracones: On the risks of comparing the ITCV with control variable correlations](https://journals.sagepub.com/doi/pdf/10.1177/01492063241293126). *Journal of Management*. DOI: 10.1177/01492063241293126
- [**Coefficient of Proportionality**](https://www.dropbox.com/scl/fi/s63onxsg6yoga5of9nd42/Quantifying-Sensitivity-to-Selection-on-Unobserved-Covariates-2024-distribute.pdf?rlkey=4yyxd9p3ej605n77vrbqq6pq3&e=1&dl=0) – how strong would selection on unobserved covariates have to be relative to observed covariates to nullify an estimated effect. `index = "COP"`
- **Directly specify a threshold for inference** (other than statistical significance) via `eff_thr`
- **Specify a non-zero null hypothesis** for significance testing via nu
- **Application to What Works Clearinghouse** [**Benchmarks**](https://konfound-project.shinyapps.io/wwc-sensitivity-benchmark/) for educational research
- All raw results provided (in R, `to_return = "raw"`, in Stata use `"return list"` after command)
- Improved statements in print out
- Improved [**KonFound-It app**](https://konfound-project.shinyapps.io/konfound-it/) interface: https://konfound-project.shinyapps.io/konfound-it/

Read an overview of the package at https://konfound-it.org/konfound/ and read through the [Introduction to konfound](https://konfound-it.org/konfound/articles/introduction-to-konfound.html) vignette.



---



### Next Workshop

{{< awesome fas fa-business-time >}} Sign up today for the next KonFound-It project workshop 
facilitated by Dr. Ken Frank: [Sensitivity Analysis for Causal Inference](https://statisticalhorizons.com/seminars/sensitivity-analysis-causal-inference/).
The workshop will take place fully online March 5&#8211;6, 2025 (10:30am&#8211;12:30pm and 1:00pm&#8211;3:00pm Eastern time both days).



---



### Podcast on Sensitivity Analysis

{{< awesome fas fa-podcast >}} Also, be sure to check out an AI-generated podcast, 
created by Google's [NotebookLM](https://notebooklm.google.com/), 
discussing the KonFound-It! team's article "Quantifying the robustness of causal inferences: 
Sensitivity analysis for pragmatic social science" in *Social Science Research* 
([Frank, Lin, Xu, Maroulis, & Mueller, 2023](https://doi.org/10.1016/j.ssresearch.2022.102815)): 

{{< audio src="/audio/frank-et-al-2023-podcast.wav" >}}

