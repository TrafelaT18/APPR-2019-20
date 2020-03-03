library(dplyr)
library(tidyr)
library(readr)
library(tibble)
library(ggplot2)
library(tibble)
library(tmap)
library(maptools)
library(rgeos)
library(rgdal)


library(tibble)
uvoz1 <- read_csv("podatki/povprecni_pridelek.csv",
                  locale=locale(encoding="Windows-1250"), na="-") %>%
  rename(kmetijska.kultura=`KMETIJSKE KULTURE`) %>% # presledki so nezaželeni v imenih stolpcev
  gather("leto.regija", "kolicina", -kmetijska.kultura, na.rm=TRUE) %>% # pretvorba v tidy data
  separate(leto.regija, c("leto", "regija"), "(?<=[0-9]) ") %>% # delimo po presledku za številko
  mutate(leto=parse_number(leto)) # leto pretvorimo v števila
uvoz2 <- read_csv("podatki/zivina.csv", # v enem od stolpcev ni podatkov, zato bo treba eksplicitno podati tipe:
                  col_types=cols(`VRSTA ŽIVINE`=col_character(), .default=col_integer()),
                  locale=locale(encoding="Windows-1250"), na=c("N", "z"))  %>%
  rename(vrsta.zivine=`VRSTA ŽIVINE`) %>%
  gather("leto.regija", "stevilo", -vrsta.zivine, na.rm=TRUE) %>%
  separate(leto.regija, c("leto", "regija"),
           " (?=[A-ZČŠŽ])(?!Slovenija)") %>% # delimo po presledku pred veliko črko, razen pred besedo "Slovenija"
  mutate(leto=parse_number(leto))

povprecja.kmetijskih.kultur <- uvoz1 %>% group_by(kmetijska.kultura,regija) %>% summarise(povprecje = mean(kolicina, na.rm = TRUE))
povprecje.kmetijskih.kultur <- povprecja.kmetijskih.kultur %>% group_by(kmetijska.kultura) %>% summarise(povprecje = mean(povprecje, na.rm = TRUE))

#zemljevide za nekaj najpogostejših kultur
povprecja.zivine <- uvoz2 %>% group_by(vrsta.zivine, regija) %>% summarise(povprecje =mean(stevilo, na.rm = TRUE))
povprecje.zivine <- povprecja.zivine %>% group_by(vrsta.zivine) %>% summarise(povprecje=mean(povprecje, na.rm = TRUE))
  
#kje je najbol razvito gospodarstvo:
povprecje.regije <- povprecja.kmetijskih.kultur %>% group_by(regija) %>% summarise(povprecje = mean(povprecje, na.rm = TRUE))


#diagram za povprecje kmetijskih kultur

graf.kultur <-  ggplot(aes(x = kmetijska.kultura, y = povprecje, group=1), data = povprecje.kmetijskih.kultur) + geom_col() + coord_flip() + ggtitle("Povprečje kmetijskih kultur")
graf.zivine <- ggplot(aes(x = vrsta.zivine, y = povprecje, group=1), data = povprecje.zivine) + geom_col() + ggtitle("Povprečje živine")

zemljevid <- uvozi.zemljevid("https://biogeo.ucdavis.edu/data/gadm3.6/shp/gadm36_SVN_shp.zip", "gadm36_SVN_1")





       