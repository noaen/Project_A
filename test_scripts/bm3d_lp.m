%%this script tests implementing bm3d on levels of the laplacian pyramid

%% loading images
clc; close all; clear;
addpath(genpath([ pwd '\..\' ]));
im = load_untouch_nii('\..\mri_images\high_snr_registered.nii');
sigmaNoise = 70;
sigmaBlur = 5;
[originalIm, hr, lr] = image_prep(im,sigmaNoise, sigmaBlur); %getting a noised version of the original image


%% generating pyramids

% Laplacian decomposition using 9/7 filters and 5 levels
pfilt = '9/7';
n = 7;
y_lr = lpd(lr, '9/7', n);
y_hr = lpd(hr,'9/7',n);
[PSNRTweakFusion, z_est,z_hat] = BM3DTweaked(z_mri,rescale(z_c_n_mri_lumChrom(:,:,1)),single(z_b_mri), sigma(l),'np',0);
% HR as base
pyr_merged = y_hr;
hr_merge_psnr = zeros(1,n+1);
for i = 1:n+1
    pyr_merged{i} = y_lr{i};
    xr = lpr(pyr_merged, pfilt);
    figure()
    imshow(xr)
    title(sprintf('HR base, level %.0f',i));
    hr_merge_psnr(i) = psnr(xr,originalIm);
end