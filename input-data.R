source("header.R")


file <- file.path(dir, "harvest_time_report.csv")
t_sheet <- read.csv(file)

t_sheet %<>%
  transmute(
    Date = dtt_date(Date), Client, Project, Task, Desc = Notes, Hours, Billable.,
    Invoiced., Rate = Billable.Rate, Amount = Billable.Amount
  ) %>%
  rename_with(tolower) %>%
  rename_with(str_replace, pattern = "\\.", replacement = "") %>%
  mutate(across(c(invoiced, billable), ~ .x == "Yes"))


sbf_save_data(t_sheet, sub = "input")
