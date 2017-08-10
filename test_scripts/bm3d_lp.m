%%this script tests implementing bm3d on levels of the laplacian pyramid

%% loading images
clc; close all; clear;
addpath(genpath([ pwd '\..\' ]));
im = load_untouch_nii('..\mri_images\high_snr_registered.nii');
sigmaNoise = 40;
sigmaBlur = 5;
[originalIm, hr, lr] = image_prep(im,sigmaNoise, sigmaBlur); %getting a noised version of the original image


%% building the pyramid

% Laplacian decomposition using 9/7 filters and 5 levels
pfilt = '9/7';
n = 7;
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
%     figure()
%     subplot(1,2,1)
%     imshow(p_hr{i})
%     title(sprintf('original HR level %.0f',i))
%     subplot(1,2,2)
%     imshow(y_est)
%     title('level denoised')
    figure()
    imshow(xr)
    title(sprintf('top 4 levels from HR, bm3d on first %.0f levels, 4 bottoms levels from LR',i+1));
    filename = sprintf('top 4 levels from HR, bm3d on first %.0f levels, 4 bottoms levels from LR.jpg',i+1);
    imwrite(xr, ['..\Data\bm3d_lp_images\' filename], 'jpg');

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

