library(ggplot2)

#�������� �������� � ������� ���� > 10
x <- diamonds[diamonds$price>1000,]
#�������� ������ � ������
vec <- x$price
fac <- x$clarity
#������� ������� ��������� ���� ������
(result<-with(x, tapply(vec, fac, mean)))