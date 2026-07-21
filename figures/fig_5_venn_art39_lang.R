rm(list = ls())

library(tidyverse)
library(ggvenn)

df <- read_csv("data_res.csv")

df <- df %>%
  filter(art39lang == 1,
         chpVII == 0,
         art25_charter == 0,
         art39_charter == 0,
         art40_charter == 0,
         art41_charter == 0) %>%
  mutate(decides_requests_demand = if_else(decides == 1 & requests == 1 & demand == 1, 1, 0),
         any_decides_requests_demand = if_else(decides == 1 | requests == 1 | demand == 1, 1, 0))

sets <- list(
  "Demand" = df$doc[df$demand == 1],
  "Request" = df$doc[df$requests == 1],
  "Decides" = df$doc[df$decides == 1]
)

venn_plot <- ggvenn(sets,
                    fill_color = c("grey80", "grey80", "grey80"),
                    stroke_color = "black",
                    text_color = "black",
                    text_size = 8,
                    set_name_color = "black",
                    set_name_size = 8,
                    show_percentage = FALSE
)

venn_plot

ggsave("fig_5_venn_art39_lang.png", venn_plot, width = 6, height = 6, dpi = 600, bg = "white")
