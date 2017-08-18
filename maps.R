# Install packages and libraries
install.packages('ggplot2')
library(ggplot2)
# INSTALL PACKAGE: tidyverse
install.packages('tidyverse')
library(tidyverse)
install.packages('maps')
library(maps)

# MAP USA
map_data("usa") %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP USA (STATES)
map_data("state") %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()


# MAP CALIFORNIA, NEVADA, OREGON, WASHINGTON
# - to do this, we're using dplyr::filter()
#   ... otherwise, it's almost exactly the same as the previous code
map_data("state") %>% 
  filter(region %in% c("california","nevada","oregon","washington")) %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP illinois, iowa, michigan, wisconsin
# - to do this, we're using dplyr::filter()
#   ... otherwise, it's almost exactly the same as the previous code
map_data("state") %>% 
  filter(region %in% c("illinois","wisconsin","michigan","iowa")) %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP CALIFORNIA, NEVADA, OREGON, WASHINGTON
#  (Counties)
map_data("county") %>% 
  filter(region %in% c("california","nevada","oregon","washington")) %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP illinois
#  (Counties)
map_data("county") %>% 
  filter(region %in% c("illinois")) %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP WORLD
map_data("world") %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()


# MAP JAPAN
map_data("world") %>%
  filter(region == 'Japan') %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP INDIA
map_data("world") %>%
  filter(region == 'India') %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

# MAP Indian Subcontinent
map_data("world") %>%
  filter(region %in% c('India', 'Pakistan', 'Sri Lanka', 'Bangladesh', 'Nepal')) %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()
