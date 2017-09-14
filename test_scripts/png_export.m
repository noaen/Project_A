clc; close all; clear;
addpath(genpath([ pwd '\..\' ]));
im = load_untouch_nii('..\mri_images\high_snr_registered.nii');
sigmaNoise = 40;
sigmaBlur = 5;
[originalIm, hr, lr] = image_prep(im,sigmaNoise, sigmaBlur); %getting a noised version of the original image


%% generating pyramids
% Laplacian decomposition using 9/7 filters and 5 levels
pfilt = '9/7';
n = 7;
y_lr = lpd(lr, '9/7', n);
y_hr = lpd(hr,'9/7',n);

imwrite(originalIm,'..\Data\png_images\high_snr_high_res.png', 'png');
imwrite(lr, '..\Data\png_images\high_snr_low_res.png', 'png');
imwrite(hr, '..\Data\png_images\low_snr_high_res.png', 'png');

for i = 4:7
    str_lr = sprintf('lr_lvl_%.0f',i);
    str_hr = sprintf('hr_lvl_%.0f',i);
    imwrite(y_lr{i}, ['..\Data\png_images\' str_lr '.png'], 'png');
    imwrite(y_hr{i}, ['..\Data\png_images\' str_hr '.png'], 'png');
end
