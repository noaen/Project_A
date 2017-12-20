% flair profile
close all; clc; clear all;
addpath(genpath([ pwd '\..\' ]));
ground_truth_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\010\MR010001001.dcm';
hr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\018\MR018001001.dcm';
lr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\011\MR011001001.dcm';
[hr, lr, gt] = real_data_prep(hr_path, lr_path, ground_truth_path);

%%
sigma = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3];
for i = 1:numel(sigma)
[PSNR_bm3d, bm3d_estimate] = BM3D(gt, hr, sigma(i),'np',0); 
[PSNR_tweaked, tweaked_est, y_hat] = BM3DTweaked(gt, hr , single(lr), sigma(i),'np',0);
figure()
subplot(1,2,1)
imshow(bm3d_estimate,[])
title('BM3D')
subplot(1,2,2)
imshow(tweaked_est,[])
title('BM3D Tweaked')
bm3d_filename = sprintf('../Data/real_data_outputs/sigma_%0.2f_BM3D.jpg' , sigma(i));
imwrite(bm3d_estimate,bm3d_filename,'jpg');
tweaked_filename = sprintf('../Data/real_data_outputs/sigma_%0.2f_Tweaked.jpg' , sigma(i));
imwrite(tweaked_est,tweaked_filename,'jpg');
end



