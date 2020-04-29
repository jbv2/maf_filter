## load libraries
library("ggplot2")
library("dplyr")

## Read args from command line
args = commandArgs(trailingOnly=TRUE)

## Uncomment For debugging only
## Comment for production mode only
# args[1] <- "test/data/sampleWGS.bcftools.tsv" ## variants in original file
# args[2] <- "test/results/sampleWGS.bcftools.vcf" ## stem for output

## Passing args to named objects
variants_tsv <- args[1]
stem <- args[2]
output_file <- gsub(pattern = ".vcf", replacement = ".svg", x = stem)

## Make df
variant_table.df <- read.table(file = variants_tsv, header = TRUE, sep = "\t", stringsAsFactors = F)

#Make plot
comparison.p <- ggplot(variant_table.df, aes(FILE, VARIANTS, fill=FILE)) + 
  geom_bar(stat="identity") + 
  geom_text(aes(label=VARIANTS), position=position_dodge(width=0.9), vjust=-0.25) +
  labs(title = "Number of variants comparison") +
  theme_bw() +
  theme(legend.position="none")

## Save plot
ggsave(filename = output_file,
       plot = comparison.p,
       device = "svg",
       width = 14.4,
       height = 7.2,
       units = "in", dpi = 300)
                                                                                                 