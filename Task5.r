#Берем длину лепестков и вид
vect <- iris[iris$Species=="setosa" | iris$Species=="virginica" | iris$Species=="versicolor" ,c("Petal.Length","Species")]
#Сортировка по длине лепестков
vect <- vect[order(vect$Petal.Length), ]
(factSpecies <- vect$Species)