#����� ����� ��������� � ���
vect <- iris[iris$Species=="setosa" | iris$Species=="virginica" | iris$Species=="versicolor" ,c("Petal.Length","Species")]
#���������� �� ����� ���������
vect <- vect[order(vect$Petal.Length), ]
(factSpecies <- vect$Species)