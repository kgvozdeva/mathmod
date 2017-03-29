customMedian <- function(vect) {
  #�������� ������� ������, ��� ��� ������
  if (!is.vector(vect))
    stop("������� ������ ������ ���� ��������")
  #����� ����� �������
  lengthVect <- length(vect)
  #�������� ����� �������
  halfVect <- floor((lengthVect + 1) / 2)
  #�������� �� ������ � �������� ���������� ���������
  if (lengthVect %% 2 == 0) {
    return(mean(sort(vect)[halfVect + 0:1]))
  } else {
    return(sort(vect)[halfVect])
  }
}

x <- c(1, 55, 444, 965, 45, 3, 8, 5.8, 6)

customMedian(x)
median(x)

