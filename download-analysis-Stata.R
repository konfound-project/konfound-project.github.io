library(tidyverse)
library(jsonlite)
library(scales)

df <-
  read_csv("download-data-stata-jan2026.csv") %>%
  rename(date = month,
         count = downloads) %>%
  mutate(date = ym(str_replace(date, "m", "-")),
         cumulative = cumsum(count)
  )





stata_total_downloads <- sum(df$count)
stata_monthly_downloads <- round(sum(tail(df$count, 12)) / 12, 0)

package_download_metrics <-
  list(
    total_downloads = prettyNum(stata_total_downloads, big.mark = ","),
    monthly_downloads =
      paste0(prettyNum(stata_monthly_downloads, big.mark = ","), "/month")
)

write_json(package_download_metrics, "data/stata_package_downloads.json", auto_unbox = TRUE)





ggplot(df, aes(x = date, y = cumulative)) +
  geom_line() +
  scale_y_continuous(label = comma, limits = c(0, 20000)) +
  theme_bw() +
  labs(y = "Cumulative Downloads", x = "")

ggsave("static/img/konfound-downloads-stata.png",
       width = 1200, height = 675,
       unit = "px", dpi = 240)
