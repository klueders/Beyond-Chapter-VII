rm(list = ls())

library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)
library(readr)

data <- read_csv("data_length.csv")

custom_breaks <- c(1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020)

theme_bw_academic <- theme(
  plot.title = element_text(family = "Times New Roman", size= 16, colour = "black"),
  text = element_text(family = "Times New Roman", size= 12, colour = "black"),
  axis.text.x = element_text(family = "Times New Roman", size= 11, colour = "black"),
  axis.text.y = element_text(family = "Times New Roman", size= 11, colour = "black"),
  legend.text = element_text(family = "Times New Roman", size= 12, colour = "black"),
  legend.title = element_blank(),
  panel.grid.minor = element_blank(),
  panel.border = element_blank()
  )

data_summary <- data %>%
  group_by(year) %>%
  summarise(
    mean_p = mean(content_sum)
  )

p <- ggplot(data_summary, aes(x = year, y = mean_p)) +
  geom_point() +
  geom_smooth(method="loess", span=0.3, color="dimgrey", se=FALSE) +
  scale_x_continuous(breaks = custom_breaks, limits = c(1946, 2023)) +
  scale_y_continuous(limits = c(0,50)) + 
  labs(title = "Average Length Resolution", y = "Mean Number of Para.", x = "Year") +
  theme_bw() +
  theme_bw_academic

p

ggsave("fig_1_desc_length.png",p, width = 8, height = 2.5, dpi=600)