##Drug interactions zoli gepo 
#Bailey Bowcutt
#09.18.2026

library(dplyr)
setwd("path/to/your/folder")


#remove all currently saved variables, as there are some variable replicates between R files
rm(list=ls())

## ---------------------- Data  ---------------------- ##
# 1 = growth, 0 = no growth 
concentrations_A <- c(0, 0.0125, 0.025, 0.05, 0.1, 0.2) #Zoli
concentrations_B <- c(0, 0.031, 0.062, 0.125, 0.25, 0.5) #Gepo

data_list <- list(
  MS11_91S_95D = list(
    Replicate1_070824 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_071524 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  H18208_91F_95A = list(
    Replicate1_070824 = matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_071524 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95D = list(
    Replicate1_073124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95G = list(
    Replicate1_073124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95D = list(
    Replicate1_073124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G = list(
    Replicate1_073124 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_C <- c(0, .016, .031, .063, .125, .25) #Zoli
#concentrations_B <- c(0, 0.031, 0.062, 0.125, 0.25, 0.5) #Gepo

data_list2 <- list(
  GCGS0481_91S_95N = list( 
    Replicate1_031625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95D = list( 
    Replicate1_031625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95G = list( 
    Replicate1_031625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95A = list( 
    Replicate1_031625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95A = list( 
    Replicate1_032325 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_032425 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ), 
  GCGS0481_91F_95N = list( 
    Replicate1_032325 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_032425 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0457_91S_95D = list( 
    Replicate1_090326 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_090426 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_B <- c(0, 0.031, 0.063, 0.125, 0.25, .5) #Zoli
#concentrations_B <- c(0, 0.031, 0.063, 0.125, 0.25, 0.5) #Gepo

data_list3 <- list(
  GCGS0481_91S_95D = list( 
    Replicate1_032625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95N = list( 
    Replicate2_032625 = matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95A = list( 
    Replicate2_032625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G = list( 
    Replicate2_032625 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


concentrations_D <- c(0, 1, 2, 4, 8, 16) #Zoli
#concentrations_B <- c(0, .031, .062, 0.125, 0.25, 0.5) #gepo

data_list4 <- list(
  GCGS0481_91S_95N_D429N = list( 
    Replicate1_053025 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_060725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0, #synergy at 2 zoli, .031 gepo 
      1, 1, 0, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95G_D429N = list( 
    Replicate1_053025 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_060725 = matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


concentrations_E <- c(0, 0.25, 0.5, 1, 2 ,4) #Zoli
#concentrations_B <- c(0, .031, .062, 0.125, 0.25, 0.5) #gepo

data_list5 <- list(
  GCGS0481_91S_95D_D429N = list( 
    Replicate1_062725= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_081525= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95A_D429N = list( 
    Replicate2_081525= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_F <- c(0, 0.004, 0.008, .016, .032 ,.063) #Zoli
#concentrations_B <- c(0, .031, .062, 0.125, 0.25, 0.5) #gepo

data_list6 <- list(
  EEE036_91F_95A = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH014_91F_95A  = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_G <- c(0, 0.008, .016, .032 ,.063, .125) #Zoli
concentrations_H <- c(0, .125, 0.25, 0.5, 1, 2) #gepo

data_list7 <- list(
  CCC033_91F_95A_D86N = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  HHH023_91F_95A = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0738_91F_95G_D86N = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  DDD033_91F_95A_D86N = list( 
    Replicate2_082125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  Ng183_91F_95A= list( 
    Replicate1_082125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_082825= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_G <- c(0, 0.008, .016, .032 ,.063, .125) #Zoli
#concentrations_B <- c(0, .031, .062, 0.125, 0.25, 0.5) #gepo

data_list8 <- list(
  HHH040_91F_95G = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  EEE016_91F_95G = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  NY0215_91F_95G = list( 
    Replicate1_072425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_072925= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_F <- c(0, 0.004, 0.008, .016, .032 ,.063) #Zoli
#concentrations_H <- c(0, .125, 0.25, 0.5, 1, 2) #gepo
data_list9 <- list(
  DDD033_91F_95A_D86N = list( 
    Replicate1_073125= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_I <- c(0, .5, 1, 2, 4, 8) #Zoli
#concentrations_B <- c(0, 0.031, 0.062, 0.125, 0.25, 0.5) #gepo 
data_list10 <- list(
  GCGS0481_91F_95D_D429N = list( 
    Replicate1_052425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061325= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95N_D429N = list( 
    Replicate1_052425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061325= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95G_D429N = list( 
    Replicate1_052425= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061325= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91S_95A_D429N = list( 
    Replicate1_052425= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_061325= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  ),
  GCGS0481_91F_95A_D429N = list( 
    Replicate1_062625= matrix(c(
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)


#concentrations_B <- c(0, 0.031, 0.062, 0.125, 0.25, 0.5) #zoli
concentrations_J <- c(0, 0.062, 0.125, 0.25, 0.5, 1) #gepo 
data_list11 <- list(
  GCGS0860_91F_95N = list( 
    Replicate1_082225= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate2_082825= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

concentrations_K <- c(0, 0.0005, 0.001, 0.002, 0.004, 0.008) #zoli
#concentrations_G <- c(0, 0.008, .016, .032 ,.063, .125) #gepo
data_list12 <- list(
  Ng175_91F_95A = list( 
    Replicate1_091025= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE),
    Replicate1_091825= matrix(c(
      1, 1, 1, 1, 1, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_C <- c(0, .016, .031, .063, .125, .25) #Zoli
#concentrations_I <- c(0, .5, 1, 2, 4, 8) #gepo
data_list13 <- list(
  HHH012_91F_92P_95Y_D86N = list( 
    Replicate1_091125= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

#concentrations_C <- c(0, .016, .031, .063, .125, .25) #Zoli
concentrations_L <- c(0, .25, .5, 1, 2, 4) #gepo
data_list14 <- list(
  HHH012_91F_92P_95Y_D86N = list( 
    Replicate2_091825= matrix(c(
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 1, 0, 0,
      1, 1, 1, 0, 0, 0,
      1, 1, 1, 0, 0, 0,
      0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ), nrow=6, ncol=6, byrow=TRUE)
  )
)

##data for the replicate 3 of strain GCGS0481 gyrA91S/95N gyrBD429N tested within the affected drug ranges
#this was not integrated into the main FICI table, but used as a third replicate to see if synergy would reoccur
#concentrations_C <- c(0, 1, 2, 4, 8, 16) #Zoli
#concentrations_B <- c(0, 0.031, 0.062, 0.125, 0.25, 0.5) #gepo 
#data_listXX <- list(
#  GCGS0481_91S_95N_D86N = list( 
#    Replicate3_091025= matrix(c(
#      1, 1, 1, 1, 0, 0,
#      1, 1, 1, 0, 0, 0,
#      1, 
#      1,
#      1, 
#      0, 
#    )
#  )
#no synergy in these! All indifference

# ---------------------- Data Analysis ----------------------

# Find MICs from a single plate:
# Columns = Zoliflodacin concentrations, Rows = Gepotidacin concentrations
get_mic_values <- function(growth_matrix, conc_zoliflodacin_cols, conc_gepotidacin_rows) {
  mic_zoli <- conc_zoliflodacin_cols[match(0, growth_matrix[1, ])]
  if (is.na(mic_zoli)) mic_zoli <- max(conc_zoliflodacin_cols) * 2
  
  mic_gepo <- conc_gepotidacin_rows[match(0, growth_matrix[, 1])]
  if (is.na(mic_gepo)) mic_gepo <- max(conc_gepotidacin_rows) * 2
  
  list(MIC_zoli = mic_zoli, MIC_gepo = mic_gepo)
}

# Build a FICI matrix using rules
get_fici_matrix <- function(growth_matrix, conc_zoliflodacin_cols, conc_gepotidacin_rows,
                            mic_zoli, mic_gepo) {
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
      (conc_gepotidacin_rows[i] > 0) &&
      (left || right || up || down)
  })
  
  F <- matrix(NA_real_, nrow = nr, ncol = nc)
  if (any(keep)) {
    sel <- zero_pos[keep, , drop = FALSE] #subset to only keep cells that are MICs (have growth nearby but no growth themselves)
    F[cbind(sel[,1], sel[,2])] <-
      (conc_zoliflodacin_cols[sel[,2]] / mic_zoli) + #concentration zoli combo/mic zoli 
      (conc_gepotidacin_rows[sel[,1]] / mic_gepo) #concentration gepo combo/mic gepo 
  }
  F
}

# Convert strain's replicate plates into a tidy table (with concentrations)
summarize_replicates <- function(strain_name, replicate_list,
                                 conc_zoliflodacin_cols, conc_gepotidacin_rows,
                                 block_label) {
  do.call(rbind, lapply(names(replicate_list), function(rep_name) {
    mat <- replicate_list[[rep_name]]
    mics <- get_mic_values(mat, conc_zoliflodacin_cols, conc_gepotidacin_rows)
    F <- get_fici_matrix(mat, conc_zoliflodacin_cols, conc_gepotidacin_rows,
                         mics$MIC_zoli, mics$MIC_gepo)
    
    grid <- expand.grid(RowIndex = seq_len(nrow(F)), ColIndex = seq_len(ncol(F)))
    grid$FICI <- as.vector(F)
    grid$Strain <- strain_name
    grid$Replicate <- rep_name
    grid$MIC_zoliflodacin <- mics$MIC_zoli
    grid$MIC_gepotidacin  <- mics$MIC_gepo
    grid$zoliflodacin_uM  <- conc_zoliflodacin_cols[grid$ColIndex]
    grid$gepotidacin_uM   <- conc_gepotidacin_rows[grid$RowIndex]
    grid$PlateDesign      <- block_label
    grid
  }))
}

# Run one "experiment block": a data_list plus its concentration vectors
run_block <- function(block_data, conc_zoli, conc_gepo, block_label) {
  do.call(rbind, lapply(names(block_data), function(strain) {
    summarize_replicates(strain, block_data[[strain]],
                         conc_zoli, conc_gepo, block_label)
  }))
}

# ---------------------- Map existing objects to blocks ----------------------

results <- list(
  run_block(data_list,  concentrations_A, concentrations_B, "Block A×B"),
  run_block(data_list2, concentrations_C, concentrations_B, "Block C×B"),
  run_block(data_list3, concentrations_B, concentrations_B, "Block B×B"),
  run_block(data_list4, concentrations_D, concentrations_B, "Block D×B"),
  run_block(data_list5, concentrations_E, concentrations_B, "Block E×B"),
  run_block(data_list6, concentrations_F, concentrations_B, "Block F×B"),
  run_block(data_list7, concentrations_G, concentrations_H, "Block G×H"),
  run_block(data_list8, concentrations_G, concentrations_B, "Block G×B"),
  run_block(data_list9, concentrations_F, concentrations_H, "Block F×H"),
  run_block(data_list10, concentrations_I, concentrations_B, "Block I×B"),
  run_block(data_list11, concentrations_B, concentrations_J, "Block B×J"),
  run_block(data_list12, concentrations_K, concentrations_G, "Block K×G"),
  run_block(data_list13, concentrations_C, concentrations_I, "Block C×I"),
  run_block(data_list14, concentrations_C, concentrations_L, "Block C×L")
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
                       data_list11, data_list12,data_list13, data_list14)


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
          file = "zoli_gepo_fici_by_strain_2026_09_18.csv",
          row.names = FALSE)


###METADATA####

#getting just MIC data for my metadata 
zoli_gepo_mic_per_replicate <- all_results_long %>%
  select(Strain, Replicate,
         MIC_zoliflodacin, MIC_gepotidacin) %>%
  distinct() %>%
  arrange(Strain, Replicate)

zoli_gepo_mic_per_replicate

#combine into single column 
zoli_gepo_mic_collapsed <- zoli_gepo_mic_per_replicate %>%
  group_by(Strain) %>%
  summarise(
    MIC_zoliflodacin = paste(sort(unique(MIC_zoliflodacin)), collapse = "/"),
    MIC_gepotidacin = paste(sort(unique(MIC_gepotidacin)), collapse = "/"),
    .groups = "drop"
  ) %>%
  arrange(Strain)

zoli_gepo_mic_collapsed

write.csv(zoli_gepo_mic_collapsed,
          file = "zoli_gepo_mic_collapsed.csv",
          row.names = FALSE)

#this file ("zoli_gepo_mic_collapsed.csv") is what was used for supplementary table 3)
