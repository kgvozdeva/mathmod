library(ggplot2)

#����������� ������� plot
plot(x=iris$Sepal.Length, 
     y=iris$Petal.Length, 
     col=iris$Species, 
     main="������ �����������", 
     xlab="����� ������������ (Sepal.Length)", 
     ylab="����� ��������� (Petal.Length)",
     pch= 20)
legend("topleft", legend = levels(iris$Species) , title="����", col = c(1:3), pch = 20)

#���������� ggplot2
#geom_point - ����� �� �������
ggplot(iris, aes(Sepal.Length, Petal.Length)) +
  xlab("����� ������������ (Sepal.Length)") + 
  ylab("����� ��������� (Petal.Length)") +
  geom_point(aes(colour = Species))
