%This script goes over all the images we want to see the BM on.
%It draws the BM on the images

clc; close all;
addpath(genpath([ pwd '\..\' ]));
names_list = {'high_snr_high_res', 'high_snr_low_res', 'low_snr_high_res', ...
    'hr_lvl_4', 'hr_lvl_5', 'hr_lvl_6', 'hr_lvl_7', ...
    'lr_lvl_4', 'lr_lvl_5', 'lr_lvl_6', 'lr_lvl_7'};
idx = 173565;
for i = 1:length(names_list)
    img = imread(strcat('../Data/csvs/', names_list{i}, '.png'));
    img_size = size(img);
    [fig1, fig2] = draw_bm(strcat('../Data/csvs/patch_', names_list{i},'.csv'),...
        img_csv, img_size, mod(idx,544), ceil(idx/544),8);
    saveas(fig1,strcat('../Data/BM_outputs/',names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/BM_outputs/',names_list{i},'_blocks'));
end