##generating information for tables 1 and 2 for drug interactions paper
#2/18/25
#Bailey Bowcutt

library(dplyr)

# Set working directory
#setwd("path/to/your/folder")

# file paths
p_zoli_gepo <- "zoli_gepo_fici_by_strain_2026_03_06.csv"
p_gepo_cipro <- "gepo_cipro_fici_by_strain_2026_03_06.csv"
p_zoli_cipro <- "zoli_cipro_fici_by_strain_2026_03_06.csv"

# read
df_zoli_gepo <- read.csv(p_zoli_gepo, stringsAsFactors = FALSE)
df_gepo_cipro <- read.csv(p_gepo_cipro, stringsAsFactors = FALSE)
df_zoli_cipro <- read.csv(p_zoli_cipro, stringsAsFactors = FALSE)

# add suffix to all columns except "Strain"
add_suffix_except_strain <- function(df, suffix) {
  cols <- names(df)
  cols_to_change <- cols[cols != "Strain"]
  names(df)[names(df) %in% cols_to_change] <- paste0(cols_to_change, suffix)
  df
}

# add informative suffixes (keeps original column base names)
df_zoli_gepo_s  <- add_suffix_except_strain(df_zoli_gepo,  "_zoli_gepo")
df_gepo_cipro_s  <- add_suffix_except_strain(df_gepo_cipro,  "_gepo_cipro")
df_zoli_cipro_s  <- add_suffix_except_strain(df_zoli_cipro,  "_zoli_cipro")

# join them all by Strain (use full join so strains appearing in any file are preserved, and remove n count)
merged_fici_by_strain <- df_zoli_gepo_s %>%
  full_join(df_gepo_cipro_s, by = "Strain") %>%
  full_join(df_zoli_cipro_s, by = "Strain") %>%
  select(-starts_with("n_FICI"))

# inspect

head(merged_fici_by_strain)


#Force the row order I want
strain_order <- c(
  "GCGS0481_91F_95G",
  "GCGS0481_91F_95G_D429N",
  "GCGS0481_91F_95A",
  "GCGS0481_91F_95A_D429N",
  "GCGS0481_91F_95D",
  "GCGS0481_91F_95D_D429N",
  "GCGS0481_91F_95N",
  "GCGS0481_91F_95N_D429N",
  "GCGS0481_91S_95A",
  "GCGS0481_91S_95A_D429N",
  "GCGS0481_91S_95D",
  "GCGS0481_91S_95D_D429N",
  "GCGS0481_91S_95G",
  "GCGS0481_91S_95G_D429N",
  "GCGS0481_91S_95N",
  "GCGS0481_91S_95N_D429N",
  "GCGS0860_91F_95N",
  "CCC033_91F_95A_D86N",
  "DDD033_91F_95A_D86N",
  "EEE016_91F_95G",
  "EEE036_91F_95A",
  "H18208_91F_95A",
  "HHH012_91F_92P_95Y_D86N",
  "HHH014_91F_95A",
  "HHH023_91F_95A",
  "HHH040_91F_95G",
  "MS11_91S_95D",
  "Ng175_91F_95A",
  "Ng183_91F_95A",
  "NY0215_91F_95G",
  "NY0738_91F_95G_D86N"
)


new_names_table <- merged_fici_by_strain %>%
  rename(
    "ZFD X GEP" = "FICI_summary_zoli_gepo",
    "GEP X CIP" = "FICI_summary_gepo_cipro",
    "ZFD X CIP" = "FICI_summary_zoli_cipro"
  )

new_names_table

table_means_ordered <- new_names_table %>%
  mutate(Strain = factor(Strain, levels = strain_order)) %>%
  arrange(Strain)

table_means_ordered

write.csv(table_means_ordered,
            file = "table_1_table_2_combined.csv",
          row.names = FALSE)
