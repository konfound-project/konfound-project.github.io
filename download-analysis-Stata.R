library(tidyverse)
library(scales)

df <-
  read_csv("download-data-stata-jan2026.csv") %>%
  rename(date = month,
         count = downloads) %>%
  mutate(date = ym(str_replace(date, "m", "-")),
         cumulative = cumsum(count)
  )

stata_total <- sum(df$count)
stata_monthly <- round(sum(tail(df$count, 12)) / 12, 0)

ggplot(df, aes(x = date, y = cumulative)) +
  geom_line() +
  scale_y_continuous(label = comma, limits = c(0, 20000)) +
  theme_bw() +
  labs(y = "Cumulative Downloads", x = "")

ggsave("./static/img/konfound-downloads-stata.png",
       width = 1200, height = 675,
       unit = "px", dpi = 240)
