%This script goes over all the images we want to see the BM on.
%It draws the BM on the images

clc; close all;
addpath(genpath([ pwd '\..\' ]));
names_list = {'high_snr_high_res', 'high_snr_low_res', 'low_snr_high_res', ...
    'hr_lvl_4', 'lr_lvl_4', 'hr_lvl_5', ...
    'lr_lvl_5', 'hr_lvl_6','lr_lvl_6', 'hr_lvl_7', 'lr_lvl_7'};
idx_list = [173565, 173565, 173565, 1443, 1443, 5882, 5882, 14601, 14601, 14601, 14601];
for i = 1:length(names_list)
    idx = idx_list(i);
    img = imread(strcat('../Data/csv_files/', names_list{i}, '.png'));
    img_size = size(img);
    img_csv = load(strcat('../Data/csv_files/img_', names_list{i}, '.csv'));
    [fig1, fig2] = draw_bm(strcat('../Data/csv_files/patch_', names_list{i},'.csv'),...
    img_csv, img_size, mod(idx,img_size(1)), ceil(idx/img_size(1)),8, names_list{i});
    saveas(fig1,strcat('../Data/bm_figures/',names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',names_list{i},'_blocks'));
end