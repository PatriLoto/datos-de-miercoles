
library(extrafont)
loadfonts(dev = "win")
library(tidyverse)
library(ggforce)  
library(ggthemes)
library(wesanderson)
library(DT)
library(maps)
# install_packages("readr")
capitulos_rladies <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-06-26/capitulos_rladies.csv")
eventos_rladies <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-06-26/eventos_rladies.csv")

#trae los datos como en una tabla
datatable(capitulos_rladies, rownames = FALSE,
          options = list(pageLength = 10))


datosordenados <-capitulos_rladies %>% arrange(miembros)
View(datosordenados)
world <- ggplot() +
  borders("world", colour = "gray85", fill = "gray80") +
  theme_map()
world


map <- world +
  geom_point(aes(x = longitud, y = latitud,
                 text = paste('city: ', ciudad,
                              '<br /> created : ', creacion),
                 size = miembros),
             data = capitulos_rladies, colour = 'purple', alpha = .5) +
  scale_size_continuous(range = c(1, 8), breaks = c(250, 500, 750, 1000,1250,1500,1750,2000)) +
  labs(size = 'Miembros Meetups')