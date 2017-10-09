%% defining scan params, noising, blurring kernel (sigma & size)
sigma = [0:5:70]; %noise sigma
sigma_rob = [10,30,50,70]; % sigma for robustness test
sigma_blur = [0 ,1:1:10]; % sigma of gaussian kerenl
ker_size = 3;
psnr = load('C:\Project_A-master\Project_A\BM3DOutputPics\robustness\PSNR_Rob_SigmaR10305070_Ker5911_Sigma0570.mat');
PSNR_BM3DTweak_rob = psnr.PSNR_BM3DTweak_rob;
PSNR_BM3D_rob = psnr.PSNR_BM3D_rob;
figure
surf(sigma_blur,sigma(2:end),reshape(PSNR_BM3DTweak_rob(1,1,:,2:end),[length(sigma_blur),length(sigma)-1])',ones([length(sigma_blur),length(sigma)-1])'+1)
hold on
surf(sigma_blur,sigma(2:end),reshape(PSNR_BM3D_rob(1,1,:,2:end),[length(sigma_blur),length(sigma)-1])',ones([length(sigma_blur),length(sigma)-1])')

rob = load('C:\Project_A-master\Project_A\BM3DOutputPics\robustness\PSNRrob_103050.mat');
plot(sigma,rob);