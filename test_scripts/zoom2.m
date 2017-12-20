clc;
close all;
folder = 'sigma_noise40-sigma_blur5-kernel_size5/';
img = imread(strcat('../Data/csv_files/',folder, 'high_snr_high_res', '.png'));
img_size = size(img);
img_csv = load(strcat('../Data/csv_files/',folder,'img_', 'high_snr_high_res', '.csv'));
fig1 = draw_bm(strcat('../Data/csv_files/',folder,'patch_', 'high_snr_high_res','.csv'),...
img_csv, img_size, x, y,8, 'high_snr_high_res');
axis([75 200 380 490]);
fig2 = draw_bm(strcat('../Data/csv_files/',folder,'patch_', 'high_snr_low_res','.csv'),...
img_csv, img_size, x, y,8, 'high_snr_low_res');
axis([75 200 380 490]);
fig3 = draw_bm(strcat('../Data/csv_files/',folder,'patch_', 'low_snr_high_res','.csv'),...
img_csv, img_size, x, y,8, 'low_snr_high_res');
axis([75 200 380 490]);
