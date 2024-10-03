# start of script
# load library
library(tidyverse)
# make a tibble
df <- tibble(a = 1:10, b = 10:1)
ggplot(df, aes(a, b)) + 
    geom_point()  # plot the tibble
# end of script
