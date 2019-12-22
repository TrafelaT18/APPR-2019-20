library(dplyr)
library(tidyr)
library(readr)
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


