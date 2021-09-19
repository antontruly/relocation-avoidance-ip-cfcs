library(tidyverse)
library(viridis)
library(patchwork)
library(hrbrthemes)
library(circlize)
library(chorddiag)

par(family = "Times New Roman")

df_source <- "patents_inventor_countries_sum_outside.csv"

df <- read.csv(df_source)

circos.clear()
circos.par(
  start.degree = 120,
  gap.degree = 5,
  track.margin = c(-0.05, 0.05),
  points.overflow.warning = FALSE
)
par(mar = rep(0, 4))

iso_2 <-
  unique(c(df$geo_iso_2,
           df$partner_iso_2))

hue <-
  viridis(
    length(iso_2),
    alpha = 1,
    begin = 0.3,
    end = 1,
    option = "magma"
  )

chordDiagram(
  x = df,
  grid.col = hue,
  transparency = 0.25,
  diffHeight  = -0.02,
  directional = 0,
  annotationTrack = c("name", "grid"),
  annotationTrackHeight = c(0.05, 0.06),
  link.sort = TRUE,
  link.largest.ontop = TRUE
)