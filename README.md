# Količine in povprečne cene prodanih kmetijskih pridelkov v Sloveniji

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2019/20

* [![Shiny](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/TrafelaT18/APPR-2019-2
* [![RStudio](http://mybinder.org/badge.svg)](http://mybinder.org/v2/gh/TrafelaT18/APPR-2019-20/master?urlpath=rstudio) RStudio

## Tematika
<<<<<<< HEAD
Izbrala sem si temo z naslovom Količine prodanih kmetijskih pridelkov v Sloveniji, s katero bom prikazala kako so se količine raznih kmetijskih pridelkov spreminjale skozi leta, povprečni pridelek pomembnejših kmetijskih kultur po statističnih regijah.  Podatke bom črpala iz statističnega urada Republike Slovenije in sicer iz https://pxweb.stat.si/SiStatDb/pxweb/sl/30_Okolje/30_Okolje__15_kmetijstvo_ribistvo__02_kmetijske_cene__04_15275_prod_lastn_pride/1527501S.px/ in https://pxweb.stat.si/SiStatDb/pxweb/sl/30_Okolje/30_Okolje__15_kmetijstvo_ribistvo__04_rastlinska_pridelava__01_15024_pridelki_povrsina/1502410S.px/.

=======
Izbrala sem si temo z naslovom Količine in povprečne cene kmetijskih pridelkov v Sloveniji, s katero bom prikazala kako so se cene in količine raznih kmetijskih pridelkov spreminjale skozi leta in kakšna je povezava med ceno in količino izdelkov. Poleg tega bom še prikazala, v katerih delih Slovenije je posamezna kmetijska panoga najbol razvita.  Podatke bom črpala iz Sursa in sicer iz https://pxweb.stat.si/SiStatDb/pxweb/sl/30_Okolje/30_Okolje__15_kmetijstvo_ribistvo__04_rastlinska_pridelava__01_15024_pridelki_povrsina/1502410S.px/ (povprečni pridelek pomembnejših kmetijskih kultur-t/h), https://pxweb.stat.si/SiStatDb/pxweb/sl/30_Okolje/30_Okolje__15_kmetijstvo_ribistvo__03_kmetijska_gospod__08_15738_kmet_gosp_stat_reg/1573804S.px/?fbclid=IwAR2gZyOi1tmyySNB591WT59zYIePpn0x9f-UbL_PgYBPU4hOfiXF_AoEdU0(vrsta živine po regijah), https://pxweb.stat.si/SiStatDb/pxweb/sl/30_Okolje/30_Okolje__15_kmetijstvo_ribistvo__02_kmetijske_cene__04_15275_prod_lastn_pride/1527501S.px/(cene)
>>>>>>> 882997836e3aec44a0a813f99b8416900840f457
Tabele:
 1. tabela; zdruižla bom količino pridelkov po regijah in povprečne cene v sloveniji v eno tabelo.
 stolpci: leta -> Slovenija(+cene) in regije
 vrstice:vrsta kmetijskega pridelka
 Analizirala bom torej povezanost med količino in ceno kmetijskih pridelkov, kako sta količina in cena izdelkov povezani s časom ter razlike med količino pridelkov po regijah.




## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `tidyr` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
