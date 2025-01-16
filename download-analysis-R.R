library(tidyverse)
library(packageRank)
library(scales)

#packageRank("konfound")

df <-
  cranDownloads(packages = "konfound", from = 2018) %>%
  `$`(cranlogs.data)

r_total <- sum(df$count)

ggplot(df, aes(x = date, y = cumulative)) +
  geom_line() +
  scale_y_continuous(label = comma) +
  theme_bw() +
  labs(y = "Cumulative Downloads", x = "")

ggsave("./static/img/konfound-downloads-r.png",
       width = 1200, height = 675,
       unit = "px", dpi = 240)
