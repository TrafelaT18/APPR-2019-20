# 3. faza: Vizualizacija podatkov

# Uvozimo zemljevid.
#zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
#                             pot.zemljevida="OB", encoding="Windows-1250")
#levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
#  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
#zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
#zemljevid <- fortify(zemljevid)

# Izračunamo povprečno velikost družine
#povprecja <- druzine %>% group_by(obcina) %>%
#summarise(povprecje=sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))


povprecje.regije <- povprecja.kmetijskih.kultur %>% group_by(regija) %>% summarise(povprecje = mean(povprecje, na.rm = TRUE))


library(tmap)
source("https://raw.githubusercontent.com/TrafelaT18/APPR-2019-20/master/lib/uvozi.zemljevid.r")
obcine <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip", "OB",
                          pot.zemljevida="OB", encoding="Windows-1250")