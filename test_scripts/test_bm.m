%This script goes over all the images we want to see the BM on.
%It draws the BM on the images

clc; close all;
folder_list = {'sigma_noise40-sigma_blur5-kernel_size5/'}%,...
%     'sigma_noise40-sigma_blur5-kernel_size5/',...
%     'sigma_noise40-sigma_blur15-kernel_size5/',...
%     'sigma_noise40-sigma_blur5-kernel_size9/'};
addpath(genpath([ pwd '\..\' ]));
%names_list = {'high_snr_high_res', 'high_snr_low_res', 'low_snr_high_res'}
orig_names_list = {'high_snr_high_res'};%{'orig_lvl_4', 'orig_lvl_5', 'orig_lvl_6','orig_lvl_7'};
lr_names_list = {'high_snr_low_res'};%{'lr_lvl_4', 'lr_lvl_5', 'lr_lvl_6','lr_lvl_7'};
hr_names_list = {'low_snr_high_res'};%{'hr_lvl_4', 'hr_lvl_5', 'hr_lvl_6','hr_lvl_7'};

% names_list = {'hr_lvl_4', 'lr_lvl_4', 'hr_lvl_5', ...
%      'lr_lvl_5', 'hr_lvl_6','lr_lvl_6', 'hr_lvl_7', 'lr_lvl_7'};
x = 172;
y = 266;
% img = imread(strcat('../Data/csv_files/',folder_list{1}, names_list{i}, '.png'));
% img_csv = load(strcat('../Data/csv_files/',folder_list{1},'img_', names_list{i}, '.csv'));
distance_stats_lr = zeros(2,2);
distance_stats_orig = zeros(2,2);
distance_stats_hr = zeros(2,2);


for j = 1:length(folder_list)
for i = 1:length(orig_names_list)
    img = imread(strcat('../Data/csv_files/',folder_list{j}, orig_names_list{i}, '.png'));
    img_size = size(img);
    img_csv = load(strcat('../Data/csv_files/',folder_list{j},'img_', orig_names_list{i}, '.csv'));
    [fig1, fig2,davg,dvar] = draw_bm(strcat('../Data/csv_files/',folder_list{j},'patch_', lr_names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, lr_names_list{i});
    distance_stats_lr(:,1) = [davg,dvar];
    saveas(fig1,strcat('../Data/bm_figures/',folder_list{j},'orig_',lr_names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder_list{j},'orig_',lr_names_list{i},'_blocks'));
    [fig1, fig2,davg,dvar] = draw_bm(strcat('../Data/csv_files/',folder_list{j},'patch_', hr_names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, hr_names_list{i});
    distance_stats_hr(:,1) = [davg,dvar];
    saveas(fig1,strcat('../Data/bm_figures/',folder_list{j},'orig_',hr_names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder_list{j},'orig_',hr_names_list{i},'_blocks'));
    [fig1, fig2,davg,dvar] = draw_bm(strcat('../Data/csv_files/',folder_list{j},'patch_', orig_names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, orig_names_list{i});
    distance_stats_orig(:,1) = [davg,dvar];
    saveas(fig1,strcat('../Data/bm_figures/',folder_list{j},'orig_',orig_names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder_list{j},'orig_',orig_names_list{i},'_blocks'));
    
    
    %data from each image
    img_csv = load(strcat('../Data/csv_files/',folder_list{j},'img_', lr_names_list{i}, '.csv'));
    [fig1, fig2,davg,dvar] = draw_bm(strcat('../Data/csv_files/',folder_list{j},'patch_', lr_names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, lr_names_list{i});
    distance_stats_lr(:,2) = [davg,dvar];
    saveas(fig1,strcat('../Data/bm_figures/',folder_list{j},lr_names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder_list{j},lr_names_list{i},'_blocks'));
    img_csv = load(strcat('../Data/csv_files/',folder_list{j},'img_', hr_names_list{i}, '.csv'));
    [fig1, fig2,davg,dvar] = draw_bm(strcat('../Data/csv_files/',folder_list{j},'patch_', hr_names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, hr_names_list{i});
    distance_stats_hr(:,2) = [davg,dvar];
    saveas(fig1,strcat('../Data/bm_figures/',folder_list{j},hr_names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder_list{j},hr_names_list{i},'_blocks'));
    img_csv = load(strcat('../Data/csv_files/',folder_list{j},'img_', orig_names_list{i}, '.csv'));
    [fig1, fig2,davg,dvar] = draw_bm(strcat('../Data/csv_files/',folder_list{j},'patch_', orig_names_list{i},'.csv'),...
    img_csv, img_size, x, y,8, orig_names_list{i});
    distance_stats_orig(:,2) = [davg,dvar];
    saveas(fig1,strcat('../Data/bm_figures/',folder_list{j},orig_names_list{i},'_BM'));
    saveas(fig2,strcat('../Data/bm_figures/',folder_list{j},orig_names_list{i},'_blocks'));
    
    save(strcat('../Data/bm_figures/',folder_list{j},orig_names_list{i},'_data.mat'),'distance_stats_orig');
    save(strcat('../Data/bm_figures/',folder_list{j},lr_names_list{i},'_data.mat'),'distance_stats_lr');
    save(strcat('../Data/bm_figures/',folder_list{j},hr_names_list{i},'_data.mat'),'distance_stats_hr');
end
end
