## Excel
library(readxl)
ttfile <- "CRU_T-P.xlsx"
ttsheets <- excel_sheets(ttfile)

## Kölked hőmérséklet (T)
tti <- 1
ttactual <- read_excel(ttfile, sheet = ttsheets[tti])
ttactual.df <- as.data.frame(ttactual[-(1:23),-1])
Kolked_T <- round(as.numeric(t(ttactual.df[-1,-1])), 2)
Kolked_T.ts <- ts(Kolked_T, c(1901,1), freq = 12)
plot(Kolked_T.ts)

## Kölked csapadék (P)
tti <- 3
ttactual <- read_excel(ttfile, sheet = ttsheets[tti])
ttactual.df <- as.data.frame(ttactual[-(1:23),-1])
Kolked_P <- round(as.numeric(t(ttactual.df[-1,-1])), 2)
Kolked_P.ts <- ts(Kolked_P, c(1901,1), freq = 12)
plot(Kolked_P.ts, typ="h")

## Kölked data.frame
Kolked.df <- data.frame(year = trunc(as.numeric(time(Kolked_T.ts))),
                        month = as.numeric(cycle(Kolked_T.ts)),
                        temp = Kolked_T,
                        prec = Kolked_P
                        )

## Kölked export
write.table(Kolked.df, "KölkedClim.txt", sep = "\t")
