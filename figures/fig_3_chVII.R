rm(list = ls())
library(tidyverse)

df <- read_csv("data_res.csv")

theme_bw_academic <- theme(
  plot.title = element_text(family = "Times New Roman", size= 16, colour = "black"),
  text = element_text(family = "Times New Roman", size= 12, colour = "black"),
  axis.text.x = element_text(family = "Times New Roman", size= 12, colour = "black"),
  axis.text.y = element_text(family = "Times New Roman", size= 11, colour = "black"),
  legend.text = element_text(family = "Times New Roman", size= 12, colour = "black"),
  legend.title = element_blank(),
  panel.grid.minor = element_blank(),
  panel.grid.major.x = element_blank(),
  panel.grid.minor.x = element_blank(),
  panel.border = element_blank()
)

decades = c("1946-1949","1950-1959", "1960-1969", "1970-1979", "1980-1989", "1990-1999", "2000-2009", "2010-2019", "2020-2023")

df_tmp <- df %>%
  group_by(decade) %>%
  summarise(chpVII = sum(chpVII))

p <- ggplot(df_tmp, aes(x=factor(decade), y=chpVII)) +
  geom_col() +
  scale_x_discrete(labels = decades) +
  scale_y_continuous(limits = c(0, 350), breaks = seq(0, 350, 50)) +
  labs(title = "Explicit references to Chapter VII over time", y = "Number of Resolutions", x = NULL) +
  theme_bw() +
  theme_bw_academic
p

ggsave("fig_3_chVII.png",p, width = 8.5, height = 5, dpi=600)
