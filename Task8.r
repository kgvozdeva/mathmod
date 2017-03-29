library(ggplot2)

#Получаем значения в которых цена > 10
x <- diamonds[diamonds$price>1000,]
#Получаем вектор и фактор
vec <- x$price
fac <- x$clarity
#Выводим среднюю стоимость цены карата
(result<-with(x, tapply(vec, fac, mean)))