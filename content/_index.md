---
title: KonFound-It! Home
comments: false
---



The assumptions underlying statistical analysis are rarely fully met. Pragmatists face the challenge of knowing when evidence is strong enough to justify action, and that’s where **sensitivity analysis** helps by expressing the robustness of inferences relative to potential biases. For instance, sensitivity indices can quantify how much of the observed effect would need to be bias-driven to alter conclusions. We are building on these ideas by developing the methods and associated resources listed on this page.



---



{{< awesome fas fa-paper-plane >}} Questions? Issues? Suggestions? Reach out through the [KonFound-It! Google Group](https://groups.google.com/g/konfound-it).



---

{{< columns >}}

![Working on a Computer](img/computer.jpg)

{{< button href="https://konfound-project.shinyapps.io/konfound-it/" >}}Start KonFounding{{< /button >}}

Try out **KonFound-It!** to calculate sensitivity analyses through an interactive web app.



{{< column >}}

![Newspapers on a News Stand](img/news-rectangle.jpg)

{{< button href="/news" >}}KonFound-It! News{{< /button >}}

Read the latest updates from the KonFound-It! team.

{{< endcolumns >}}



---

{{< columns >}}

![Marks on wood](img/benchmarks.jpg)

{{< button href="https://konfound-project.shinyapps.io/wwc-sensitivity-benchmark/" >}}Explore Benchmarks{{< /button >}}

Explore sensitivity analyses calculated for the [What Works Clearinghouse](https://ies.ed.gov/ncee/wwc/) through an interactive web app.



{{< column >}}

![Book Shelves](img/books.jpg)

{{< button href="/page/faq" >}}Learn More{{< /button >}}

Browse through a variety of resources and guides.

{{< endcolumns >}}



---



{{< content-box >}}

**Get the latest version of the *konfound* package:**



{{< columns >}}

{{< button href="https://github.com/konfound-project/konfound/" >}}Download for R{{< /button >}}

{{< awesome fab fa-r-project >}} Code to run:

```
install.packages("devtools")
devtools::install_github(
  "konfound-project/konfound"
)
```



{{< column >}}

{{< button href="https://www.stata.com/" >}}Download for Stata{{< /button >}}

{{< awesome fab fa-stripe-s >}} Code to run:


```
ssc install konfound, replace
ssc install indeplist, replace
ssc install moss, replace
ssc install matsort, replace
```



{{< endcolumns >}}

{{< /content-box >}}
