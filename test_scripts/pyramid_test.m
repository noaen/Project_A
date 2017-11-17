%% loading images
% clc; close all; clear;
% addpath(genpath([ pwd '\..\' ]));
im = load_untouch_nii('..\mri_images\high_snr.nii');
sigmaNoise = 40;
sigmaBlur = 5;
KerSize = 5;
[originalIm, hr, lr] = image_prep(im,sigmaNoise, sigmaBlur,KerSize); %getting a noised version of the original image


%% generating pyramids

% Laplacian decomposition using 9/7 filters and 5 levels
pfilt = '9/7';
n = 7;
y_lr = lpd(lr, '9/7', n);
y_hr = lpd(hr,'9/7',n);


% % Display output of LR pyramid
% figure(1)
% suptitle('LR Pyramid')
% colormap(gray)
% nr = floor(sqrt(n+1));
% nc = ceil((n+1)/nr);
% for l = 1:n+1
%     subplot(nr, nc, l); 
%     imageshow(y_lr{l});
% end
% 
% % Display output of HR pyramid
% figure(2)
% suptitle('HR Pyramid')
% colormap(gray)
% nr = floor(sqrt(n+1));
% nc = ceil((n+1)/nr);
% for l = 1:n+1
%     subplot(nr, nc, l); 
%     imageshow(y_hr{l});
% end
% 
% % Reconstruction
% xr_lr = lpr(y_lr, pfilt);
% xr_hr = lpr(y_hr, pfilt);
% 
% % Show perfect reconstruction
% figure(3)
% colormap(gray)
% subplot(1,2,1), imageshow(xr_lr, [0, 1]);
% title('LR Reconstructed')
% subplot(1,2,2), imageshow(xr_hr, [0, 1]);
% title('HR Reconstructed')
% 

%% merging 
close all;
clc;

% LR as base
pyr_merged = y_lr;
lr_merge_psnr = zeros(1,n+1);
lr_merge_bm3d_psnr = zeros(1,n+1);
lr_merge_bm3dtweak_psnr = zeros(1,n+1);
for i = 1:n+1
    pyr_merged{i} = y_hr{i};
    xr = lpr(pyr_merged, pfilt);
    
%     figure()
%     imshow(xr)
%     title(sprintf('Inital LR,%.0f levels switched',i));
    lr_merge_psnr(i) = psnr(xr,originalIm);
    [psnr_merged, bm3d_merged] = BM3D(originalIm, xr, 40, 'np', 0);
    figure()
    imshow(bm3d_merged)
    title(sprintf('Inital LR BM3D,%.0f levels switched',i));
    lr_merge_bm3d_psnr(i) = psnr_merged;
    [psnr_merged, bm3d_merged] = BM3DTweaked(originalIm, xr,single(lr), 40, 'np', 0);
    figure()
    imshow(bm3d_merged)
    title(sprintf('Inital LR BM3DTweak,%.0f levels switched',i));
    lr_merge_bm3dtweak_psnr(i) = psnr_merged;

end
  
% HR as base
pyr_merged = y_hr;
hr_merge_psnr = zeros(1,n+1);
hr_merge_bm3d_psnr = zeros(1,n+1);
hr_merge_bm3dtweak_psnr = zeros(1,n+1);
for i = 1:n+1
    pyr_merged{i} = y_lr{i};
    xr = lpr(pyr_merged, pfilt);
%     figure()
%     imshow(xr)
%     title(sprintf('Inital HR,%.0f levels switched',i));
    hr_merge_psnr(i) = psnr(xr,originalIm);
    [psnr_merged, bm3d_merged] = BM3D(originalIm, xr, 40, 'np', 0);
    figure()
    imshow(bm3d_merged)
    title(sprintf('Inital HR BM3D,%.0f levels switched',i));
    hr_merge_bm3d_psnr(i) = psnr_merged;
    [psnr_merged, bm3d_merged] = BM3DTweaked(originalIm, xr,single(lr), 40, 'np', 0);
    figure()
    imshow(bm3d_merged)
    title(sprintf('Inital HR BM3Dtweak,%.0f levels switched',i));
    hr_merge_bm3dtweak_psnr(i) = psnr_merged;
end

plot(1:n+1,lr_merge_psnr,1:n+1,hr_merge_psnr,8,lr_merge_psnr(8),'*r',8,hr_merge_psnr(8),'*g'...
    ,1:n+1,lr_merge_bm3d_psnr,1:n+1,hr_merge_bm3d_psnr,1:n+1,lr_merge_bm3dtweak_psnr,1:n+1,hr_merge_bm3dtweak_psnr);
legend('Inital LR','Inital HR','HR','LR','Inital LR BM3D','Inital HR BM3D','Inital LR BM3DTweak','Inital HR BM3DTweak')
title('PSNR of Merged')
xlabel('# of lower(res) levels switched')
ylabel('PSNR')

% 
% % displaying merged pyramid
% figure(4)
% suptitle('Merged Pyramid')
% colormap(gray)
% nr = floor(sqrt(n+1));
% nc = ceil((n+1)/nr);
% for l = 1:n+1
%     subplot(nr, nc, l); 
%     imageshow(pyr_merged{l});
% end

