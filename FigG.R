library(ggplot2)
path <- "/home/zia/Downloads/Lc_data_final/na_degs/"
setwd(path)
list.files(path)

data <- read.csv(paste0(path, 'NA_degs_geneontology_male.csv'))

tiff(filename = "/home/zia/Downloads/Lc_data_final/na_degs/Male_u+d.tif", width = 6, height = 6, units = 'in', res = 400)

ggplot(data, aes(x = reorder(GO_Terms, Count), y = Count, fill = FDR)) +
  geom_bar(stat = "identity") +
  coord_flip() +  # Flip coordinates to make it horizontal
  scale_fill_gradient(low = "#f67f7f", high = "#ef3f3f") +
  labs(title = "GO Biological Process",
       x = "GO Terms",
       y = "Number of Genes",
       fill = "FDR") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10),
        axis.title.y = element_text(size = 12),
        axis.text.x = element_text(size = 10),
        axis.title.x = element_text(size = 12),
        plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),  
        panel.grid.minor = element_blank(),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5))
dev.off()

