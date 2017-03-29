library(dplyr)
library(readr)
library(stringr)
library(tidyr)

tbl = read_csv(
  "https://www.dropbox.com/s/erhs9hoj4vhrz0b/eddypro.csv?dl=1",
  skip = 1,
  na = c("", "NA", "-9999", "-9999.0"),
  comment = c("[")
)
tbl = tbl[-1, ]
tbl = select(tbl,-(roll))
tbl = tbl %>% mutate_if(is.character, factor)

names(tbl) = names(tbl) %>%
  str_replace_all("[!]", "_emph_") %>%
  str_replace_all("[?]", "_quest_") %>%
  str_replace_all("[*]", "_star_") %>%
  str_replace_all("[+]", "_plus_") %>%
  str_replace_all("[-]", "_minus_") %>%
  str_replace_all("[@]", "_at_") %>%
  str_replace_all("[$]", "_dollar_") %>%
  str_replace_all("[#]", "_hash_") %>%
  str_replace_all("[/]", "_div_") %>%
  str_replace_all("[%]", "_perc_") %>%
  str_replace_all("[&]", "_amp_") %>%
  str_replace_all("[\\^]", "_power_") %>%
  str_replace_all("[()]", "_")

#Оставляем только числовые столбцы
tbl_numeric = tbl[, sapply(tbl, is.numeric)]
#Заменяем все значения -9999 на NA
tbl_numeric[tbl_numeric == -9999] <- NA

#Отбираем все летние месяцы (от 152 до 244)
summer <-
  tbl_numeric[tbl_numeric$DOY >= 152 & tbl_numeric$DOY <= 244,]
#Убираем лишниe столбцы
summer <- summer[, c(-2, -3)]

#Выбираем столбцы у которых коэффициент детерминации > 0,1
cor_td = cor(drop_na(tbl_numeric)) %>% as.data.frame %>% select(co2_flux)
vars = row.names(cor_td)[cor_td$co2_flux ^ 2 > .1] %>% na.exclude
#и выводим их
vars

#Создаем первый вариант модели с некоторыми переменными
model1 <-
  lm(
    co2_flux ~ air_temperature + h2o_flux + Tau + RH + VPD + H + LE,
    data = summer
  )
#Выводим показатели модели
summary(model1)
confint(model1, level = 0.95)
anova(model1)
plot(model1)

#Проверяем коэффициенты корреляции
corFrame = data.frame(
  LE = summer$LE,
  air_temperature = summer$air_temperature,
  h2o_flux = summer$h2o_flux,
  Tau = summer$Tau,
  RH = summer$RH,
  VPD = summer$VPD,
  H = summer$H
)
cor(corFrame, use = "na.or.complete")

#Создаем второй вариант модели с некоторыми переменным
model2 <- lm(co2_flux ~ air_temperature + h2o_flux + RH + H, data = summer)
summary(model2)
confint(model2, level = 0.95)
anova(model2)

anova(model1, model2)
