library(readxl)
library(dplyr)


carteira <- read_xlsx('Carteira.xlsx')
View(carteira)

carteira <- data.frame(carteira)
View(carteira)

carteira <- carteira %>% slice(3:15)
View(carteira)


carteira <- rename(carteira, posicao = Fundos.de.Investimentos.Imobiliários...FIIS,
                   ticker = ...2, quant_cotas = ...3, tipo = ...4, segmento = ...5,
                   gestora = ...6, quant_ativos = ...7, estado = ...8, valor_investido = ...9,
                   vfisi = ...10, vfina = ...11, relatorio = ...12)

View(carteira)


carteira <- carteira[, c(1:9)]
carteira$estado <- NULL

write.csv(carteira, 'carteira.csv')

read.csv('carteira.csv')
View(carteira)


valor <- carteira$valor_investido
FIIS <- carteira$ticker

 
percent <- round(valor/sum(valor)*100)
FIIS <- paste(FIIS, percent)
FIIS <- paste(FIIS, '%', sep = '')



pie(valor, labels = FIIS, col = rainbow(length(FIIS)),
    main = 'Dsitribuição de Valores por FII')
  

