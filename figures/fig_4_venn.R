rm(list = ls())

library(tidyverse)
library(ggvenn)

df <- read_csv("data_res.csv")

table(df$chpVII)

table(df$chpVII, df$art39lang)

sets <- list(
  "Chapter VII" = df$doc[df$chpVII == 1],
  "Article 25" = df$doc[df$art25_charter == 1],
  "Article 39 Language" = df$doc[df$art39lang == 1]
)


venn_plot <- ggvenn(sets,
       fill_color = c("grey80", "grey80", "grey80"), # No fill
       stroke_color = "black",  # Black outline
       text_color = "black",    # Black text
       text_size = 8,
       set_name_color = "black", # Black set names
       set_name_size = 8,
       show_percentage = FALSE  # Show raw counts
)

venn_plot

ggsave("fig_4_venn.png", venn_plot, width = 6, height = 6, dpi = 600, bg = "white")
