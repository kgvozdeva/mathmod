DNA <- c("A","C","G","T")
DNA <- sample(DNA, size = 1000, replace = T);
DNA <- factor(DNA)
DNA
summary(DNA)
length(DNA)
DNA_AT <- (summary(DNA))
DNA_AT <- DNA_AT[c("A","T")]
DNA_AT
propDNA_AT <- DNA_AT/1000
propDNA_AT
DNA_AT <- c(DNA_AT, propDNA_AT)
DNA_AT