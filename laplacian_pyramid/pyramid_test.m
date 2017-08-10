%% loading images
clc; close all; clear;
addpath(genpath([ pwd '\..\' ]));
im = load_untouch_nii('..\mri_images\high_snr_registered.nii');
sigmaNoise = 70;
sigmaBlur = 5;
[originalIm, hr, lr] = image_prep(im,sigmaNoise, sigmaBlur); %getting a noised version of the original image


%% generating pyramids

% Laplacian decomposition using 9/7 filters and 5 levels
pfilt = '9/7';
n = 5;
y_lr = lpd(lr, '9/7', n);
y_hr = lpd(hr,'9/7',n);


% Display output of LR pyramid
figure(1)
suptitle('LR Pyramid')
colormap(gray)
nr = floor(sqrt(n+1));
nc = ceil((n+1)/nr);
for l = 1:n+1
    subplot(nr, nc, l); 
    imageshow(y_lr{l});
end

% Display output of HR pyramid
figure(2)
suptitle('HR Pyramid')
colormap(gray)
nr = floor(sqrt(n+1));
nc = ceil((n+1)/nr);
for l = 1:n+1
    subplot(nr, nc, l); 
    imageshow(y_hr{l});
end

% Reconstruction
xr_lr = lpr(y_lr, pfilt);
xr_hr = lpr(y_hr, pfilt);

% Show perfect reconstruction
figure(3)
colormap(gray)
subplot(1,2,1), imageshow(xr_lr, [0, 1]);
title('LR Reconstructed')
subplot(1,2,2), imageshow(xr_hr, [0, 1]);
title('HR Reconstructed')



% %% finding out how many levels we need
% clc;
% pfilt = '9/7';
% psnr_vec = zeros(1,n);
% for i = 1:n
%     y_lr = lpd(lr, '9/7', i);
%     xr_lr = lpr(y_lr, pfilt);
%     figure()
%     imshow(xr_lr)
%     psnr_vec(i) = psnr(xr_lr,lr);
% end
% plot(1:i,psnr_vec);
% xlabel('n')
% ylabel('PSNR')
% title('PSNR of LR Reconstruction')
   

    

%% merging 
close all;
clc;

% LR as base
pyr_merged = y_lr;
lr_merge_psnr = zeros(1,n+1);
for i = 1:n+1
    pyr_merged{i} = y_hr{i};
    xr = lpr(pyr_merged, pfilt);
    figure()
    imshow(xr)
    title(sprintf('LR base, level %.0f',i));
    lr_merge_psnr(i) = psnr(xr,originalIm);
end
% figure()
% hold on;
% plot(1:n+1,merge_psnr);
% plot(1,psnr(lr, originalIm),'r*');
% hold off;
% title('PSNR of Merged, LR as base')
% xlabel('n')
% ylabel('PSNR')
    
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
% figure()
% hold on;
% plot(1:n+1,merge_psnr);
% plot(1,psnr(hr, originalIm),'r*');
% hold off;
% title('PSNR of Merged, HR as base')
% xlabel('n')
% ylabel('PSNR')

plot(1:n+1,lr_merge_psnr,1:n+1,hr_merge_psnr,1,psnr(lr, originalIm),'r*',1,psnr(hr, originalIm),'g*');
legend('LR base','HR base','LR','HR')
title('PSNR of Merged')
xlabel('n')
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

