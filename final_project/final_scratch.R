
library(here)
#library(raster)
library(startR)
library(NMF)
library(tidyverse)

monthly_fishing_pacific <- get_table(project = "ucsb-gfw",
                                     dataset = "jc_bycatch",
                                     table = "monthly_fishing_pacific")

# write.csv(x = monthly_fishing_pacific,
#           file = here::here("final_project", "monthly_fishing_pacific.csv"),
#           row.names = F)

# my_rasterize <- function(data, ...){
#   data <- as.matrix(data)
#   
#   e <- extent(c(-180, 180, -90, 90))
#   r <- raster(e, ncol = 360, nrow = 180)
#   
#   hours <- (data[, 3] / sum(data[, 3])) * 100
#   
#   rasterize(x = data[, c(1:2)], y = r, field = hours, fun = sum)
# }
# 
# a <- monthly_fishing_pacific %>% 
#   dplyr::select(year, month, x = lon, y = lat, z = hours) %>% 
#   mutate(x = round(x, 2),
#          y = round(y, 2)) %>% 
#   group_by(year, month) %>% 
#   nest() %>% 
#   mutate(r = purrr::map(.x = data, .f = my_rasterize))
# 
# r <- stack(a$r)
# 
# animate(r, n = 1)




# nino <- read.csv(here("final_project", "all_indices.csv"), stringsAsFactors = F) %>% 
#   dplyr::select(year, month = month_n, nino34anom)


# monthly_fishing_pacific %>% 
#   left_join(nino, by = c("year", "month")) %>% 
#   drop_na(nino34anom) %>% 
#   mutate(nino = nino34anom > 0) %>% 
#   group_by(nino, lon, lat) %>% 
#   summarize(hours = sum(hours)) %>% 
#   ungroup() %>% 
#   ggplot(aes(x = lon, y = lat, fill = hours)) +
#   geom_raster() +
#   facet_wrap(~nino, ncol = 1) +
#   coord_equal() +
#   scale_fill_gradientn(colours = colorRamps::matlab.like(20), trans = "log10")

countries <- c("CHN", "ESP", "JPN", "KOR", "PRT", "TWN", "USA", "VUT")

# monthly_fishing_pacific %>% 
#   filter(best_flag %in% countries) %>%
#   filter(lat > 0, lon > 0) %>%
#   # filter(!is.na(best_flag)) %>% 
#   drop_na(best_flag) %>% 
#   group_by(best_flag, lon, lat) %>% 
#   summarize(hours = sum(hours, na.rm = T)) %>% 
#   ungroup() %>% 
#   ggplot(aes(x = lon, y = lat, fill = hours)) +
#   geom_raster() +
#   facet_wrap(~best_flag) +
#   coord_equal() +
#   scale_fill_gradientn(colours = colorRamps::matlab.like(20), trans = "log10") +
#   ggtheme_plot()

nmf_data <- monthly_fishing_pacific %>%
  filter(best_flag %in% countries) %>%
  drop_na(best_flag) %>%
  filter(lat > 0) %>%
  group_by(best_flag, lon, lat) %>%
  summarize(hours = sum(hours, na.rm = T)) %>%
  ungroup() %>%
  filter(hours > 0) %>%
  mutate(lonlat = paste(lon, lat, sep = "_")) %>%
  select(best_flag, lonlat, hours) %>%
  spread(lonlat, hours, fill = 0) %>%
  select(-best_flag) %>%
  as.matrix()

# nmf_data <- readRDS(here("final_project", "nmf_data.rds"))

res <- nmf(nmf_data, 8, .options = "t")

W <- basis(res)
h <- coef(res)

X_bar <- W %*% h
X_bar <- cbind(countries, X_bar)

colnames(X_bar) <- c("country", colnames(nmf_data))

X_pred <- X_bar %>% 
  as_tibble() %>% 
  gather(lonlat, hours, -country) %>% 
  mutate(lon = str_extract(lonlat, ".+_"),
         lat = str_extract(lonlat, "_.+"),
         lon = str_remove(lon, "_"),
         lat = str_remove(lat, "_"),
         lon = as.numeric(lon),
         lat = as.numeric(lat),
         hours = as.numeric(hours))

features <- cbind(c(LETTERS[1:8]), h)

colnames(features) <- c("feature", colnames(nmf_data))
  
features <- features %>% 
  as_tibble() %>% 
  gather(lonlat, hours, -feature) %>% 
  mutate(lon = str_extract(lonlat, ".+_"),
         lat = str_extract(lonlat, "_.+"),
         lon = str_remove(lon, "_"),
         lat = str_remove(lat, "_"),
         lon = as.numeric(lon),
         lat = as.numeric(lat),
         days = as.numeric(hours) / 24)

ggplot(data = features) +
  geom_raster(aes(x = lon, y = lat, fill = days)) +
  geom_sf(data = coast) +
  facet_wrap(~feature, ncol = 2) +
  scale_fill_gradientn(colours = colorRamps::matlab.like(20), trans = "log10") +
  ggtheme_plot()

coast <- rnaturalearth::ne_coastline(returnclass = "sf")

ggplot(data = X_pred) +
  geom_raster(aes(x = lon, y = lat, fill = hours)) +
  geom_sf(data = coast) +
  facet_wrap(~country) +
  # coord_equal() +
  scale_fill_gradientn(colours = colorRamps::matlab.like(20), trans = "log10") +
  ggtheme_plot()

ggsave(p, here("final_project", "plot.pdf"),
       width = 10,
       height = 7)





