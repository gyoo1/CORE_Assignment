#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 14 10:51:26 2022

@author: gyoo1
"""

## Function for generating a random DNA sequence
import random
def DNAgen(FileName, Nb):
    nts = ["A", "T", "G", "C"]
    my_seq = random.choices(nts, k = Nb) #generate random sequence
    my_seq = "".join(my_seq) #convert list to string
    
    file = "./" + FileName + ".seq"
    output = open(file, "w")
    output.write(">" + FileName + "\n" + my_seq)
    output.close()
    
    print(">" + FileName + "\n" + my_seq)

#example
DNAgen("my_sequence", 21)
