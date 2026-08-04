---
title: News
subtitle: Latest Updates from the KonFound-It! Team
comments: false
---

![Newspapers on a News Stand](/img/news-wide.png)



---

{{< feature-card >}}
## {{< awesome fas fa-calendar-alt >}} Announcing Summer 2026 Workshop

#### Posted: April 6, 2026

We are excited to announce our upcoming topical workshop at the **ICPSR Summer Program in Quantitative Methods** (July 13–17, 2026):

* **Workshop Title:** *Sensitivity Analysis: Quantifying the Robustness of Inferences to Alternative Factors or Data*

{{< button href="https://konfound-it.org/page/workshops/" >}}
  {{< awesome fas fa-info-circle >}} Read More About Workshops →
{{< /button >}}
{{< /feature-card >}}

---

{{< feature-card >}}
## {{< awesome fas fa-chalkboard-teacher >}} Summer 2025 Workshops & Conference Presentations
#### Posted: April 7, 2025

Join the KonFound-It! team at several major conferences and training workshops throughout Summer 2025:

* **May 16, 2025 (Detroit, MI):** [Society for Causal Inference](https://sci-info.org/2025-meeting/) — *Multi-faceted Approaches to Sensitivity Analysis for Observational Studies* (10:15–11:45 AM ET).
* **July 28 – August 1, 2025:** [ICPSR Summer Program in Quantitative Methods](https://web.cvent.com/event/ab4981a1-0309-42dc-aa29-4ea347e1f24b/websitePage:17e8f24b-550c-4a09-a091-06ccd6f667d5) — *Sensitivity Analysis: Quantifying the Robustness of Inferences to Alternative Factors or Data*.
* **August 5, 2025 (Virtual/Hybrid):** [Society for Epidemiologic Research](https://epiresearch.org/annual-meeting/2025-meeting/2025-workshops/) — *What Would it Take to Change Your Inference? Quantifying the Discourse about Causal Inferences in Epidemiology* (12:00–4:00 PM ET).
* **August 6, 2025 (Nashville, TN):** [2025 Joint Statistical Meetings (JSM)](https://ww2.amstat.org/meetings/jsm/2025/) — *Quantifying Sensitivity to Selection on Unobserved Covariates: Recasting the Coefficient of Proportionality within a Correlational Framework* (10:30 AM–12:30 PM CT).
  * **Presenters:** Kenneth A. Frank, Qinyun Lin, & Spiro Maroulis.

> **JSM Abstract:** Sensitivity analyses can inform evidence-based education policy by quantifying the hypothetical conditions necessary to change an inference. Perhaps the most prevalent index used for sensitivity analyses is Oster’s (2019) Coefficient of Proportionality (COP). In this paper, we reconceptualize the COP as a function of unobserved covariates’ correlations with the focal predictor (e.g., treatment) and with the outcome. Our correlation-based approach addresses recent critiques of Oster’s COP while preserving the comparison of selection on unobserved covariates to selection on observed covariates.

{{< button href="https://www.dropbox.com/scl/fi/s63onxsg6yoga5of9nd42/Quantifying-Sensitivity-to-Selection-on-Unobserved-Covariates-2024-distribute.pdf?rlkey=4yyxd9p3ej605n77vrbqq6pq3&e=1&st=3schtjqu&dl=0" >}}
  {{< awesome fas fa-file-pdf >}} Read the Working Paper →
{{< /button >}}
{{< /feature-card >}}

---

{{< feature-card >}}
## {{< awesome fas fa-video >}} Quantifying Sensitivity in Causal Inference with Kenneth Frank
#### Posted: February 19, 2025

Watch Dr. Ken Frank give a one-hour introduction to sensitivity analysis as the opening of the "Sensitivity Analysis for Causal Inference" webinar for Statistical Horizons. Dr. Frank introduces key concepts and sets the foundation for exploring robust causal inference techniques.

{{< /feature-card >}}

{{< youtube id="cIEHaBQRUZk" >}}




---

{{< feature-card >}}
## {{< awesome fas fa-laptop-house >}} Next Workshop: Statistical Horizons Seminar
#### Posted: January 13, 2025

We are offering an 8-hour livestream seminar taught by Kenneth Frank, Ph.D., focusing on hands-on experience with **Robustness of Inference to Replacement (RIR)** and **Impact Threshold for a Confounding Variable (ITCV)**.

* **Dates:** March 5–6, 2025 (10:30 AM–12:30 PM & 1:00 PM–3:00 PM ET both days)
* **Format:** Virtual Livestream via Zoom (with recorded sessions available to registrants)

### What You Will Learn
* Apply and understand techniques for quantifying the robustness of causal inferences.
* Conduct sensitivity analyses using R, Stata, Excel, or the [KonFound-It! Shiny App](https://konfound-project.shinyapps.io/konfound-it/).
* Craft statements like: *"An omitted variable would need to be correlated at ___ with the predictor and outcome to shift the inference."*

### Participant Testimonials
> *"The instructor really tried to simplify the concept/framework and make the course very practical. I loved the opportunity he gave us to actually bring our own projects and see how sensitivity analysis would play out."*
> — **Felly Chiteng Kot**, *American University of Sharjah*

> *"I appreciated the clarity of exposition and the philosophy of the approach. I really liked that this course invited a conversation around causality."*
> — **Giovanni Russo**, *Cedefop*

{{< button href="https://statisticalhorizons.com/seminars/sensitivity-analysis-causal-inference/" >}}
  {{< awesome fas fa-external-link-alt >}} Register at Statistical Horizons →
{{< /button >}}
{{< /feature-card >}}

---

{{< feature-card >}}
## {{< awesome fas fa-box-open >}} Announcing the New & Improved KonFound-It! App & Package Updates
#### Posted: December 19, 2024

We have released updated versions of the **konfound package** in R (v1.0.2) and Stata! Key new features and enhancements include:

* **Conditional Robustness of Inference for Replacement (CRIR):** For use when models include main effects as applied in difference-in-differences or interaction models.
* **Expanded Stata Capabilities:** Added 2x2 tables and logistic regression models directly to the Stata command.
* **Unconditional ITCV:** Provided automatically when possible (see [Lonati & Wulff, 2024](https://journals.sagepub.com/doi/pdf/10.1177/01492063241293126)).
* **Coefficient of Proportionality (COP):** Calculate how strong selection on unobserved covariates would have to be relative to observed covariates (`index = "COP"`).
* **Custom Inference Thresholds:** Directly specify a threshold other than standard statistical significance via `eff_thr`, or specify a non-zero null hypothesis via `nu`.
* **WWC Benchmarks Integration:** Apply analyses directly to [What Works Clearinghouse Benchmarks](https://konfound-project.shinyapps.io/wwc-sensitivity-benchmark/).

{{< columns >}}
{{% feature-card %}}
#### Read the Documentation
Explore the full feature list and read our introductory vignette.

[Read R Vignette →](https://konfound-it.org/konfound/articles/introduction-to-konfound.html)
{{% /feature-card %}}

{{< column >}}

{{% feature-card %}}
#### Try the Updated Web App
Test out the redesigned interface in your browser.

[Launch Web App →](https://konfound-project.shinyapps.io/konfound-it/)
{{% /feature-card %}}
{{< endcolumns >}}

{{< /feature-card >}}

---

{{< feature-card >}}
## {{< awesome fas fa-podcast >}} Podcast on Sensitivity Analysis
#### Posted: September 30, 2024

Listen to an AI-generated audio discussion created by Google's NotebookLM exploring our team's article, *"Quantifying the robustness of causal inferences: Sensitivity analysis for pragmatic social science"* (Frank et al., 2023, *Social Science Research*).

{{< audio src="/audio/frank-et-al-2023-podcast.wav" >}}

[Read Full Article (DOI) →](https://doi.org/10.1016/j.ssresearch.2022.102815)
{{< /feature-card >}}
