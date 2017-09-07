#==============
# LOAD PACKAGES
#==============

library(rvest)
library(tidyverse)
library(ggmap)
library(stringr)


#===========================
# SCRAPE DATA FROM WIKIPEDIA
#===========================
html.population <- read_html('https://en.wikipedia.org/wiki/List_of_Asian_cities_by_population_within_city_limits')

df.asia_cities <- html.population %>%
  html_nodes("table") %>%
  .[[3]] %>%
  html_table(fill = TRUE)


# inspect
df.asia_cities %>% head()
df.asia_cities %>% names()


#============================
# REMOVE EXTRANEOUS VARIABLES
#============================

df.asia_cities <- df.asia_cities[,c(1,2,4)]


# inspect
df.asia_cities %>% names()
df.asia_cities %>% head()

#===============
# RENAME COLUMNS
#===============
colnames(df.asia_cities) <- c("city", "country", "population")


# inspect
df.asia_cities %>% colnames()
df.asia_cities %>% head()


#-------------------------------------------------------------------
# REMOVE EXTRA ROW AT TOP
# - when we scraped the data, part of the column name
#   for the 'Population, City proper" column
#   was parsed as a row of data, instead of part of the column name
# - here, we're just removing that extraneous row
#-------------------------------------------------------------------

df.asia_cities <- df.asia_cities[-1,]


# inspect
df.asia_cities %>% head()

#==========================================================================
# REMOVE "notes" FROM POPULATION NUMBERS NAMES
# - two cities had extra characters for footnotes
#   ... we will remove these using stringr::str_replace and dplyr::mutate()
#==========================================================================

df.asia_cities <- df.asia_cities %>% mutate(population = str_replace_all(population, "\\[.*\\]","") %>% parse_number())

# inspect
df.asia_cities %>% head()

#==============================================================
# CREATE VARIABLE: "city_full_name"
# - we need to have a combined name of the form 'City, Country'
# - we need this because when we use the geocode() function to
#   get long/lat data, there is some ambiguity in the city names
#==============================================================

df.asia_cities <- df.asia_cities %>% mutate(city_full_name = str_c(df.asia_cities$city, df.asia_cities$country, sep = ', '))


#inspect
df.asia_cities %>% head()

#==================
# REORDER VARIABLES
#==================

df.asia_cities <- df.asia_cities %>% select(city, country, city_full_name, population)


# inspect
df.asia_cities %>% head()



#========================================
# COERCE TO TIBBLE
# - this just makes the data print better
#========================================

df.asia_cities <- df.asia_cities %>% as_tibble()

#========================================================
# GEOCODE
# - here, we're just getting longitude and latitude data 
#   using ggmap::geocode()
#========================================================
install.packages("ggmap")
library(ggmap)
data.geo <- geocode(df.asia_cities$city_full_name)

print(data.geo)


#==================================================
# JOIN
# - here, we're just attaching the geocode data to
#   the original dataframe
#==================================================

df.asia_cities <- cbind(df.asia_cities, data.geo)


# inspect
df.asia_cities %>% head()

#=============
# GET ASIA MAP
#=============

map.asia <- get_map('Asia', zoom = 3, source = "stamen", maptype = "watercolor")


# map it ... 
# shows Asian subcontinent map
map.asia %>% ggmap()

#============================================================================
# PLOT CITIES ON MAP
# - we are using the watercolor map of asia as the background (using ggmap())
# - we are using geom_point() to plot the city data as points
#   on top of the map
#============================================================================

# FIRST ITERATION
ggmap(map.asia) +
  geom_point(data = df.asia_cities, aes(x = lon, y = lat, size = population), color = "red", alpha = .3) +
  geom_point(data = df.asia_cities, aes(x = lon, y = lat, size = population), color = "red", shape = 1) 

#==================================================
# FINALIZED MAP
# - here I've added titles, modified theme elements
#   like the text, etc
#==================================================

ggmap(map.asia) +
  geom_point(data = df.asia_cities, aes(x = lon, y = lat, size = population), color = "red", alpha = .1) +
  geom_point(data = df.asia_cities, aes(x = lon, y = lat, size = population), color = "red", shape = 1) +
  labs(x = NULL, y = NULL) +
  labs(size = 'Population (millions)') +
  labs(title = "Largest Cities in Asia", subtitle = "source: https://en.wikipedia.org/wiki/List_of_Asian_cities_by_population_within_city_limits") +
  scale_size_continuous(range = c(.6,18), labels = scales::comma_format(), breaks = c(1500000, 10000000, 20000000)) +
  theme(text = element_text(color = "#4A4A4A", family = "Gill Sans")) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) +
  theme(plot.title = element_text(size = 32)) +
  theme(plot.subtitle = element_text(size = 10)) +
  theme(legend.key = element_rect(fill = "white"))