##code for supplementary figure 4 (mean MIC) drug interactions paper
#Bailey Bowcutt
##12/11/25


#I want to make the MIC for each strain for each abx based on the controls of the plates, used for supplementary figure 4 
library(dplyr)
#setwd("path/to/your/folder")

# Load
df_gepo_cipro <- read.csv("gepo_cipro_mic_collapsed.csv",
                          stringsAsFactors = FALSE)
df_zoli_cipro <- read.csv("zoli_cipro_mic_collapsed.csv",
                          stringsAsFactors = FALSE)
df_zoli_gepo  <- read.csv("zoli_gepo_mic_collapsed.csv",
                          stringsAsFactors = FALSE)

# Merge (this will create .x/.y columns where names overlap)
mic_merged <- df_gepo_cipro %>%
  full_join(df_zoli_cipro, by = "Strain") %>%
  full_join(df_zoli_gepo,  by = "Strain")

# take multiple MIC columns for a row and combine all unique values as "0.5/1"
combine_mic_values <- function(x) {
  x <- x[!is.na(x) & x != ""]
  if (length(x) == 0) return(NA_character_)
  
  parts <- unlist(strsplit(as.character(x), "/", fixed = TRUE))
  parts <- parts[parts != ""]
  if (length(parts) == 0) return(NA_character_)
  
  nums <- suppressWarnings(as.numeric(parts))
  if (all(is.na(nums))) {
    out <- unique(parts)
    return(paste(out, collapse = "/"))
  }
  
  out <- sort(unique(nums[!is.na(nums)]))
  paste(out, collapse = "/")
}

# Collapse any duplicated antibiotic MIC columns without losing disagreements
mic_final <- mic_merged %>%
  rowwise() %>%
  mutate(
    MIC_gepotidacin   = combine_mic_values(c_across(starts_with("MIC_gepotidacin"))),
    MIC_ciprofloxacin = combine_mic_values(c_across(starts_with("MIC_ciprofloxacin"))),
    MIC_zoliflodacin  = combine_mic_values(c_across(starts_with("MIC_zoliflodacin")))
  ) %>%
  ungroup() %>%
  select(Strain, MIC_zoliflodacin, MIC_gepotidacin, MIC_ciprofloxacin)

#Presenting as mean so that it is easier to interpret 
# Merge
mic_merged <- df_gepo_cipro %>%
  full_join(df_zoli_cipro, by = "Strain") %>%
  full_join(df_zoli_gepo,  by = "Strain")

# extract all numeric values and take geometric (NOT ARITHMETIC) mEAN
mean_mic_values <- function(x) {
  x <- x[!is.na(x) & x != ""]
  if (length(x) == 0) return(NA_real_)
  
  parts <- unlist(strsplit(as.character(x), "/", fixed = TRUE))
  nums <- suppressWarnings(as.numeric(parts))
  nums <- nums[!is.na(nums)]
  
  if (length(nums) == 0) return(NA_real_)
  
  exp(mean(log(nums)))
}

# Compute  means per antibiotic
mic_mean_final <- mic_merged %>%
  rowwise() %>%
  mutate(
    MIC_gepotidacin   = mean_mic_values(c_across(starts_with("MIC_gepotidacin"))),
    MIC_ciprofloxacin = mean_mic_values(c_across(starts_with("MIC_ciprofloxacin"))),
    MIC_zoliflodacin  = mean_mic_values(c_across(starts_with("MIC_zoliflodacin")))
  ) %>%
  ungroup() %>%
  select(Strain, MIC_zoliflodacin, MIC_gepotidacin, MIC_ciprofloxacin) %>%
  mutate(across(starts_with("MIC_"), ~ round(., 3)))

mic_mean_final

write.csv(mic_mean_final,
          file = "MIC_collapsed_withmean_2026_04_22.csv",
          row.names = FALSE)




