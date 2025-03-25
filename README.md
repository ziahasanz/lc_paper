# Single nuclei RNA sequencing (snRNA-Seq) data analysis workflow for Locus coeruleus vulnerability to tau hyperphosphorylation in a rat model
This repository hosts all codes used for analyzing snRNA-Seq datasets in this study.
![Alt text](https://github.com/ziahasanz/lc_paper/blob/main/snRNA-Seq%20data%20analysis%20worflow%20for%20Locus%20coeruleus.png)

1. The FASTq files of each sample are processed using Cell Ranger v7.2 (10x Genomics).

2 & 3. The Cell Ranger output files (filtered_matrix.h5) for each sample are utilized for the next step in the analysis.

4. Each sample's filtered_matrix.h5 files are individually processed in the Cellenics® community instance, now called Trailmaker, hosted by Parse Biosciences (https://www.parsebiosciences.com/data-analysis/).

5. The processed files for each sample are aggregated into a single file (LCRMCV1.h5ad).

6. The aggregated file is then used for downstream analysis and figure generation.

**Research Paper Title: Locus coeruleus vulnerability to tau hyperphosphorylation in a rat model**

Link: https://onlinelibrary.wiley.com/doi/10.1111/acel.14405

_To cite this paper:_

Omoluabi, T., Hasan, Z., Piche, J. E., Flynn, A. R., Doré, J. J., Walling, S. G., ... & Yuan, Q. (2024). Locus coeruleus vulnerability to tau hyperphosphorylation in a rat model. Aging Cell, e14405.
