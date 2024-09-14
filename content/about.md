---
title: About KonFound-It!
subtitle: Learn about the project and meet the team
comments: false
---



---

Welcome to our space about **[sensitivity analysis](https://en.wikipedia.org/wiki/Sensitivity_analysis)**. 

{{< awesome fas fa-paper-plane >}} Questions? Issues? Suggestions? Reach out through the [KounFound-It! Google Group](https://groups.google.com/g/konfound-it).

---


## Purpose

All of the assumptions of statistical analysis rarely hold. So the challenge for the pragmatist is to understand when evidence is strong enough to support action. That's where sensitivity analysis comes in&#8212;so we can understand how robust our inferences are to challenges to our assumptions. One example is a statement such as: 

> XX% of the estimated effect would have to be due to bias to change your inference about the effect.

But that’s just one. In this website, we discuss lots of approaches, applications, and the pluses and minuses.

Our work in the KonFound-It project is to develop&#8212;and make easy to use&#8212;sensitivity analyses that quantify the robustness of inferences to concerns about omitted variables and other sources of bias.

---


## People

We are a group of researchers spanning numerous institutions who would like to contribute to better communications of research inferences and findings.

**Our group includes:**

- [Ken Frank](https://msu.edu/~kenfrank/) (Michigan State University)
- [Spiro Maroulis](http://www.public.asu.edu/~smarouli/Spiro_Maroulis/Home.html) (Arizona State University)
- [Qinyun Lin](https://www.linkedin.com/in/qinyun-lin-b72763112/) (University of Gothenburg)
- [Ran Xu](https://sites.google.com/site/ranxupersonalweb/) (University of Connecticut)
- [Joshua Rosenberg](https://joshuamrosenberg.com/) (University of Tennessee, Knoxville)
- [Guan Saw](https://www.cgu.edu/people/guan-saw/) (Claremont Graduate University)
- [Bret Staudt Willet](https://bretsw.com) (Florida State University)

**Additional contributors include:**

- Tingqiao Chen (Michigan State University)
- [Zixi Chen](https://caser.shanghai.nyu.edu/people/zixi-chen/) (NYU Shanghai)
- [Xuesen Cheng](https://www.linkedin.com/in/xuesen-cheng-452272190/) (Michigan State University)
- [Jihoon Choi](https://www.linkedin.com/in/jihoon-choi-60a918223/) (Michigan State University)
- [Tenglong Li](https://www.xjtlu.edu.cn/en/staff-details/staff/tenglong-li) (Xi'an Jiaotong-Liverpool University)
- [Yuqing Liu](https://www.linkedin.com/in/yuqing-liu-b6372889/) (Michigan State University)
- Dallin Overstreet (Arizona State University)
- [Wei Pan](https://sites.duke.edu/panwei/) (Duke University)
- Wei Wang (Michigan State University)
- [Gaofei Zhang](https://www.linkedin.com/in/gaofei-zhang-450013107/) (University of Connecticut)

---


## Tools

### {{< awesome fas fa-calculator >}} KonFound-It! Shiny App

Rosenberg, J. M., Narvaiz, S., Xu, R., Lin, Q., Maroulis, S., Frank, K. A., Saw, G. & Staudt Willet, K. B. (2023). *KonFound-it!: Quantify the robustness of causal inferences* (v. 2.0.0). https://konfound-project.shinyapps.io/konfound-it/



### {{< awesome fas fa-warehouse >}} Benchmarks: What Works Clearinghouse (BETA)

Maroulis, S., Overstreet, D., Frank, K. A., & Staudt Willet, K. B. (2024). *What works clearinghouse Sensitivity analysis benchmarks*. https://konfound-project.shinyapps.io/wwc-sensitivity-benchmark/



### {{< awesome fab fa-r-project >}} KonFound R Package

Rosenberg, J. M., Xu, R., Lin, Q., Maroulis, S., & Frank, K. A. (2023). *konfound: Quantify the robustness of causal inferences* (v. 0.4.0). https://CRAN.R-project.org/package=konfound 

| Monthly Downloads | Total Downloads |
| :---------------- | :-------------- |
| ![](https://cranlogs.r-pkg.org/badges/konfound?color=9bbb59) | ![](https://cranlogs.r-pkg.org/badges/grand-total/konfound?color=9bbb59) |

![Line plot of konfound package downloads over time](/img/konfound-downloads.png)

- Development version of the R package: [KonFound Project on GitHub](https://github.com/konfound-project/konfound)
- Narvaiz, S., Lin, Q., Rosenberg, J. M., Frank, K. A., Maroulis, S. J., Wang, W., & Xu, R. (2024). konfound: An R sensitivity analysis package to quantify the robustness of causal inferences. *Journal of Open Source Software, 9*(95), 5779. [{{< awesome fas fa-globe >}} Web](https://doi.org/10.21105/joss.05779)

```
install.packages("konfound")
library(konfound)
pkonfound(est_eff = -9.01, std_err = .68, n_obs = 7639, n_covariates = 221)
```



### {{< awesome fab fa-stripe-s >}} KonFound Stata Package

Xu, R., Frank, K. A., Maroulis, S. J., & Rosenberg, J. M. (2019). konfound: Command to quantify robustness of causal inferences. *The Stata Journal, 19*(3), 523-550. https://doi.org/10.1177/1536867X19874223

```
ssc install konfound
ssc install indeplist
ssc install moss
ssc install matsort
pkonfound -9.01 .68 7639 221
```


---


## Internal Resources

Be sure to look through the variety of supports for KonFound:

- [Forum (Google Group)](https://groups.google.com/g/konfound-it)
- [FAQ](/page/faq) | [FAQ Dev Version](https://www.dropbox.com/s/9eymdekym5g50o7/frequently%20asked%20questions%20for%20application%20of%20konfound-it.docx?dl=0)
- [Resource Overview](/page/resources)
- [Publications](/page/publications)
- [Talks](/page/talks)
- [Workshops](/page/workshops)
- [Benchmarks: What Works Clearinghouse](https://konfound-project.shinyapps.io/wwc-sensitivity-benchmark/) [BETA]
- [User Guide]() - COMING SOON

---


## External Resources

We refer to a lot of open resources for building this site, including:

- [blogdown: Creating Websites with R Markdown](https://bookdown.org/yihui/blogdown/)
- [Simply Statistics](https://simplystatistics.org/)

---

## Connect

- Project Overview and Details: Peruse the [KonFound-It! Website](https://konfound-it.org/)
- Frequently Asked Questions: Check the [FAQ page](/page/faq) | [FAQ dev version](https://www.dropbox.com/s/9eymdekym5g50o7/frequently%20asked%20questions%20for%20application%20of%20konfound-it.docx?dl=0)
- Specific Questions: Ask in the [KounFound-It! Google Group](https://groups.google.com/g/konfound-it)
- Issues with the konfound R Package: Post to [konfound GitHub Issues]((https://github.com/konfound-project/konfound/issues))
- Overall KonFound-It! Project Inquiries: Contact [Ken Frank](https://msu.edu/~kenfrank/)
- Benchmarks: What Works Clearinghouse: Contact [Spiro Maroulis](http://www.public.asu.edu/~smarouli/Spiro_Maroulis/Home.html)
- R Package: Contact [Qinyun Lin](https://www.linkedin.com/in/qinyun-lin-b72763112/)
- R Shiny App: Contact [Joshua Rosenberg](https://joshuamrosenberg.com/)
- Stata Package: Contact [Ran Xu](https://sites.google.com/site/ranxupersonalweb/)
- User Guide: Contact [Guan Saw](https://www.cgu.edu/people/guan-saw/)
- Website: Contact [Bret Staudt Willet](https://bretsw.com)

### Thanks for visiting! Happy KonFounding!
