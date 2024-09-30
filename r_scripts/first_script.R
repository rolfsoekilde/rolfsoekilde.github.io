# usefull r-scripts
library(tidyverse)
df <- tibble(a = 1:10, b = 10:1)
ggplot(df, aes(a, b))+geom_point()