## code to prepare `human_gene_lengths` dataset goes here


## Create data processing scripts

### Creare script file

usethis::use_data_raw(name = "human_gene_lengths")

### Get the data

# data from Whitlock and Schulter's 2nd edition of [*Analysis of Biological Data*](https://www.amazon.com/Analysis-Biological-Data-Michael-Whitlock/dp/0981519407), downloaded from the [book's website](https://whitlockschluter.zoology.ubc.ca/) https://whitlockschluter.zoology.ubc.ca/


human_gene_lengths <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter04/chap04e1HumanGeneLengths.csv"))
names(human_gene_lengths) <- "gene_length"


### Create the .RData file

#This converts and R object into a .RData file that can be loaded with data().

# If necessary it creates a `r data/`r folder for the package.


usethis::use_data(human_gene_lengths, overwrite = TRUE)


### Create documentation file for the data

# All datasets need a .R file the goes in the `r R/`r folder, along with any .R files that define functions.


usethis::use_r(name = "human_gene_lengths", open = T)



