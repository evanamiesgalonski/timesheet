library(poispkgs)

stopifnot(packageVersion("poispkgs") >= "0.0.1.9017")

rjags::load.module("mix", quiet = TRUE)

dtt_set_default_tz("Etc/GMT+8")

theme_set(theme_Poisson())

options(sbf.ask = FALSE)

sbf_set_main("output")
sbf_reset_sub()

rm(list = ls())
graphics.off()

# source("functions.R")

tz_data <- "PST8PDT"

project <- basename(getwd())

dir <- paste0("~/e/Data/", sub("-\\d\\d$", "", project))

