library(dplyr)
library(tidyr)
library(readr)
<<<<<<< HEAD
library(tibble)
library(ggplot2)


=======
>>>>>>> e55742509d1f6ab9bb1e4487736ac31df14d7ad3

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

povprecja.kmetijskih.kultur <- uvoz1 %>% group_by(kmetijska.kultura,regija) %>% summarise(povprecje = sum(kolicina)/9)
povprecje.kmetijskih.kultur <- povprecja.kmetijskih.kultur %>% group_by(kmetijska.kultura) %>% summarise(povprecje = sum(povprecje)/12)
#zemljevide za nekaj najpogostejših kultur
povprecja.zivine <- uvoz2 %>% group_by(vrsta.zivine, regija) %>% summarise(povprecje =sum(stevilo)/6)
povprecje.zivine <- povprecja.zivine %>% group_by(vrsta.zivine) %>% summarise(povprecje=sum(povprecje)/12)

#kje je najbol razvito gospodarstvo:
povprecje.regije <- povprecja.kmetijskih.kultur %>% group_by(regija) %>% summarise(povprecje = sum(povprecje)/22)







       