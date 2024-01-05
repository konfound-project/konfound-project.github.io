---
title: Why is robustness important for emerging COVID-19 studies?
date: 2020-05-12
author: Konfound Team
tags: ["statistical analysis", "sensitivity analysis", "covid"]
---



As those who work in public policy and health, we seek to help a broad range of people, with a broad range of statistical backgrounds, interpret uncertainty about public health findings regarding COVID-19. We observe that currently, there is little common language for expressing uncertainty. Consider Anthony Fauci's quote (as in Healio on April 29): 

>The trial, which began Feb. 21 this year, compared remdesivir with placebo in more than 1,000 patients. Remdesivir improved recovery from 15 days to 11 days, with a *p*-value of 0.001. …We would have normally waited several more days. **The data may change, but the conclusion won’t.**

Like Dr. Fauci, we attend to the conclusion of the research. But instead of referring to a small p-value defined by a sampling distribution which may be unfamiliar to many, we quantify the robustness of the conclusion by counting how many treatment cases would have to be switched from successful to unsuccessful outcomes to change the conclusion. This generates statements such as:

>xx of the treatment cases that experienced success would have to have experienced failure to change the conclusion at conventional levels of statistical significance. 

Thus, we represent the robustness of the inference/conclusion in the very human terms of patient experiences. This type of logic has been used to develop the fragility index ([Walsh et al, 2014](https://pubmed.ncbi.nlm.nih.gov/24508144/)).

**Communicating the uncertainty of new findings regarding COVID-19 in the accessible, human, terms of patients’ experiences is critical for informing public policy and clinical practice.**

See other posts on this website for illustrative examples. Click [here](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3607967) for working paper further describing the rationale and benefits of the approach.

## Examples:

[Hydroxychloriquine.](https://www.konfound-it.org/2020/05/12/hcq/) Good example to illustrate approach. Data from a not yet peer-reviewed study conducted at the Renmin Hospital in Wuhan. This was the first RCT of hydroxychloroquine as a treatment for COVID-19.

[Remdesivir.](https://www.konfound-it.org/2020/05/12/remdesivir/) Data from an April 29, 2020 study published in The Lancet of a double-blind, placebo-controlled randomized trial of Remdesivir as a treatment for COVID-19. Includes example of calculating robustness for mortality, as well as time to clinical improvement (continuous measure).

[Robustnesss for accumulating studies: antihypertensive treatments](https://www.konfound-it.org/2020/05/13/robustness-for-accumulating-studies-antihypertensive-treatments/). As studies emergent one can update the robustness of the cumulative findings for a given treatment. We illustrate using a historical non-COVID example: the study-by-study accumulation of 16 estimated effects presented in a meta-analysis of randomized trials examining the impact of hypertension treatments on the probability of suffering a stroke. 

---
