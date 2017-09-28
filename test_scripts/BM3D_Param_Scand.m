% Printing images of various BM3D method

%% loading images
addpath(genpath(pwd));
% low_snr =load_untouch_nii('images\Natural\MRI\low_snr.nii');
% high_snr = load_untouch_nii('images\Natural\MRI\high_snr_registered.nii');
high_snr_high_res = load_untouch_nii('..\mri_images\high_snr.nii');

%% Taking test image from HH (High res,High SNR)
z_mri = rescale(im2double(high_snr_high_res.img(:,:,30)));

%% defining scan params, noising, blurring kernel (sigma & size)
sigma = [0:5:70]; %noise sigma
sigma_rob = [30,70]; % sigma for robustness test
sigma_blur = [0 ,1:1:10]; % sigma of gaussian kerenl
ker_size = [5,9,11];

%% running script
% z_c_b_mri = zeros([size(z_mri),3]);
% z_c_mri = zeros([size(z_mri),3]);
% z_c_mri(:,:,1) = z_mri;
% z_c_mri(:,:,2) = z_mri;
% z_c_mri(:,:,3) = z_mri;
PSNR_BM3D = zeros(length(ker_size),length(sigma_blur),length(sigma));
PSNR_BM3DTweak = zeros(length(ker_size),length(sigma_blur),length(sigma));
% PSNR_BM3DTweakFusion2 = zeros(length(ker_size),length(sigma_blur),length(sigma));
% PSNR_CBM3DOrig = zeros(length(sigma));
% PSNR_CBM3D = zeros(length(ker_size),length(sigma_blur),length(sigma));
% PSNR_CBM3DTweak = zeros(length(ker_size),length(sigma_blur),length(sigma));
for l = 1:numel(sigma)
    z_n_mri = z_mri + (sigma(l)/255)*randn(size(z_mri)); 
%     z_c_n_mri = zeros([size(z_mri),3]);
%     z_c_n_mri(:,:,1) = z_n_mri;
    [PSNR, z_est_orig] = BM3D(z_mri, z_n_mri, sigma(l),'np',0 );
    filename = sprintf('../BM3DOutputPics/sigma%0.1f_BM3D.jpg' , sigma(l));
    imwrite(z_est_orig,filename,'jpg');
    for i =1:numel(ker_size)
        for j = 1:numel(sigma_blur)
            blur_h = fspecial('gaussian',ker_size(i),sigma_blur(j)+eps);
            z_b_mri = rescale(imfilter(z_mri,blur_h,'circ','conv'));
%             z_c_n_mri(:,:,2) = z_b_mri;
%             z_c_n_mri(:,:,3) = z_b_mri;
%             z_c_b_mri=z_c_n_mri;
%             z_c_b_mri(:,:,1)= z_b_mri;
%             z_c_n_mri_lumChrom = function_rgb2LumChrom(z_c_n_mri, 'opp');
            [PSNRtweak, z_est,z_hat] = BM3DTweaked(z_mri, z_n_mri,single(z_b_mri), sigma(l),'np',0);
%             [PSNRTweakFusion, z_est,z_hat] = BM3DTweaked(z_mri,rescale(z_c_n_mri_lumChrom(:,:,1)),single(z_b_mri), sigma(l),'np',0);
%             [~, z_c_est] = CBM3D(z_c_mri, z_c_n_mri, sigma(l),'np',0 );
%             [~, z_ctweak_est] = CBM3DTweaked(z_c_mri, z_c_n_mri,z_c_b_mri, sigma(l),'np',0 );
%             temp = (z_mri-z_c_est(:,:,1)).^2;
%             PSNRColor = 10*log10(1/mean(temp(:)));
%             temp = (z_mri-z_ctweak_est(:,:,1)).^2;
%             PSNRColorTweak = 10*log10(1/mean(temp(:)));            
            filename = sprintf('../BM3DOutputPics/KerSize%0.1f_sigma%0.1f_SigBlur%0.1f_BM3DTweak.jpg'...
                               ,ker_size(i), sigma(l),sigma_blur(j) );
            imwrite(z_est,filename,'jpg');
%             filename = sprintf('BM3DOutputPics/KerSize%0.1f_sigma%0.1f_SigBlur%0.1f_CBM3D.jpg'...
%                                ,ker_size(i), sigma(l),sigma_blur(j) );
%             imwrite(z_c_est(:,:,1),filename,'jpg');
% %            filename = sprintf('BM3DOutputPics/KerSize%0.1f_sigma%0.1f_SigBlur%0.1f_CBM3DTweak.jpg'...
%                                ,ker_size(i), sigma(l),sigma_blur(j) );
%             imwrite(z_ctweak_est(:,:,1),filename,'jpg');
            
            
            PSNR_BM3D(i,j,l) = PSNR;
            PSNR_BM3DTweak(i,j,l) = PSNRtweak;
%             PSNR_BM3DTweakFusion2(i,j,l) = PSNRTweakFusion;
%             PSNR_CBM3D(i,j,l) =PSNRColor; 
%           PSNR_CBM3DTweak(i,j,l) =PSNRColorTweak ;
        end
    end
end

%% Compare to original CBM3D
    PSNR_CBM3DOrig = zeros(1,length(sigma));
for l = 1:numel(sigma)

    z_n_mri = z_mri + (sigma(l)/255)*randn(size(z_mri)); 
    z_c_n_mri = zeros([size(z_mri),3]);
    z_c_n_mri(:,:,1) = z_n_mri;
    z_c_n_mri(:,:,2) = z_n_mri;
    z_c_n_mri(:,:,3) = z_n_mri;
    [~, z_est_c_orig] = CBM3D(z_c_mri, z_c_n_mri, sigma(l),'np',0 );
    filename = sprintf('BM3DOutputPics/sigma%0.1f_CBM3D.jpg' , sigma(l));
    imwrite(z_est_c_orig(:,:,1),filename,'jpg');
    temp = (z_mri-z_est_c_orig(:,:,1)).^2;
    PSNR_CBM3DOrig(l) = 10*log10(1/mean(temp(:)));
end

%% Noise Estimation robustness
PSNR_BM3D_rob = zeros(length(ker_size),length(sigma_blur),length(sigma));
PSNR_BM3DTweak_rob = zeros(length(ker_size),length(sigma_blur),length(sigma));
% PSNR_CBM3DOrig_rob = zeros(length(sigma));
% PSNR_CBM3D_rob = zeros(length(ker_size),length(sigma_blur),length(sigma));
% PSNR_CBM3DTweak_rob = zeros(length(ker_size),length(sigma_blur),length(sigma));

% z_c_b_mri = zeros([size(z_mri),3]);
% z_c_mri = zeros([size(z_mri),3]);
% z_c_mri(:,:,1) = z_mri;
% z_c_mri(:,:,2) = z_mri;
% z_c_mri(:,:,3) = z_mri;

for m = 1:numel(sigma_rob)
    z_n_mri = z_mri + (sigma_rob(m)/255)*randn(size(z_mri)); 
%     z_c_n_mri = zeros([size(z_mri),3]);
%     z_c_n_mri(:,:,1) = z_n_mri;
    for l = 1:numel(sigma)
        [PSNR, z_est_orig] = BM3D(z_mri, z_n_mri, sigma(l),'np',0 );
        filename = sprintf('../BM3DOutputPics/robustness/sigma%0.1f_BM3D.jpg' , sigma(l));
        imwrite(z_est_orig,filename,'jpg');
        for i =1:numel(ker_size)
            for j = 1:numel(sigma_blur)
                blur_h = fspecial('gaussian',ker_size(i),sigma_blur(j)+eps);
                z_b_mri = rescale(imfilter(z_mri,blur_h,'circ','conv'));
%                 z_c_n_mri(:,:,2) = z_b_mri;
%                 z_c_n_mri(:,:,3) = z_b_mri;
%                 z_c_b_mri=z_c_n_mri;
%                 z_c_b_mri(:,:,1)= z_b_mri;
                [PSNRtweak, z_est,z_hat] = BM3DTweaked(z_mri, z_n_mri,single(z_b_mri), sigma(l),'np',0);
%                 [~, z_c_est] = CBM3D(z_c_mri, z_c_n_mri, sigma(l),'np',0 );
%                 [~, z_ctweak_est] = CBM3DTweaked(z_c_mri, z_c_n_mri,z_c_b_mri, sigma(l),'np',0 );
%                 temp = (z_mri-z_c_est(:,:,1)).^2;
%                 PSNRColor = 10*log10(1/mean(temp(:)));
%                 temp = (z_mri-z_ctweak_est(:,:,1)).^2;
%                 PSNRColorTweak = 10*log10(1/mean(temp(:)));            
                filename = sprintf('../BM3DOutputPics/robustness/SigRob%0.1f_KerSize%0.1f_sigma%0.1f_SigBlur%0.1f_BM3DTweak.jpg'...
                                   ,sigma_rob(m),ker_size(i), sigma(l),sigma_blur(j) );
                imwrite(z_est,filename,'jpg');
%                 filename = sprintf('BM3DOutputPics/robustness/SigRob%0.1f_KerSize%0.1f_sigma%0.1f_SigBlur%0.1f_CBM3D.jpg'...
%                                    ,sigma_rob(m),ker_size(i), sigma(l),sigma_blur(j) );
%                 imwrite(z_c_est(:,:,1),filename,'jpg');
%                 filename = sprintf('BM3DOutputPics/robustness/SigRob%0.1f_KerSize%0.1f_sigma%0.1f_SigBlur%0.1f_CBM3DTweak.jpg'...
%                                    ,sigma_rob(m),ker_size(i), sigma(l),sigma_blur(j) );
%                 imwrite(z_ctweak_est(:,:,1),filename,'jpg');


                PSNR_BM3D_rob(i,j,l) = PSNR;
                PSNR_BM3DTweak_rob(i,j,l) = PSNRtweak;
%                 PSNR_CBM3D_rob(i,j,l) =PSNRColor; 
%                 PSNR_CBM3DTweak_rob(i,j,l) =PSNRColorTweak ;
            end
        end
    end
end

%% Plotting
% k = 1;
% kb =6;
% figure,plot(sigma,reshape(PSNR_BM3D_rob(k,kb,:),[1,6]),sigma,reshape(PSNR_BM3DTweak_rob(k,kb,:),[1,6]),sigma,reshape(PSNR_CBM3D_rob(k,kb,:),[1,6]))
% title('Noise estimation, {\sigma} = 70, ')
% xlabel('{\sigma}_{estimate}')
% ylabel('PSNR')'
% legend('BM3D','BM3DTweak','CBM3D');

k = 2;
kb =2;
figure,plot(sigma,reshape(PSNR_BM3D(k,kb,:),[1,6]),sigma,reshape(PSNR_BM3DTweak(k,kb,:),[1,6])...
            ,sigma,reshape(PSNR_CBM3D(k,kb,:),[1,6]),sigma,reshape(PSNR_BM3DTweakFusion(k,kb,:),[1,6]))

title(['PSNR vs {\sigma}, {\sigma}_h =' sprintf(' %.0f, N_h = %.0f ',sigma_blur(kb),ker_size(k))]);
xlabel('{\sigma}');
ylabel('PSNR');
legend('BM3D','BM3DTweak','CBM3D','BM3DTweakFusion');

%% Plotting
% k = 1;
% kb =6;
% figure,plot(sigma,reshape(PSNR_BM3D_rob(k,kb,:),[1,6]),sigma,reshape(PSNR_BM3DTweak_rob(k,kb,:),[1,6]),sigma,reshape(PSNR_CBM3D_rob(k,kb,:),[1,6]))
% title('Noise estimation, {\sigma} = 70, ')
% xlabel('{\sigma}_{estimate}')
% ylabel('PSNR')'
% legend('BM3D','BM3DTweak','CBM3D');

k = 3;
kb =2;
figure,plot(sigma(2:end),reshape(PSNR_BM3D(k,kb,2:end),[1,length(sigma)-1]),sigma(2:end),reshape(PSNR_BM3DTweak(k,kb,2:end),[1,length(sigma)-1])...
            )
xlim([5,70])
title(['PSNR vs {\sigma}, {\sigma}_h =' sprintf(' %.0f, N_h = %.0f ',sigma_blur(kb),ker_size(k))]);
xlabel('{\sigma}');
ylabel('PSNR');
legend('BM3D','BM3DTweak');

%%
figure
surf(sigma_blur,sigma,reshape(PSNR_BM3DTweak(1,:,:),[length(sigma_blur),length(sigma)])',ones([length(sigma_blur),length(sigma)])'+1)
hold on
surf(sigma_blur,sigma,reshape(PSNR_BM3D(1,:,:),[length(sigma_blur),length(sigma)])',ones([length(sigma_blur),length(sigma)])')

figure
surf(sigma_blur,sigma,reshape(PSNR_BM3DTweak_rob(2,:,:),[length(sigma_blur),length(sigma)])',ones([length(sigma_blur),length(sigma)])'+1)
hold on
surf(sigma_blur,sigma,reshape(PSNR_BM3D_rob(2,:,:),[length(sigma_blur),length(sigma)])',ones([length(sigma_blur),length(sigma)])')

