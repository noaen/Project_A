function [distance, im_k,imblur_k] = resize_metric(im,imblur,metric,scale)

k= 100; % # of rescaling
im_k = zeros([size(im),k]);
imblur_k = zeros([size(im),k]);
distance = zeros(1,k+1);
im_temp = im;
imblurr_temp = imblur;
X = [im_temp(:).' ;imblurr_temp(:).']; 
if (strcmp(metric,'seuclidean'))
    S = nanstd(X);
    distance(1) = pdist(X,metric,S)./numel(im_temp); 
else
    distance(1) = pdist(X,metric)./numel(im_temp); 
end


for i= 2:k+1
    im_temp = imresize(im,scale.^(i-1));
    imblurr_temp = imresize(imblur,scale.^(i-1));
    X = [im_temp(:).' ;imblurr_temp(:).']; 
    if (strcmp(metric,'seuclidean'))
        S = nanstd(X);
        distance(i) = pdist(X,metric,S)./numel(im_temp); 
    else
        distance(i) = pdist(X,metric)./numel(im_temp); 
    end
    im_k(1:size(imblurr_temp,1),1:size(imblurr_temp,2),i) = im_temp;
    imblur_k(1:size(imblurr_temp,1),1:size(imblurr_temp,2),i) = imblurr_temp;
end


