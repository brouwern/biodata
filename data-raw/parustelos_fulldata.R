## Raw data

# The raw data is available via the publisher's website
# https://royalsocietypublishing.org/doi/suppl/10.1098/rsbl.2015.0559)
# in a table in a word document called "rsbl20150559supp1.docx".
# This file is saved in the package folder /inst/extdata
# or just /extdata/sparrowtelomeres.

## Packages
### Data tables can be extracted directly from Word documents
### using docxtractr::docx_extract_all_tbls()

# install.packages("docxtractr")
library(docxtractr)

## Other packages
library(here)

## File folder and relative location
home <- here::here()
list.dirs(home)
data.dir <- here::here("inst/extdata/sparrowtelomeres")
list.files(data.dir)
list.files(data.dir,  full.names = T)
dir.exists(data.dir)

## File name
file.name <- "rsbl20150559supp1.docx"
file.full <- here::here("inst/extdata/sparrowtelomeres",
                        file.name)

file.exists(file.full)


## Alternate - file URL
file.url <-  "https://royalsocietypublishing.org/action/downloadSupplement?doi=10.1098%2Frsbl.2015.0559&file=rsbl20150559supp1.docx"

## Extract docx
### Load docx
file.docx <- docxtractr::read_docx(file.full)

### Extract tables
docx.table.list <- docxtractr::docx_extract_all_tbls(docx = file.docx)

### Works with the URL too
file.docx <- docxtractr::read_docx(file.url)
docx.table.list <- docxtractr::docx_extract_all_tbls(docx = file.docx)


## Produces list of tables
is(docx.table.list)
length(docx.table.list)
str(docx.table.list)

## Call each table from list
### nestlings
parus_telos_nest <- docx.table.list[[1]]

### adults
parus_telos_adult  <- docx.table.list[[2]]

## Examine data
summary(parus_telos_fledge)

## Set up columns as factors or numeric
### column names
nest.char.columns <- c("nest","treatment","fledging")
adult.char.columns <- c("nest","treatment","sex")

head(parus_telos_nest)
head(parus_telos_nest[,nest.char.columns])
