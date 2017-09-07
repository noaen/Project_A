#!/bin/bash

names_array=(high_snr_high_res high_snr_low_res low_snr_high_res hr_lvl_4 lr_lvl_4 hr_lvl_5 lr_lvl_5 hr_lvl_6 lr_lvl_6 hr_lvl_7 lr_lvl_7)
#names_array=high_snr_high_res


for i in "${names_array[@]}"
do
	./csv_gen.sh $i.png patch_$i.csv img_$i.csv
done

