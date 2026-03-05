source("header.R")

t_sheet <- sbf_load_data("t_sheet", sub = "input")

nrp <- t_sheet %>%
  filter(project == "nrp-database-25" | str_detect(desc, "nrp"))

projected <- tribble(
  ~invoiced, ~project, ~hours, 
  FALSE, "nrp_projected", 10, 
  ) %>% 
  mutate(amount = hours * srate)

nrp_sum <- nrp %>%
  group_by(invoiced, project) %>%
  summarise(hours = sum(hours), amount = sum(amount), .groups = "drop") %>%
  bind_rows(projected)

net_rate <- nrp_sum %>%
  summarise(hours = sum(hours), amount = sum(amount)) %>%
  mutate(net_rate = round(amount / hours))
  
