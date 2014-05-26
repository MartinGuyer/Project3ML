library(dplyr)

mushroom = read.csv("Data/MushroomData.txt", header=TRUE)
tbl_df(mushroom)
unique()