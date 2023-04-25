##DS202 Practice 5 part 1##

library(tidyverse)

accident = read.csv("https://raw.githubusercontent.com/yumouqiu/DS202-Spring2023/main/Practice/data/fars2016/accident.csv")
head(accident)

#problem 1#
num1 = accident %>% ggplot(aes(x=DAY_WEEK)) + geom_histogram()
num1

#problem 2#
num2 = accident %>% ggplot(aes(x=HOUR)) + geom_histogram()
num2

#problem 3#
num3 = accident %>% filter(DRUNK_DR > 0)
dim(num3)
