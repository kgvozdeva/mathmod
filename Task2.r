dataIris <- iris[,1:4]
#Применяем функцию apply с mean для получения среднего 
result <- apply(dataIris, 1, mean)
result
