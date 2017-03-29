customMedian <- function(vect) {
  #Проверка входных данных, что это вектор
  if (!is.vector(vect))
    stop("Входные данные должны быть вектором")
  #Берем длину вектора
  lengthVect <- length(vect)
  #Половина длины вектора
  halfVect <- floor((lengthVect + 1) / 2)
  #Проверка на четное и нечетное количество элементов
  if (lengthVect %% 2 == 0) {
    return(mean(sort(vect)[halfVect + 0:1]))
  } else {
    return(sort(vect)[halfVect])
  }
}

x <- c(1, 55, 444, 965, 45, 3, 8, 5.8, 6)

customMedian(x)
median(x)

