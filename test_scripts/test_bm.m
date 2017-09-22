%This script goes over all the images we want to see the BM on.
%It draws the BM on the images

clc; close all;
folder = 'sigma_noise40-sigma_blur15-kernel_size5/';
addpath(genpath([ pwd '\..\' ]));
names_list = {'high_snr_high_res', 'high_snr_low_res', 'low_snr_high_res'};
%     'hr_lvl_4', 'lr_lvl_4', 'hr_lvl_5', ...
%     'lr_lvl_5', 'hr_lvl_6','lr_lvl_6', 'hr_lvl_7', 'lr_lvl_7'};
x = 180;
y = 256;
img = imread(strcat('../Data/csv_files/',folder, names_list{1}, '.png'));
img_csv = load(strcat('../Data/csv_files/',folder,'img_', names_list{1}, '.csv'));

for i = 1:length(names_list)
%     img = imread(strcat('../Data/csv_files/',folder, names_list{i}, '.png'));
    img_size = size(img);
%     img_csv = load(strcat('../Data/csv_files/',folder,'img_', names_list{i}, '.csv'));
    [fig1, fig2] = draw_bm(strcat('../Data/csv_files/',folder,'patch_', names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, names_list{i});
    saveas(fig1,strcat('../Data/bm_figures/',folder,names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder,names_list{i},'_blocks'));
end

% idx = 173565;
% img_csv = load('../Data/csv_files/img_high_snr_low_res.csv');
% img = imread('../Data/csv_files/high_snr_low_res.png');
% [fig1, fig2] = draw_bm('../Data/csv_files/patch_high_snr_low_res.csv',...
% img_csv, img_size, mod(idx,size(img,1)), ceil(idx/size(img,1)),8, 'high res img, low res BM');
% saveas(fig1,'../Data/bm_figures/high_res_img_low_res_bm_BM');
% saveas(fig2,'../Data/bm_figures/high_res_img_low_res_bm_blocks');