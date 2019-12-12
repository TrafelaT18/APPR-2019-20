library(dplyr)
library(tidyr)
library(readr)
uvoz1<-read_csv("podatki/povprecni_pridelek.csv", locale=locale(encoding="Windows-1250"))
UVOZ2<-read_csv("podatki/zivina.csv", locale=locale(encoding="Windows-1250"))
uvoz3<-read_csv("podatki/cene.csv", locale=locale(encoding="Windows-1250")) 
podatki1<-uvoz1 %>% fill(1:12) %>% drop_na()
                 
