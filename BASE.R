## Determine number of bases in a DNA sequence ##

# 1. Read DNA sequence
read.DNA <- function(FileName){
        DNAfile <- paste("./", FileName, ".seq", sep = "")
        DNAseq <- scan(file = DNAfile, what = "list")
        print(DNAseq)
}

# 2. Determine number of bases
bp.DNA <- function(DNAseq, FileName){
        Aa = lengths(regmatches(DNAseq[2], gregexpr("[Aa]", DNAseq[2])))
        Gg = lengths(regmatches(DNAseq[2], gregexpr("[Gg]", DNAseq[2])))
        Cc = lengths(regmatches(DNAseq[2], gregexpr("[Cc]", DNAseq[2])))
        Tt = lengths(regmatches(DNAseq[2], gregexpr("[Tt]", DNAseq[2])))
        output <- paste(Aa, Gg, Cc, Tt, sep = ", ") #number of A, G, C, T bases in sequence
        return(output)
        
        countfile = paste0(FileName, ".count")
        write(output, file = countfile) #output file
}

#Example
my_seq <- read.DNA("Random_Sequence")
bp.DNA(my_seq)
