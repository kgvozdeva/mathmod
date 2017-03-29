library(ggplot2)

#Стандартная функция plot
plot(x=iris$Sepal.Length, 
     y=iris$Petal.Length, 
     col=iris$Species, 
     main="График зависимости", 
     xlab="Длина чашелистиков (Sepal.Length)", 
     ylab="Длина лепестков (Petal.Length)",
     pch= 20)
legend("topleft", legend = levels(iris$Species) , title="Виды", col = c(1:3), pch = 20)

#Библиотека ggplot2
#geom_point - точки на графике
ggplot(iris, aes(Sepal.Length, Petal.Length)) +
  xlab("Длина чашелистиков (Sepal.Length)") + 
  ylab("Длина лепестков (Petal.Length)") +
  geom_point(aes(colour = Species))
