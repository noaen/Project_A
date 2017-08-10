%% Testing of BM3D
N = 512;
sigma = 5;
band = 6;

[A, b, x] = blur(N,band,sigma);
b = reshape(b,[N,N]);
x = reshape(x,[N,N]);
x = rescale(x);
b = rescale(b);

%  SNR = 10; % dB
% % % normalizing for imnoise, [0,1]
%  n_var = var(x(:))/10^(SNR/10);
%  n_mean = 0;
% % imnoise clips the values of a given image to [0,1] meaning variance is
% % biased, for analysis of variance adding noise manualy is better.
%  noise = (sqrt(n_var))*randn(size(x));

%% getting MRI pics
addpath(genpath(pwd));
low_snr =load_untouch_nii('images\Natural\MRI\low_snr.nii');
high_snr = load_untouch_nii('images\Natural\MRI\high_snr_registered.nii');
high_snr_high_res = load_untouch_nii('images\Natural\MRI\high_snr.nii');
%%
figure
imshow(low_snr.img(:,:,30),[])
figure
imshow(high_snr.img(:,:,30),[])
z_mri = rescale(im2double(low_snr.img(:,:,30)));
%z_b_mri = single(rescale(im2double(high_snr.img(:,:,30))));
z_b_mri = rescale(im2double(high_snr.img(:,:,30)));

%% AWGN
sigma2 = 150;
z_test = z_b_mri + (sigma2/255)*randn(size(z_b_mri));
 
 %%
 
% [PSNRtweak, z_est,z_hat] = BM3DTweaked(z_mri, z_mri,single(z_b_mri), 150); 
[PSNR, z_est_orig] = BM3D(z_mri, z_mri,30,'np',0  ); 
% figure
% imshow(z_est,[])
% figure
% imshow(z_b_mri,[])

%% Blurring
PSF = fspecial('gaussian',5,9);
Blurred = rescale(imfilter(z_b_mri,PSF,'circ','conv'));
figure
imshow(Blurred,[]);
%% BM3D color
PSF = fspecial('gaussian',5,1);
Blurred = imfilter(z_b_mri,PSF,'circ','conv');
z_c_mri = zeros([size(z_mri),3]);
z_c_mri(:,:,1) = z_mri;
z_c_mri(:,:,2) = z_b_mri;
z_c_mri(:,:,3) = z_b_mri;
y_c_mri = zeros([size(z_mri),3]);
y_c_mri(:,:,1) = z_b_mri;
y_c_mri(:,:,2) = z_b_mri;
y_c_mri(:,:,3) = z_b_mri;



[PSNRcolor, yRGB_est] = CBM3D(y_c_mri, z_c_mri, 150);
% [PSNRcolortweak, yRGB_estTweak] = CBM3DTweaked(y_c_mri, z_c_mri,y_c_mri, 150);
figure
imshow(yRGB_estTweak(:,:,1),[])