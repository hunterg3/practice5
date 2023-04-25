##DS202 Practice 5 part 2##

library(tidyverse)

person = read.csv("https://raw.githubusercontent.com/yumouqiu/DS202-Spring2023/main/Practice/data/fars2016/person.csv")
head(person)
accident = read.csv("https://raw.githubusercontent.com/yumouqiu/DS202-Spring2023/main/Practice/data/fars2016/accident.csv")
head(accident)

#Problem 1#
driver = person %>% filter(PER_TYP == 1)
head(driver)

#Problem 2#
combined = full_join(accident, driver, by = c("STATE","ST_CASE", "VE_FORMS", "COUNTY", "DAY", "MONTH", "HOUR", "MINUTE", "RUR_URB", 
                                              "FUNC_SYS", "HARM_EV", "MAN_COLL", "SCH_BUS" ))
head(combined)

#Problem 3#
num3 = combined %>% group_by(DAY_WEEK, HOUR, SEX) %>% filter((SEX == 1 | SEX == 2) & HOUR < 25) %>% summarise(Number_Accidents = n())
num3 %>% ggplot(aes(x = HOUR, y = Number_Accidents, color = factor(DAY_WEEK), size = factor(SEX))) + geom_point(alpha =0.5)
