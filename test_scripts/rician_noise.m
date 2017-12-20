%% prep. data
clc; close all;
addpath(genpath([ pwd '\..\' ]));
ground_truth_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\010\MR010001001.dcm';
hr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\009\MR009001001.dcm';
lr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\011\MR011001001.dcm';
[hr, lr, originalIm] = real_data_prep(hr_path, lr_path, ground_truth_path);

%%
sigma = 7;
ric_im = ricernd(originalIm, sigma/255);
imshowpair(ric_im, hr, 'montage');

%%
[mu,s] = ricestat(originalIm,sigma/255);