library(here)
library(NMF)

nmf_data <- readRDS(here("final_project", "nmf_data.rds"))

r <- c(3, 5, 8, 10, 15, 20)

res <- nmf(nmf_data, 10)

saveRDS(res, file = here("final_project", "res.rds"))