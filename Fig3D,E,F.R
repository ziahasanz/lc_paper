library(EnhancedVolcano)
library(dplyr)
path <- "/home/zia/Downloads/Lc_data_final/na_degs/"
setwd(path)
list.files(path)

#Female+Male----------------------------------
df <- read.csv(paste0(path, 'cE14_Vs_cGFP_DE-Cluster_18.csv'))
# Filter the data based on the conditions: p_val_adj < 0.05 and (logFC > 0.5 | logFC < -0.5)
df_filtered_genes <- df[df$p_val_adj < 0.05 & (df$logFC > 0.5 | df$logFC < -0.5), ]
df_filtered_gene_names <- df_filtered_genes$gene_names
df_filtered_gene_names

highlight_genes <- c('Kdelr3', 'Sdccag8', 'Pard3b', 'LRRTM1', 'Enoph1', 'Ccdc167', 
                     'Wnt5b', 'Has1', 'Fbxl13', 'Tmem192', 'Cp', 'Zfp42l', 'Kirrel3')

tiff(filename = "/home/zia/Downloads/Lc_data_final/na_degs/cVsg.tif", width = 6, height = 6, units = 'in', res = 400)

EnhancedVolcano(df,
                lab = df$gene_names,
                x = "logFC",
                y = "p_val_adj",
                #xlab = 'Log2 Fold Change',
                #ylab = '-Log10 Adjusted P-Value',
                #title = 'Volcano plot of significant genes',
                selectLab = highlight_genes,
                pCutoff = 0.05,
                FCcutoff = 0.5,
                xlim = c(-4, 4),
                ylim = c(0, 4),
                #pointSize = 1.0,
                labSize = 3.0,
                maxoverlapsConnectors = Inf,
                drawConnectors = TRUE,
                widthConnectors = 0.2,
                arrowheads = FALSE,
                legendLabels = c('NS', 'Log2FC', 'Adj-p-Val', 'Adj-p-Value & Log2FC'),
                legendPosition = 'top',
                legendLabSize = 10,
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                border = 'full',
                borderWidth = 0.5,
                borderColour = 'black')
dev.off()

#Female---------------------------------------
df1 <- read.csv(paste0(path, 'female_cE14F_Vs_cGFPF_DE-Cluster_18.csv'))
# Filter the data based on the conditions: p_val_adj < 0.05 and (logFC > 0.5 | logFC < -0.5)
df1_filtered_genes <- df1[df1$p_val_adj < 0.05 & (df1$logFC > 0.5 | df1$logFC < -0.5), ]
df1_filtered_gene_names <- df1_filtered_genes$gene_names
df1_filtered_gene_names

highlight_genes1 <- c('Sdccag8', 'Kdelr3', 'Zeb2', '', 'Tmem192',
                      'Plp1', 'Ube3a', 'Pcsk1n', 'Kirrel3',
                      'Tmem192', 'Ckb', 'Wnt5b', 'Has1',
                      'Erbb4', 'Sik3', 'Pard3b',
                      'Tex47', 'Acox2', 'Pak1', 'Slc7a8',
                      'Ccdc167', 'Dsel', 'Dpp10', 'Ubash3b',
                      'Timp3', 'Orc4', 'Lrrcc1')

tiff(filename = "/home/zia/Downloads/Lc_data_final/na_degs/FcVsFg.tif", width = 6, height = 6, units = 'in', res = 400)

EnhancedVolcano(df1,
                lab = df1$gene_names,
                x = "logFC",
                y = "p_val_adj",
                #xlab = 'Log2 Fold Change',
                #ylab = '-Log10 Adjusted P-Value',
                #title = 'Volcano plot of significant genes',
                selectLab = highlight_genes1, 
                pCutoff = 0.05,
                FCcutoff = 0.5,
                xlim = c(-4, 4),
                ylim = c(0, 4),
                #pointSize = 1.0,
                labSize = 3.0,
                maxoverlapsConnectors = Inf,
                drawConnectors = TRUE,
                widthConnectors = 0.2,
                arrowheads = FALSE,
                legendLabels = c('NS', 'Log2FC', 'Adj-p-Val', 'Adj-p-Value & Log2FC'),
                legendPosition = 'top',
                legendLabSize = 10,
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                border = 'full',
                borderWidth = 0.5,
                borderColour = 'black')

dev.off()

#Male-----------------------------------------
df2 <- read.csv(paste0(path, 'male_cE14M_Vs_cGFPM_DE-Cluster_18.csv'))

# Extract top 30 gene names
top_30_genes <- df2 %>%
  filter(p_val_adj < 0.05) %>%
  arrange(desc(logFC)) %>%
  top_n(15, logFC) %>%
  bind_rows(
    df2 %>%
      filter(p_val_adj < 0.05) %>%
      arrange(logFC) %>%
      top_n(15, -logFC)
  )

df2_top_30_gene_names <- top_30_genes$gene_names
df2_top_30_gene_names

# Filter the data based on the conditions: p_val_adj < 0.05 and (logFC > 0.5 | logFC < -0.5)
df2_filtered_genes <- df2[df2$p_val_adj < 0.05 & (df2$logFC > 0.5 | df2$logFC < -0.5), ]
df2_filtered_gene_names <- df2_filtered_genes$gene_names
print(df2_filtered_gene_names)

df2_selected_genes <- c("Tph2", "Atp1a1", "Robo1", "Apoe", "Tex47", "Pmfbp1", "Kcna4", "Th",
                        "Pde10a", "Nr4a3", "Dbh", "Kdelr3", "Kirrel3",
                        "Kdelr3", "Sv2c", "Slc24a2", "Hs6st3", "Grin2a",
                        "Marchf1", "Tafa1", "Sdccag8", "Lrrc4c",
                        "Slc6a4", "Nxph1", "Pitpnc1", "Cdh12", "Cpne7",
                        "Maob", "Fat3", "Shisa9", "Dach1", "Sorcs3")

tiff(filename = "/home/zia/Downloads/Lc_data_final/na_degs/McVsMg.tif", width = 6, height = 6, units = 'in', res = 400)

EnhancedVolcano(df2,
                lab = df2$gene_names,
                x = "logFC",
                y = "p_val_adj",
                #xlab = 'Log2 Fold Change',
                #ylab = '-Log10 Adjusted P-Value',
                #title = 'Volcano plot of significant genes',
                selectLab = df2_selected_genes,
                pCutoff = 0.05,
                FCcutoff = 0.5,
                xlim = c(-6, 6),
                ylim = c(0, 30),
                #pointSize = 1.0,
                labSize = 3.0,
                maxoverlapsConnectors = Inf,
                drawConnectors = TRUE,
                widthConnectors = 0.2,
                arrowheads = FALSE,
                legendLabels = c('NS', 'Log2FC', 'Adj-p-Val', 'Adj-p-Value & Log2FC'),
                legendPosition = 'top',
                legendLabSize = 10,
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                border = 'full',
                borderWidth = 0.5,
                borderColour = 'black')
#legendIconSize = 5.0)

dev.off()