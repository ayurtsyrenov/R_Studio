
# задача - построить прогноз для котировок BTC методами ARIMA и Holt-Winters
# подключаем необходимые библиотеки
library(ggplot2)
library(tseries)
library(forecast)

data <- read.table(file = "BTC.csv", header = TRUE, sep = ";")
#data <- read.table(file = file.choose(), header = TRUE, sep = ";")
summary(data)
ts_data <- ts(data$PRICE, start=c(2019,09,22), frequency = 365)
plot(ts_data, main = "Котировки BTC/USD", xlab = "Time", ylab = "Value")

# изучаем временной ряд визуально по ACF/PACF
tsdisplay(ts_data)

# проведем тест на единичный корень, найдем степень интегрируемости
adf.test(ts_data)

# нулевую гипотезу о наличии единичного корня принимаем на 5% уровне значимости
# следовательно необходимо привести ряд к стационарному виду

d_data <- diff(ts_data)
adf.test(d_data)

# избавились от единичного корня путем взятия первой разности (диффиренцированием)
# коэффициенты для ARIMA = (1,1,0)
mod_1 <- arima(ts_data, order = c(1,1,0))
summary(mod_1)
prognoz <- forecast(mod_1, h=5)
prognoz
plot(prognoz,  main = "Прогноз котировок BTC/USD", xlab = "Time", ylab = "Value")

mod_2 <- auto.arima(ts_data)
summary(mod_2)
prognoz2 <- forecast(mod_2, h=5)
prognoz2
plot(prognoz2, main = "Прогноз котировок BTC/USD", xlab = "Time", ylab = "Value")


# Прогнозирование по методу Хольта-Винтерса

mod_3 <-hw(ts_data, seasonal = NULL)
prognoz3<-forecast(mod, h=5)
prognoz3
plot(prognoz3, main = "Прогноз котировок BTC/USD", xlab = "Time", ylab = "Value")
