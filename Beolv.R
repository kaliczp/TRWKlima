## Csomag betöltése
library(treeclim)
library(dplR)

## Arstan adat betöltése
Kölked.ars <- read.table("K-LW.rwl_tabs.txt", head = TRUE)
## Oszlopok kiválasztása
Kölked.crn <- Kölked.ars[,c("std", "num")]
## Év mint sor név
row.names(Kölked.crn) <- Kölked.ars$year
## Oszlopnevek változtatása
colnames(Kölked.crn) <- c("MESstd", "samp.depth")
## S3 osztály beállítás dplR chron-hoz
class(Kölked.crn) <- c("crn", "data.frame")
## A beolvasás ellenőrzése
plot(Kölked.crn)
