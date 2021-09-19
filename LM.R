library(plm)
library(lmtest)
library(sandwich)
library(tidyverse)
library(psych)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

options(max.print = 100)

innovation.all.tax <- read.csv(file = 'innovation_cfc_tax.csv') %>%
  select(
    all_tax,
    is_cfc,
    iso_2_pair,
    year,
    geo_iso_2,
    partner_iso_2,
    ip_export,
    geo_innovation_input,
    geo_innovation_output,
    partner_innovation_input,
    partner_innovation_output,
    patent_collab_count,
    geo_gdp,
    partner_gdp
  ) %>%
  na.omit() %>%
  make.pbalanced(
    balance.type = c("shared.individuals"),
    index = c("geo_iso_2", "year")
  )

count_cfcs_all = sum(innovation.all.tax$is_cfc)

innovation.cfc.tax <- read.csv(file = 'innovation_cfc_tax.csv') %>%
  select(
    cfc_tax,
    is_cfc,
    iso_2_pair,
    year,
    geo_iso_2,
    partner_iso_2,
    ip_export,
    geo_innovation_input,
    geo_innovation_output,
    partner_innovation_input,
    partner_innovation_output,
    patent_collab_count,
    geo_gdp,
    partner_gdp
  ) %>%
  na.omit() %>%
  make.pbalanced(
    balance.type = c("shared.individuals"),
    index = c("geo_iso_2", "year")
  )

count_cfcs = sum(innovation.cfc.tax$is_cfc)

fe_eq0 <-
  log(ip_export) ~
  log(all_tax) +
  log(geo_innovation_output) +
  log(partner_innovation_input) +
  log(partner_innovation_output) +
  log(geo_gdp) +
  log(partner_gdp) +
  as.factor(iso_2_pair) +
  as.factor(geo_iso_2) +
  as.factor(partner_iso_2) +
  as.factor(year) - 1

fe0 <- lm(fe_eq0, innovation.all.tax)

print(summary(fe0))

bptest(fe0)

coeftest(fe0, vcov = vcovCL, cluster =  ~ geo_iso_2)

fe_eq1 <-
  log(ip_export) ~
  log(cfc_tax) +
  log(geo_innovation_output) +
  log(partner_innovation_input) +
  log(partner_innovation_output) +
  log(geo_gdp) +
  log(partner_gdp) +
  as.factor(iso_2_pair) +
  as.factor(geo_iso_2) +
  as.factor(partner_iso_2) +
  as.factor(year) - 1

fe0 <- lm(fe_eq1, innovation.cfc.tax)

print(summary(fe1))

bptest(fe1)

coeftest(fe1, vcov = vcovCL, cluster =  ~ geo_iso_2)

fe_eq2 <-
  log(ip_export) ~
  log(cfc_tax) +
  log(patent_collab_count) +
  log(geo_gdp) +
  log(partner_gdp) +
  as.factor(iso_2_pair) +
  as.factor(geo_iso_2) +
  as.factor(partner_iso_2) +
  as.factor(year) - 1

fe2 <- lm(fe_eq2, innovation.cfc.tax)

print(summary(fe2))

bptest(fe2)

coeftest(fe2, vcov = vcovCL, cluster =  ~ geo_iso_2)