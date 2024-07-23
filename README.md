# Single nuclei RNA sequencing (snRNA-Seq) data analysis workflow for Locus coeruleus vulnerability to tau hyperphosphorylation in a rat model
![Alt text](https://github.com/ziahasanz/lc_paper/blob/main/snRNA-seq%20Data%20Analysis%20workflow.png)

1. The FASTq files of each sample are processed using Cell Ranger v7.2 (10x Genomics).

2 & 3. The Cell Ranger output files (filtered_matrix.h5) for each sample are utilized for the next step in the analysis.

4. Each sample's filtered_matrix.h5 files are individually processed in the Cellenics® community instance, now called Trailmaker, hosted by Parse Biosciences (https://www.parsebiosciences.com/data-analysis/).

5. The processed files for each sample are aggregated into a single file (LCRMCV1.h5ad).

6. The aggregated file is then used for downstream analysis and figure generation.
