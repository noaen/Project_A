function [original_im, noised_im, blurred_im] = image_prep(im,sigmaNoise, sigmaBlur)
% This function receives the original image.
% It resizes it to 512x512 (nearest power of 2)
% turns it to double
% creates a noisy image by adding gaussian noise with std of sigma
original_im = rescale(im2double(imresize(im.img(:,:,30), [512,512])));
noised_im = original_im + (sigmaNoise/255)*randn(size(original_im));
blurred_im = imgaussfilt(original_im,sigmaBlur,'FilterSize', 9);

end 