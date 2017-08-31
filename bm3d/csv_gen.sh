#!/bin/bash
# $1 = image name
# $2 = patch_table.csv new name
# $3 = image.csv new name


./BM3Ddenoising $1 0 ImNoisy.png ImBasic.png ImDenoised.png ImDiff.png ImBias.png ImDiffBias.png 1 bior 0 dct 1 opp high_SNR.png ImResize.png
mv patch_table.csv output_csvs/$2
mv image.csv output_csvs/$3



