## code to prepare `DATASET` dataset goes here


data("telosfull")


# clean up data used for recitation exercise
telosfull$cort[is.na(telosfull$cort)] <-NA
telosfull$cort <- as.numeric(telosfull$cort)
telosfull$Group <- with(telosfull,
                        paste(treatment,sex))

telosfull$Group <- gsub("control","Control",telosfull$Group)
telosfull$Group <- gsub("disturbed","Noise exposure",telosfull$Group)

telosfull$Group <- gsub(" F","\nFemales",telosfull$Group)
telosfull$Group <- gsub(" M","\nMales",telosfull$Group)
telosfull$cort.log <- log(telosfull$cort)
telosfull$telomere.length.log <- log(telosfull$telomere.length)


names(telosfull) <- gsub("treatment",
                         "Treatment",
                         names(telosfull))

names(telosfull) <- gsub("sex",
                         "Sex",
                         names(telosfull))

# Set up supset of focal columns
telosfull_focalcols <- telosfull[,c("Treatment","Sex","telomere.length","cort")]
telosfull_focalcols_rnd <- telosfull_focalcols
telosfull_focalcols_rnd$telomere.length <- telosfull_focalcols_rnd$telomere.length %>% round(2)
telosfull_focalcols_rnd <- telosfull_focalcols_rnd  %>% arrange(Treatment,telomere.length)

telosfull_focalcols_rnd$telo.bin.07 <- ifelse(telosfull_focalcols_rnd$telomere.length < 0.8,
                                              "*","")
telosfull_focalcols_rnd$telo.bin.08 <- ifelse(telosfull_focalcols_rnd$telomere.length < 0.9 &
                                                telosfull_focalcols_rnd$telomere.length >= 0.8,
                                              "*","")
telosfull_focalcols_rnd$telo.bin.09 <- ifelse(telosfull_focalcols_rnd$telomere.length < 1 &
                                                telosfull_focalcols_rnd$telomere.length >= 0.9,
                                              "*","")

# telosfull_focalcols_rnd$telo.bin.10 <- ""
# telosfull_focalcols_rnd$telo.bin.11 <- ""

# save data as .rda
usethis::use_data(telosfull_focalcols_rnd, overwrite = TRUE)

# Note use_data() creates a weird R version dependency issue
# see https://github.com/r-lib/usethis/issues/631
