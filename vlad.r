##Начало - указываем рабочую директорию
setwd("G:/workR")
getwd()
#очистим полностью память
rm(list=ls())
## подключаем необходимые пакеты
library(tidyverse)
library(rnoaa)
#Может занять несколько минут лучше выполнить один раз в месте с хорошим интернетом и сохранить результат
#station_data = ghcnd_stations()
#write.csv(station_data, file = "station_data.csv")
station_data = read.csv("station_data.csv")
#После получения всписка всех станций, получите список станций ближайших к столице вашего региона,создав таблицу с именем региона и координатами его столицы
vlad = data.frame(id = "Vlad", latitude = 43.116418,  longitude = 131.882475)
vlad_around = meteo_nearby_stations(lat_lon_df = vlad, station_data = station_data,
                                    limit = 20, var = c("TAVG"),
                                    year_min = 2009, year_max = 2019)
#vlad_around это список единственным элементом которого является таблица, содержащая идентификаторы метеостанций отсортированных по их 
# удалленности от ВДК, очевидно что первым элементом таблицы будет идентификатор метеостанции ВДК, его то мы и попытаемся получить
vlad_id1 = vlad_around[["Vlad"]][["id"]][1]
vlad_id = vlad_around[["Vlad"]][["id"]]
#Для получения всех данных с метеостанции, зная ее идентификатор, используйте след. команду
all_vlad_data = meteo_tidy_ghcnd(stationid = vlad_id1)
