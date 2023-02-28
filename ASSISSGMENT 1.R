#importing Libraries
library(rvest)
library(dplyr)

#scrapping website
link <- 'https://en.wikipedia.org/wiki/List_of_shopping_malls_in_India'

#allowability
path = paths_allowed(link)

#html elements from website
web <- read_html(link)

#segregating rank
NAME <- web %>% html_nodes(".plainrowheaders td:nth-child(1)") %>% html_text()

#viewing rank
View(NAME)

LOCATION <- web %>% html_nodes(".plainrowheaders td:nth-child(2)") %>% html_text()

View(LOCATION)

YEAR <- web %>% html_nodes(".plainrowheaders td:nth-child(3)")  %>% html_text()

View(YEAR)

TOTALAREA <- web %>% html_nodes(".plainrowheaders td:nth-child(4)") %>% html_text()

View(TOTALAREA)

en.wikipedia.org <- data.frame(NAME, LOCATION, YEAR, TOTALAREA)

View(en.wikipedia.org)

write.csv(en.wikipedia.org,'List of shopping malls in India.csv')
