## code to prepare `chimpbehavior99` dataset goes here


## Create data processing scripts

### Create script file

#usethis::use_data_raw(name = "chimpbehavior99")

### Get the data

# Data extracted from PDF to .xlsx using online tool
# original .xlsx file in /inst/extdata/chimpbehavior-Lycett/Whitten_nature_chimps-ORIG_EXPORT_TO_XLSX.xlsx
# hand editing done in Whitten_nature_chimps_edit.xlsx

# original data contains "+" and "-" as data; R doesn't like "-" in dataframes,
#   and "+" is a special character used in regular expression
# original data contain "?", eg. "e?" "?" is a special character used in regular expressions



# save to chimpbehavior99.csv

file. <- "chimpbehavior99.csv"
path. <- "inst/extdata/chimpbehavior-Lycett"
path.full <- here::here(path., file.)
list.files(here::here(path.))
file.exists(path.full)

## load data
chimpbehavior99 <- read.csv(file = path.full, skip = 3)


## Clean data

# negative signs load as "\xd0"

for(i in 6:ncol(chimpbehavior99)){
  i.xd0 <- which(chimpbehavior99[,i] == "\xd0")
  chimpbehavior99[i.xd0,i] <- "abs"
}

for(i in 6:ncol(chimpbehavior99)){
  i.xd0 <- which(chimpbehavior99[,i] == "(\xd0)")
  chimpbehavior99[i.xd0,i] <- "abs"
}

for(i in 6:ncol(chimpbehavior99)){
  i.e <- which(chimpbehavior99[,i] == "e")
  chimpbehavior99[i.e,i] <- "env"
}


# change "+" to "plus"
for(i in 6:ncol(chimpbehavior99)){
  i.plus <- which(chimpbehavior99[,i] == "+")
  chimpbehavior99[i.plus,i] <- "pres"
}

for(i in 6:ncol(chimpbehavior99)){
  i.eQ <- which(chimpbehavior99[,i] == "e?")
  chimpbehavior99[i.eQ,i] <- "env-amb"
}

for(i in 6:ncol(chimpbehavior99)){
  i.Q <- which(chimpbehavior99[,i] == "?")
  chimpbehavior99[i.Q,i] <- "ambig"
}

for(i in 6:ncol(chimpbehavior99)){
  i.H <- which(chimpbehavior99[,i] == "H")
  chimpbehavior99[i.H,i] <- "hab"
}

for(i in 6:ncol(chimpbehavior99)){
  i.C <- which(chimpbehavior99[,i] == "C")
  chimpbehavior99[i.C,i] <- "cult"
}


## Create short version of behavior.type
summary(as.factor(chimpbehavior99$behavior.type))
behavior.type.short <- chimpbehavior99$behavior.type

behavior.type.short <- gsub("attention-getting","attention",behavior.type.short)
behavior.type.short <- gsub("comfort behaviour","comfort",behavior.type.short)
behavior.type.short <- gsub("exploitation of leaf properties","leaf manip",behavior.type.short)
behavior.type.short <- gsub("miscellaneous exploitation of vegetation properties","veg. manip",behavior.type.short)
behavior.type.short <- gsub("pounding actions","pound",behavior.type.short)

# create short verdion of behavior
chimpbehavior99$behavior
behavior <- chimpbehavior99$behavior
behavior <-  gsub("(^.*)( )([//(])(.*)","\\1",behavior)
behavior <- gsub("[-, //]","",behavior)

i.hammer <- grep("Nuthammer",behavior)

behavior[i.hammer] <- paste0("hammer",1:length(i.hammer))

behavior <- gsub("Termitefishusingleafmidrib", "terminte1",behavior)
behavior <- gsub("Termitefishusingnonleafmaterials", "termine2",behavior)


names(chimpbehavior99) <- gsub("behavior","behvr",names(chimpbehavior99))
names(chimpbehavior99) <- gsub("group","grp",names(chimpbehavior99))


chimpbehavior99 <- data.frame(chimpbehavior99[,1:6],
                              behvr.type.short = behavior.type.short,
                              behavr.short = behavior,
                              chimpbehavior99[,7:ncol(chimpbehavior99)])


### Create the .RData file

#This converts and R object into a .RData file that can be loaded with data().

# If necessary it creates a `r data/`r folder for the package.


usethis::use_data(human_gene_lengths, overwrite = TRUE)


### Create documentation file for the data

# All datasets need a .R file the goes in the `r R/`r folder, along with any .R files that define functions.


usethis::use_r(name = "human_gene_lengths", open = T)



