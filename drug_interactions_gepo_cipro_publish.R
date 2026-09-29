##gepo cipro drug interactions
#Bailey Bowcutt
#09.18.2026

library(dplyr)
setwd("path/to/your/folder")

#remove all currently saved variables, as there are some variable replicates between R files
rm(list=ls())

## ---------------------- Data  ---------------------- ##
# Concentration vectors
# 1 = growth, 0 = no growth 
concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #Gepotidacin
concentrations_B <- c(0, 2, 4, 8, 16, 32) #Cipro

data_list <- list(
  H18208_91F_95A = list(
    Replicate1_080124 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_080224 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G = list(
    Replicate1_080124 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_080224 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #gepo 
concentrations_C <- c(0, .063, .125, .25, 0.5, 1) #Cipro  

data_list2 <- list(
  GCGS0481_91S_95N = list(
    Replicate1_032725 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_082725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95D = list(
    Replicate1_032725 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95A_D429N = list(
    Replicate1_032725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95G = list(
    Replicate1_082725 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #Gepotidacin 
concentrations_D <- c(0, .008, .016, .032, 0.063, .125) #Cipro  

data_list3 <- list(
  GCGS0481_91S_95A = list(
    Replicate1_032725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95D_D429N = list(
    Replicate1_032725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #gepo
concentrations_E <- c(0, 4, 8, 16, 32, 64) #cipro
data_list4 <- list(
  GCGS0481_91F_95A_D429N = list(
    Replicate1_061425 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061825 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95N_D429N = list(
    Replicate1_061425 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061825 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G_D429N = list(
    Replicate1_061425 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061825 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95A = list(
    Replicate1_061425 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061825 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH040_91F_95G = list(
    Replicate1_110625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95N = list(
    Replicate1_110625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  EEE016_91F_95G = list(
    Replicate1_110625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  EEE036_91F_95A = list(
    Replicate1_110625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #gepo
concentrations_F <- c(0, .25, 0.5, 1, 2, 4) #cipro
data_list5 <- list(
  GCGS0481_91S_95G_D429N = list(
    Replicate1_082125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE), 
    Replicate2_082725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95N_D429N = list(
    Replicate1_082125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_082725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_G <- c(0, .125, .25, 0.5, 1, 2) #gepo 
concentrations_H <- c(0, 8, 16, 32, 64, 128) #cipro 
data_list6 <- list(
  GCGS0860_91F_95N = list( 
    Replicate1_082225= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_082825= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH023_91F_95A = list( 
    Replicate1_082225= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_082825= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0738_91F_95G_D86N = list( 
    Replicate1_082225= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH012_91F_92P_95Y_D86N  = list( 
    Replicate1_082225= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


#concentrations_C <- c(0, .063, .125, .25, 0.5, 1) #gepo
#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #cipro 
data_list7 <- list(
  GCGS0481_91S_95G = list(
    Replicate2_090325 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_D <- c(0, .008, .016, .032, 0.063, .125) #gepo 
concentrations_I <- c(0, 1, 2, 4, 8, 16) #Cipro
data_list8 <- list(
  Ng175_91F_95A = list(
    Replicate1_101625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110425 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <- c(0, .25, 0.5, 1, 2, 4) #gepo
concentrations_J <- c(0, 0.5, 1, 2, 4, 8) #cipro
data_list9 <- list(
  Ng183_91F_95A = list(
    Replicate1_102125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_103125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  CCC033_91F_95A_D86N = list(
    Replicate1_102125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_103125 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_G <- c(0, .125, .25, 0.5, 1, 2) #gepo 
#concentrations_I <- c(0, 1, 2, 4, 8, 16) #Cipro
data_list10 <- list(
  DDD033_91F_95A_D86N = list(
    Replicate1_102925 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_103125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_C <- c(0, .063, .125, .25, 0.5, 1) #gepo 
concentrations_K <- c(0, 0.0005, 0.001, 0.002, 0.004, 0.008) #cipro
data_list11 <- list(
  MS11_91S_95D = list(
    Replicate1_102925 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_103125 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5)  #gepo 
concentrations_L <- c(0, 0.004, .008, .016, .032, 0.063) #cipro 
data_list12 <- list(
  GCGS0481_91S_95D_D429N = list(
    Replicate2_110425 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95D = list(
    Replicate1_110425 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_110725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <- c(0, .25, 0.5, 1, 2, 4) #gepo
#concentrations_H <- c(0, 8, 16, 32, 64, 128) #cipro 
data_list13 <- list(
  HHH012_91F_92P_95Y_D86N  = list( 
    Replicate2_110425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0738_91F_95G_D86N  = list( 
    Replicate2_110425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5)  #gepo 
#concentrations_I <- c(0, 1, 2, 4, 8, 16) #Cipro
data_list14 <- list(
  HHH014_91F_95A = list( 
    Replicate1_110725= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95D_D429N = list( 
    Replicate1_110725= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_C <- c(0, .063, .125, .25, 0.5, 1) #gepo 
#concentrations_G <- c(0, .125, .25, 0.5, 1, 2) #cipro
data_list15 <- list(
  NY0215_91F_95G = list( 
    Replicate1_110725= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_111125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95D = list( 
    Replicate2_121625= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5)  #gepo 
#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5)  #cipro 
data_list16 <- list(
  GCGS0481_91S_95A = list( 
    Replicate2_110725= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95A_D429N = list( 
    Replicate2_110725= matrix(c( #possibly redo 
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_A <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #gepo 
#concentrations_J <- c(0, 0.000325, 0.00075, 0.0015, .003, .006) #cipro
data_list17 <- list(
  GCGS0457_91S_95D = list( 
    Replicate1_090326= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_090426= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

# ---------------------- Data Analysis ----------------------

# Find MICs from a single plate:
# - Columns = gepotidacin concentrations, Rows = Cipro concentrations
get_mic_values <- function(growth_matrix, conc_gepotidacin_cols, conc_ciprofloxacin_rows) {
  mic_gepo <- conc_gepotidacin_cols[match(0, growth_matrix[1, ])]
  if (is.na(mic_gepo)) mic_gepo <- max(conc_gepotidacin_cols) * 2
  
  mic_cipro <- conc_ciprofloxacin_rows[match(0, growth_matrix[, 1])]
  if (is.na(mic_cipro)) mic_cipro <- max(conc_ciprofloxacin_rows) * 2
  
  list(MIC_gepo = mic_gepo, MIC_cipro = mic_cipro)
}

# Build a FICI matrix using your rules
get_fici_matrix <- function(growth_matrix, conc_gepotidacin_cols, conc_ciprofloxacin_rows,
                            mic_gepo, mic_cipro) {
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
    (conc_gepotidacin_cols[j] > 0) &&
      (conc_ciprofloxacin_rows[i] > 0) &&
      (left || right || up || down)
  })
  
  F <- matrix(NA_real_, nrow = nr, ncol = nc)
  if (any(keep)) {
    sel <- zero_pos[keep, , drop = FALSE] #subset to only keep cells that are MICs (have growth nearby but no growth themselves)
    F[cbind(sel[,1], sel[,2])] <-
      (conc_gepotidacin_cols[sel[,2]] / mic_gepo) + #concentration gepo combo/mic gepo 
      (conc_ciprofloxacin_rows[sel[,1]] / mic_cipro) #concentration cipro combo/mic cipro 
  }
  F
}

# Convert strain's replicate plates into a tidy table (with concentrations)
summarize_replicates <- function(strain_name, replicate_list,
                                 conc_gepotidacin_cols, conc_ciprofloxacin_rows,
                                 block_label) {
  do.call(rbind, lapply(names(replicate_list), function(rep_name) {
    mat <- replicate_list[[rep_name]]
    mics <- get_mic_values(mat, conc_gepotidacin_cols, conc_ciprofloxacin_rows)
    F <- get_fici_matrix(mat, conc_gepotidacin_cols, conc_ciprofloxacin_rows,
                         mics$MIC_gepo, mics$MIC_cipro)
    
    grid <- expand.grid(RowIndex = seq_len(nrow(F)), ColIndex = seq_len(ncol(F)))
    grid$FICI <- as.vector(F)
    grid$Strain <- strain_name
    grid$Replicate <- rep_name
    grid$MIC_gepotidacin <- mics$MIC_gepo
    grid$MIC_ciprofloxacin  <- mics$MIC_cipro
    grid$gepotidacin_uM  <- conc_gepotidacin_cols[grid$ColIndex]
    grid$ciprofloxacin_uM   <- conc_ciprofloxacin_rows[grid$RowIndex]
    grid$PlateDesign      <- block_label
    grid
  }))
}

# Run one "experiment block": a data_list plus its concentration vectors
run_block <- function(block_data, conc_gepo, conc_cipro, block_label) {
  do.call(rbind, lapply(names(block_data), function(strain) {
    summarize_replicates(strain, block_data[[strain]],
                         conc_gepo, conc_cipro, block_label)
  }))
}

# ---------------------- Map existing objects to blocks ----------------------

results <- list(
  run_block(data_list,  concentrations_A, concentrations_B, "Block A×B"),
  run_block(data_list2, concentrations_A, concentrations_C, "Block A×C"),
  run_block(data_list3, concentrations_A, concentrations_D, "Block A×D"),
  run_block(data_list4, concentrations_A, concentrations_E, "Block A×E"),
  run_block(data_list5, concentrations_A, concentrations_F, "Block A×F"),
  run_block(data_list6, concentrations_G, concentrations_H, "Block G×H"),
  run_block(data_list7, concentrations_C, concentrations_A, "Block C×A"),
  run_block(data_list8, concentrations_D, concentrations_I, "Block D×I"),
  run_block(data_list9, concentrations_F, concentrations_J, "Block F×J"),
  run_block(data_list10, concentrations_G, concentrations_I, "Block G×I"),
  run_block(data_list11, concentrations_C, concentrations_K, "Block C×K"),
  run_block(data_list12, concentrations_A, concentrations_L, "Block A×L"),
  run_block(data_list13, concentrations_F, concentrations_H, "Block F×H"),
  run_block(data_list14, concentrations_A, concentrations_I, "Block A×I"),
  run_block(data_list15, concentrations_C, concentrations_G, "Block C×G"),
  run_block(data_list16, concentrations_A, concentrations_A, "Block A×A"),
  run_block(data_list17, concentrations_A, concentrations_J, "Block A×J")
)

all_results_long <- bind_rows(results)

# Keep only computed FICI values
all_results_for_plot <- filter(all_results_long, !is.na(FICI))

# ---------------------- Category labels for FICI ranges ----------------------
all_results_for_plot <- all_results_for_plot %>%
  mutate(FICI_Category = factor(
    dplyr::case_when(
      FICI <= 0.5 ~ "Synergy",
      FICI <= 4   ~ "No_Interaction",
      TRUE        ~ "Antagonism"
    ),
    levels = c("Antagonism", "No_Interaction", "Synergy")
  ))

#counting replicates 
all_data_lists <- list(data_list, data_list2, data_list3,data_list4, data_list5,
                       data_list6,data_list7, data_list8, data_list9,data_list10,
                       data_list11, data_list12,data_list13, data_list14, data_list15,
                       data_list16, data_list17)

# Combine all lists into one
combined_data <- do.call(c, all_data_lists)

# Count replicates per strain
replicate_counts <- sapply(combined_data, function(strain_list) length(strain_list))

# Combine counts for duplicate strain names
replicate_summary <- tapply(replicate_counts, names(replicate_counts), sum)

# View results neatly (there should be 2 replicates per strain)
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
          file = "gepo_cipro_fici_by_strain_2026_09_18.csv",
          row.names = FALSE)

###METADATA####
#getting just MIC data for my metadata 
gepo_cipro_mic_per_replicate <- all_results_long %>%
  select(Strain, Replicate,
         MIC_gepotidacin, MIC_ciprofloxacin) %>%
  distinct() %>%
  arrange(Strain, Replicate)

gepo_cipro_mic_per_replicate

#combine into single column 
gepo_cipro_mic_collapsed <- gepo_cipro_mic_per_replicate %>%
  group_by(Strain) %>%
  summarise(
    MIC_gepotidacin = paste(sort(unique(MIC_gepotidacin)), collapse = "/"),
    MIC_ciprofloxacin = paste(sort(unique(MIC_ciprofloxacin)), collapse = "/"),
    .groups = "drop"
  ) %>%
  arrange(Strain)

gepo_cipro_mic_collapsed

write.csv(gepo_cipro_mic_collapsed,
          file = "gepo_cipro_mic_collapsed.csv",
          row.names = FALSE)

#this file ("gepo_cipro_mic_collapsed.csv") is what was used for supplementary table 4)
