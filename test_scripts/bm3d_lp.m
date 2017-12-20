%%this script tests implementing bm3d on levels of the laplacian pyramid

%% loading images
clc; close all; clear;
addpath(genpath([ pwd '\..\' ]));
im = load_untouch_nii('..\mri_images\high_snr_registered.nii');
sigmaNoise = 11;
%sigmaBlur = 5;
addpath(genpath([ pwd '\..\' ]));
ground_truth_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\010\MR010001001.dcm';
hr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\018\MR018001001.dcm';
lr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\011\MR011001001.dcm';
[hr, lr, originalIm] = real_data_prep(hr_path, lr_path, ground_truth_path);

%% building the pyramid

% Laplacian decomposition using 9/7 filters and 5 levels
pfilt = '9/7';
n = 6;
p_lr = lpd(lr, '9/7', n);
p_hr = lpd(hr,'9/7',n);


% using HR as base, we replace the bottom 4 levels with the LR pyramid levels
pyr_merged = p_hr;
hr_merge_psnr = zeros(1,n+1);
for i = 1:floor((n+1)/2)
    pyr_merged{i} = p_lr{i};
    xr = lpr(pyr_merged, pfilt);
    figure()
    imshow(xr)
    title(sprintf('HR base, level %.0f',i));
    hr_merge_psnr(i) = psnr(xr,originalIm);
end

% generating top 4 levels with bm3d on level from HR pyramid
pyr_merged_bm3d = pyr_merged;
for i = 0:floor((n+1)/2)
    [PSNR, y_est] = BM3D(originalIm, p_hr{n+1-i}, sigmaNoise, 'np',0);
    pyr_merged_bm3d{n+1-i} = y_est;
    xr = lpr(pyr_merged_bm3d, pfilt);
    figure()
    imshow(xr)
    title(sprintf('top 4 levels from HR, bm3d on first %.0f levels, 4 bottoms levels from LR',i+1));
    filename = sprintf('top 4 levels from HR, bm3d on first %.0f levels, 4 bottoms levels from LR.jpg',i+1);
    imwrite(xr, ['..\Data\bm3d_lp_images\' filename], 'jpg');
    if i==0
         [PSNR, final_est] = BM3D(originalIm, xr, sigmaNoise, 'np',0);
         figure()
         imshow(final_est)
         title('BM3D on img. with denoised top level');
         filename = 'BM3D on img. with denoised top level.jpg';
         imwrite(final_est, ['..\Data\bm3d_lp_images\' filename], 'jpg');
    end

end

pyr_merged_bm3d_tweaked = pyr_merged;
% generating top 4 levels with bm3d on level from HR pyramid
for i = 0:floor((n+1)/2)
    [PSNR, y_est,~] = BM3DTweaked(originalIm,p_hr{n+1-i},single(p_lr{n+1-i}), sigmaNoise, 'np',0);
    pyr_merged_bm3d_tweaked{n+1-i} = y_est;
    xr = lpr(pyr_merged_bm3d_tweaked, pfilt);
    figure()
    imshow(xr)
    title(sprintf('top 4 levels from HR, bm3d_tweaked on first %.0f levels, 4 bottoms levels from LR',i+1));
    filename = sprintf('top 4 levels from HR, bm3d_tweaked on first %.0f levels, 4 bottoms levels from LR.jpg',i+1);
    imwrite(xr, ['..\Data\bm3d_lp_images\' filename], 'jpg');
   
end

%% LR Pyramid, top level from HR, BM3D on final product

tmp_pyr = p_lr;
tmp_pyr{n+1} = p_hr{n+1};
[~, top_level_bm3d] = BM3D(originalIm, tmp_pyr{n+1}, sigmaNoise, 'np',0);
tmp_pyr{n+1} = top_level_bm3d;
[~, top_level_bm3d] = BM3DTweaked(originalIm, tmp_pyr{n+1},single(p_lr{n+1}), sigmaNoise, 'np',0);
% tmp_pyr{7} = p_hr{7};
% [~, scnd_level_bm3d] = BM3D(originalIm, tmp_pyr{7}, 70, 'np',0);
xr = lpr(tmp_pyr, pfilt);
psnr(xr,originalIm)
tmp_pyr2 = tmp_pyr;
tmp_pyr2{n+1} = top_level_bm3d;
xr2 = lpr(tmp_pyr2, pfilt);
psnr(xr2,originalIm)

[psnr_final, final_est] = BM3D(originalIm, xr, sigmaNoise, 'np',0);
% [psnr_denoised,denoised_im] = BM3D(originalIm, hr, 40, 'np',0);
[psnr_denoised,denoised_im] = BM3DTweaked(originalIm, hr,single(lr), sigmaNoise, 'np',0);
[~,rect] = imcrop(originalIm);
figure()
subplot(2,2,1)
imshow(imcrop(xr,rect))
title('LR Pyramid, Top level HR with bm3d')
subplot(2,2,2)
imshow(imcrop(xr2,rect))
title('LR Pyramid, Top level HR with bm3dtweak')
subplot(2,2,3)
imshow(imcrop(originalIm,rect))
title('original image')
subplot(2,2,4)
imshow(imcrop(denoised_im,rect))
title('BM3D Tweak')


