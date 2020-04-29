#!/usr/bin/env bash

## find every vcf file
#find: -L option to include symlinks
find -L . \
  -type f \
  -name "*.vcf.gz" \
| sed 's#.vcf.gz#.maf.plink.bed#' \
| xargs mk
