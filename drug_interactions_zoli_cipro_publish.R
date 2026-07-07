##Zoli cipro
#Bailey Bowcutt
#09.3.2025

library(dplyr)
setwd("path/to/your/folder")

#remove all currently saved variables, as there are some variable replicates between R files
rm(list=ls())

## ---------------------- Data  ---------------------- ##
# 1 = growth, 0 = no growth 
#concentrations_A and B were deleted due to pilot plates not working, so there is a gap in variable names 

concentrations_C <- c(0, .5, 1, 2, 4, 8) #Zoli
concentrations_D <- c(0, .25, .5, 1, 2, 4) #cipro

data_list2 <- list(
  GCGS0481_91S_95G_D429N = list( 
    Replicate1_103124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_112324 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95N_D429N = list( 
    Replicate1_103124 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_112324 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95A_D429N = list( 
    Replicate1_103124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      0, 1, 1, 1, 1, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_112324 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_D <- c(0, .25, .5, 1, 2, 4) #Zoli
concentrations_E <- c(0, 2, 4, 8, 16, 32) #cipro
data_list3 <- list(
  GCGS0481_91F_95A_D429N = list( 
    Replicate1_103124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_112324 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95N_D429N = list( 
    Replicate1_103124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_112324 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G_D429N = list( 
    Replicate1_103124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_103124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_F <- c(0, .032, .063, .125, .25, 0.5) #Zoli
#concentrations_F <- c(0, .032, .063, .125, .25, 0.5) #cipro
data_list4 <- list(
  GCGS0481_91S_95G = list( 
    Replicate1_032825 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95N = list( 
    Replicate1_032825 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


concentrations_G <- c(0, .063, .125, .25, .5, 1) #Zoli
#concentrations_F <-c(0, .032, .063, .125, .25, 0.5) #cipro
data_list5 <- list(
  GCGS0481_91S_95N = list( 
    Replicate2_063025 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95G = list( 
    Replicate2_063025 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_H <- c(0, .008, .016, .032, .063, .125) #Zoli
concentrations_B2 <- c(0, 4, 8, 16, 32, 64) #cipro
data_list6 <- list(
  HHH023_91F_95A = list( 
    Replicate1_072525 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_073025 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0 
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH040_91F_95G = list( 
    Replicate1_072525 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_073025 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  H18208_91F_95A = list( 
    Replicate1_072525 = matrix(c( 
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_073025 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  EEE016_91F_95G = list( 
    Replicate1_091825 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  EEE036_91F_95A = list( 
    Replicate1_091825 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110625 = matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0738_91F_95G_D86N = list( 
    Replicate2_091825 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


#concentrations_H <- c(0, .008, .016, .032, .063, .125) #zoli
concentrations_C <- c(0, .5, 1, 2, 4, 8) #cipro
data_list7 <- list(
  CCC033_91F_95A_D86N = list( 
    Replicate2_073125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  Ng183_91F_95A = list( 
    Replicate1_073125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110525 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH014_91F_95A = list( 
    Replicate1_110525 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_H <- c(0, .008, .016, .032, .063, .125) #zoli
#concentrations_D <- c(0, .25, .5, 1, 2, 4) #cipro
data_list8 <- list(
  CCC033_91F_95A_D86N = list( 
    Replicate1_032825 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0215_91F_95G = list( 
    Replicate1_091925 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110525 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_I <- c(0, .016, .032, .063, .125, .25) #zoli
#concentrations_E <- c(0, 2, 4, 8, 16, 32) #cipro
data_list9 <- list(
  DDD033_91F_95A_D86N = list( 
    Replicate1_081925= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_091125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0738_91F_95G_D86N = list( 
    Replicate1_091125= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_J <- c(0, .00025, .0005, .001, .002, .004) #zoli
concentrations_K <- c(0, 1, 2, 4, 8, 16) #cipro
data_list10 <- list(
  Ng175_91F_95A = list( 
    Replicate1_082725= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_L <- c(0, .0005, .001, .002, .004, 0.008) #zoli
#concentrations_K <- c(0, 1, 2, 4, 8, 16) #cipro
data_list11 <- list(
  Ng175_91F_95A = list( 
    Replicate2_090325= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_I <- c(0, .016, .032, .063, .125, .25) #zoli
#concentrations_L <- c(0, .0005, .001, .002, .004, 0.008) #cipro
data_list12 <- list(
  MS11_91S_95D = list( 
    Replicate1_092625= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_101525= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <-c(0, .032, .063, .125, .25, 0.5) #zoli
concentrations_M <- c(0, .125, .25, .5, 1, 2) #cipro
data_list13 <- list(
  GCGS0481_91F_95D = list( 
    Replicate1_101525= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_101725= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <-c(0, .032, .063, .125, .25, 0.5) #zoli
#concentrations_H <- c(0, .008, .016, .032, .063, .125) #cipro
data_list14 <- list(
  GCGS0481_91S_95A = list( 
    Replicate1_101525= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_101725= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_C <- c(0, .5, 1, 2, 4, 8) #zoli
#concentrations_C <- c(0, .5, 1, 2, 4, 8) #cipro 
data_list15 <- list(
  GCGS0481_91F_95D_D429N = list( 
    Replicate1_101725= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_102125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <-c(0, .032, .063, .125, .25, 0.5) #zoli
concentrations_N <- c(0, 4, 8, 16, 32, 64) #cipro
data_list16 <- list(
  GCGS0481_91F_95N = list( 
    Replicate1_102125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110525= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95A = list( 
    Replicate1_102125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110525= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G = list( 
    Replicate1_102125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110525= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_D <- c(0, .25, .5, 1, 2, 4) #Zoli
concentrations_P <- c(0, .004, .008, .016, .032, .063) #cipro
data_list17 <- list(
  GCGS0481_91S_95D_D429N = list( 
    Replicate1_102125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110625= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_I <- c(0, .016, .032, .063, .125, .25) #zoli
concentrations_Q <- c(0, 8, 16, 32, 64, 128) #cipro
data_list18 <- list(
  GCGS0860_91F_95N = list( 
    Replicate1_102925= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110625= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH012_91F_92P_95Y_D86N = list( 
    Replicate1_102925= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110625= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_H <- c(0, .008, .016, .032, .063, .125) #zoli
concentrations_R <- c(0, 1, 2, 4, 8, 16) #cipro
data_list19 <- list(
  HHH014_91F_95A = list( 
    Replicate2_111125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <-c(0, .032, .063, .125, .25, 0.5) #zoli
concentrations_S <- c(0, 0.002, .004, .008, .016, .032) #cipro
data_list20 <- list(
  GCGS0481_91S_95D = list( 
    Replicate1_030425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_030425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

# ---------------------- Data Analysis ----------------------

# Find MICs from a single plate:
# Columns = Zoliflodacin concentrations, Rows = Cipro concentrations
get_mic_values <- function(growth_matrix, conc_zoliflodacin_cols, conc_ciprofloxacin_rows) {
  mic_zoli <- conc_zoliflodacin_cols[match(0, growth_matrix[1, ])]
  if (is.na(mic_zoli)) mic_zoli <- max(conc_zoliflodacin_cols) * 2
  
  mic_cipro <- conc_ciprofloxacin_rows[match(0, growth_matrix[, 1])]
  if (is.na(mic_cipro)) mic_cipro <- max(conc_ciprofloxacin_rows) * 2
  
  list(MIC_zoli = mic_zoli, MIC_cipro = mic_cipro)
}

# Build a FICI matrix using rules
get_fici_matrix <- function(growth_matrix, conc_zoliflodacin_cols, conc_ciprofloxacin_rows,
                            mic_zoli, mic_cipro) {
  nr <- nrow(growth_matrix); nc <- ncol(growth_matrix)
  
  zero_pos <- which(growth_matrix == 0, arr.ind = TRUE) #find all no growth wells 
  if (nrow(zero_pos) == 0) return(matrix(NA_real_, nrow = nr, ncol = nc))
  
  keep <- apply(zero_pos, 1, function(rc) {
    i <- rc[1]; j <- rc[2]
    if (i == 1 || j == 1) return(FALSE) # skip single-drug rows/columns for FICI
    #below, require at least one neighbor for growth 
    left  <- j > 1  && growth_matrix[i, j-1] == 1
    right <- j < nc && growth_matrix[i, j+1] == 1
    up    <- i > 1  && growth_matrix[i-1, j] == 1
    down  <- i < nr && growth_matrix[i+1, j] == 1
    #the concentration must be greater than 0 (probably not needed but a good check)
    (conc_zoliflodacin_cols[j] > 0) &&
      (conc_ciprofloxacin_rows[i] > 0) &&
      (left || right || up || down)
  })
  
  F <- matrix(NA_real_, nrow = nr, ncol = nc)
  if (any(keep)) {
    sel <- zero_pos[keep, , drop = FALSE] #subset to only keep cells that are MICs (have growth nearby but no growth themselves)
    F[cbind(sel[,1], sel[,2])] <-
      (conc_zoliflodacin_cols[sel[,2]] / mic_zoli) + #concentration zoli combo/mic zoli 
      (conc_ciprofloxacin_rows[sel[,1]] / mic_cipro) #concentration cipro combo/mic cipro 
  }
  F
}

# Convert strain's replicate plates into a tidy table (with concentrations)
summarize_replicates <- function(strain_name, replicate_list,
                                 conc_zoliflodacin_cols, conc_ciprofloxacin_rows,
                                 block_label) {
  do.call(rbind, lapply(names(replicate_list), function(rep_name) {
    mat <- replicate_list[[rep_name]]
    mics <- get_mic_values(mat, conc_zoliflodacin_cols, conc_ciprofloxacin_rows)
    F <- get_fici_matrix(mat, conc_zoliflodacin_cols, conc_ciprofloxacin_rows,
                         mics$MIC_zoli, mics$MIC_cipro)
    
    grid <- expand.grid(RowIndex = seq_len(nrow(F)), ColIndex = seq_len(ncol(F)))
    grid$FICI <- as.vector(F)
    grid$Strain <- strain_name
    grid$Replicate <- rep_name
    grid$MIC_zoliflodacin <- mics$MIC_zoli
    grid$MIC_ciprofloxacin  <- mics$MIC_cipro
    grid$Zoliflodacin_uM  <- conc_zoliflodacin_cols[grid$ColIndex]
    grid$ciprofloxacin_uM   <- conc_ciprofloxacin_rows[grid$RowIndex]
    grid$PlateDesign      <- block_label
    grid
  }))
}

# Run one "experiment block": a data_list plus its concentration vectors
run_block <- function(block_data, conc_zoli, conc_cipro, block_label) {
  do.call(rbind, lapply(names(block_data), function(strain) {
    summarize_replicates(strain, block_data[[strain]],
                         conc_zoli, conc_cipro, block_label)
  }))
}

# ---------------------- Map existing objects to blocks ----------------------

results <- list(
  run_block(data_list2, concentrations_C, concentrations_D, "Block C×D"),
  run_block(data_list3, concentrations_D, concentrations_E, "Block D×E"),
  run_block(data_list4, concentrations_F, concentrations_F, "Block F×F"),
  run_block(data_list5, concentrations_G, concentrations_F, "Block G×F"),
  run_block(data_list6, concentrations_H, concentrations_B2, "Block H×B2"),
  run_block(data_list7, concentrations_H, concentrations_C, "Block H×C"),
  run_block(data_list8, concentrations_H, concentrations_D, "Block H×D"),
  run_block(data_list9, concentrations_I, concentrations_E, "Block I×E"),
  run_block(data_list10, concentrations_J, concentrations_K, "Block J×K"),
  run_block(data_list11, concentrations_L, concentrations_K, "Block L×K"),
  run_block(data_list12, concentrations_I, concentrations_L, "Block I×L"),
  run_block(data_list13, concentrations_F, concentrations_M, "Block F×M"),
  run_block(data_list14, concentrations_F, concentrations_H, "Block F×H"),
  run_block(data_list15, concentrations_C, concentrations_C, "Block C×C"),
  run_block(data_list16, concentrations_F, concentrations_N, "Block F×N"),
  run_block(data_list17, concentrations_D, concentrations_P, "Block D×P"),
  run_block(data_list18, concentrations_I, concentrations_Q, "Block I×Q"),
  run_block(data_list19, concentrations_H, concentrations_R, "Block H×R"),
  run_block(data_list20, concentrations_F, concentrations_S, "Block F×S")
)

all_results_long <- bind_rows(results)

# Keep only computed FICI values
all_results_for_plot <- filter(all_results_long, !is.na(FICI))

# ---------------------- Category labels for FICI ranges ----------------------
all_results_for_plot <- all_results_for_plot %>%
  mutate(FICI_Category = factor(
    dplyr::case_when(
      FICI <= 0.5 ~ "Synergy",
      FICI <= 1   ~ "Additivity",
      FICI <= 4   ~ "Indifference",
      TRUE        ~ "Antagonism"
    ),
    levels = c("Antagonism", "Indifference", "Additivity", "Synergy")
  ))


#counting replicates 
all_data_lists <- list(data_list2, data_list3,data_list4, data_list5,
                       data_list6,data_list7, data_list8, data_list9,data_list10,
                       data_list11, data_list12,data_list13, data_list14, data_list15,
                       data_list16, data_list17, data_list18, data_list19, data_list20)


# Combine all lists into one
combined_data <- do.call(c, all_data_lists)

# Count replicates per strain
replicate_counts <- sapply(combined_data, function(strain_list) length(strain_list))

# Combine counts for duplicate strain names
replicate_summary <- tapply(replicate_counts, names(replicate_counts), sum)

# View results neatly (there should be 2 replicates of every strain)
replicate_summary



### finding mean FICI ###

fici_by_strain <- all_results_for_plot %>%
  group_by(Strain) %>%
  summarise(
    n_FICI = n(),
    mean_FICI = mean(FICI, na.rm = TRUE),
    min_FICI  = min(FICI, na.rm = TRUE),
    max_FICI  = max(FICI, na.rm = TRUE),
    FICI_summary = sprintf(
    "%.3f(%.3f-%.3f)",
    mean_FICI,
    min_FICI,
    max_FICI
  ),
  .groups = "drop"
  ) %>%
    select(Strain, n_FICI, FICI_summary) 

write.csv(fici_by_strain,
          file = "zoli_cipro_fici_by_strain_2026_03_06.csv",
          row.names = FALSE)


###METADATA####

#getting just MIC data for my metadata 
zoli_cipro_mic_per_replicate <- all_results_long %>%
  select(Strain, Replicate,
         MIC_zoliflodacin, MIC_ciprofloxacin) %>%
  distinct() %>%
  arrange(Strain, Replicate)

zoli_cipro_mic_per_replicate

#combine into single column 
zoli_cipro_mic_collapsed <- zoli_cipro_mic_per_replicate %>%
  group_by(Strain) %>%
  summarise(
    MIC_zoliflodacin = paste(sort(unique(MIC_zoliflodacin)), collapse = "/"),
    MIC_ciprofloxacin = paste(sort(unique(MIC_ciprofloxacin)), collapse = "/"),
    .groups = "drop"
  ) %>%
  arrange(Strain)

zoli_cipro_mic_collapsed

write.csv(zoli_cipro_mic_collapsed,
          file = "zoli_cipro_mic_collapsed.csv",
          row.names = FALSE)

