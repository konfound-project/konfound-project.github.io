---
title: News
subtitle: Latest Updates from the KonFound-It! Team
comments: false
---



## Latest News

![Newspapers on a News Stand](/img/news-wide.png)



---



### Quantifying Sensitivity in Causal Inference with Kenneth Frank (posted 02/19/25)

Watch Dr. Ken Frank give a one-hour introduction to sensitivity analysis as the opening of the upcoming "Sensitivity Analysis for Causal Inference" webinar for [Statistical Horizons](https://statisticalhorizons.com/seminars/sensitivity-analysis-causal-inference/) on March 5&#8211;6, 2025, . Dr. Frank introduces key concepts and sets the foundation for exploring robust causal inference techniques.

{{< youtube id="cIEHaBQRUZk" autoplay="false" color="white" >}}



---



### Next Workshop: Statistical Horizons (posted 01/13/25)

[Sensitivity Analysis for Causal Inference: Two Key Techniques for Quantifying the Robustness of Causal Inferences](https://statisticalhorizons.com/seminars/sensitivity-analysis-causal-inference/) 

**March 5&#8211;6, 2025** (10:30am&#8211;12:30pm and 1:00pm&#8211;3:00pm Eastern time both days). Virtual.

---

#### An 8-hour livestream seminar taught by Kenneth Frank, Ph.D.
 
**To get more information and register, click [here](https://statisticalhorizons.com/seminars/sensitivity-analysis-causal-inference/).**

---

*In just 8 hours (over 2 days), gain hands-on experience quantifying the sensitivity of a causal inference using two specialized techniques – Robustness of Inference to Replacement (RIR) and Impact Threshold for a Confounding Variable (ITCV)!*
 
Sensitivity analyses are a crucial tool for navigating the complexities of making inferences, especially when dealing with potential alternative explanations. Being able to quantify the impact of omitted variables or changes in data is key to robust and reliable research.
 
We will use RIR and ITCV to quantify the sensitivity of an inference. These techniques can be adapted to a range of analyses, including logistic regression, propensity-based approaches, and multilevel models.
 
**You will gain the skills to:**
- Apply and understand techniques for quantifying the robustness of causal inferences.
- Conduct sensitivity analyses in R or the on-line app https://konfound-project.shinyapps.io/konfound-it/ (Stata and Excel also available).
- Develop a deeper understanding of statistical control and the counterfactual framework as well as how threats to internal and external validity compare against the strength of evidence.
- Apply sensitivity analysis to a specific problem of interest that may require extensions or adaptations.
- Craft statements like: "An omitted variable would need to be correlated at ___ with the predictor and outcome to shift the inference.” or "To challenge the inference, replace __% of the data with counterfactual cases—no treatment effect." 
- Primary examples will be presented using the pkonfound command in R, but corresponding analyses can be done in Stata.
 
**Watch the [first hour](https://youtu.be/cIEHaBQRUZk?si=EqCIejRTi2r4sXGa) of this course on the Statistical Horizons YouTube channel!**

---

#### What do former participants have to say?
 
>The instructor really tried to simplify the concept/framework and make the course very practical. I loved the opportunity he gave us to actually bring our own projects and see how sensitivity analysis would play out.

 ~ *Felly Chiteng Kot, American University of Sharjah*
 
>I appreciated the clarity of exposition and the philosophy of the approach. I really liked that this course invited a conversation around causality.

 ~ *Giovanni Russo, Cedefop*

---

#### How does it work?

This seminar includes live lectures, hands-on exercise assignments, and plenty of chances to ask questions. Although we recommend joining the seminar live, you can also watch the recorded Zoom sessions whenever it's convenient for you. 
 
**Daily Schedule:** *All sessions are held live via Zoom. All times are ET (New York time).*
- 10:30am-12:30pm 
- 1:00pm-3:00pm
 
---

#### Registration is now [open](https://statisticalhorizons.com/seminars/sensitivity-analysis-causal-inference/).
 
If you have specific questions, please email info@statisticalhorizons.com. If you can't attend yourself, please forward to a colleague.

<br><br>



---



### Announcing the NEW AND IMPROVED KonFound-it app and upcoming workshops (posted 12/19/2024)
 
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



### Podcast on Sensitivity Analysis

{{< awesome fas fa-podcast >}} Also, be sure to check out an AI-generated podcast, 
created by Google's [NotebookLM](https://notebooklm.google.com/), 
discussing the KonFound-It! team's article "Quantifying the robustness of causal inferences: 
Sensitivity analysis for pragmatic social science" in *Social Science Research* 
([Frank, Lin, Xu, Maroulis, & Mueller, 2023](https://doi.org/10.1016/j.ssresearch.2022.102815)): 

{{< audio src="/audio/frank-et-al-2023-podcast.wav" >}}

