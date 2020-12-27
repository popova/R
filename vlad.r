##������ - ��������� ������� ����������
setwd("G:/workR")
getwd()
#������� ��������� ������
rm(list=ls())
## ���������� ����������� ������
library(tidyverse)
library(rnoaa)
#����� ������ ��������� ����� ����� ��������� ���� ��� � ����� � ������� ���������� � ��������� ���������
#station_data = ghcnd_stations()
#write.csv(station_data, file = "station_data.csv")
station_data = read.csv("station_data.csv")
#����� ��������� ������� ���� �������, �������� ������ ������� ��������� � ������� ������ �������,������ ������� � ������ ������� � ������������ ��� �������
vlad = data.frame(id = "Vlad", latitude = 43.116418,  longitude = 131.882475)
vlad_around = meteo_nearby_stations(lat_lon_df = vlad, station_data = station_data,
                                    limit = 20, var = c("TAVG"),
                                    year_min = 2009, year_max = 2019)
#vlad_around ��� ������ ������������ ��������� �������� �������� �������, ���������� �������������� ������������ ��������������� �� �� 
# ������������ �� ���, �������� ��� ������ ��������� ������� ����� ������������� ������������ ���, ��� �� �� � ���������� ��������
vlad_id1 = vlad_around[["Vlad"]][["id"]][1]
vlad_id = vlad_around[["Vlad"]][["id"]]
#��� ��������� ���� ������ � ������������, ���� �� �������������, ����������� ����. �������
all_vlad_data = meteo_tidy_ghcnd(stationid = vlad_id1)
