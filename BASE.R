## Determine number of bases in a DNA sequence ##

bp.DNA <- function(FileName){
        #Read DNA sequence
        DNAfile <- paste("./", FileName, ".seq", sep = "")
        DNAseq <- scan(file = DNAfile, what = "list")
        print(DNAseq)
        
        #Count number of bases
        Aa = lengths(regmatches(DNAseq[2], gregexpr("[Aa]", DNAseq[2])))
        Gg = lengths(regmatches(DNAseq[2], gregexpr("[Gg]", DNAseq[2])))
        Cc = lengths(regmatches(DNAseq[2], gregexpr("[Cc]", DNAseq[2])))
        Tt = lengths(regmatches(DNAseq[2], gregexpr("[Tt]", DNAseq[2])))
        
        #Write results
        output <- paste(Aa, Gg, Cc, Tt, sep = ", ") #number of A, G, C, T bases in sequence
        countfile = paste0(FileName, ".count")
        write(output, file = countfile) #output file
        return(output)
}

#Example
# bp.DNA("Random_Sequence")
