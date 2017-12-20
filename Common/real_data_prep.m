function [output_hr, output_lr, output_gt] = real_data_prep(hr_path, lr_path, gt_path) 
% hr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\009\MR009001001.dcm';
% lr_path = 'C:\mri_images\Data211117\Cohen_Regev\Study20171121_145132_394000\011\MR011001001.dcm';
hr = im2double(dicomread(hr_path));
lr = im2double(dicomread(lr_path));
gt = im2double(dicomread(gt_path));
rescaled_lr = rescale(im2double(imresize(lr, size(hr))));
rescaled_hr = rescale(hr);
rescaled_gt = rescale(gt);

% intensity-based registration
[optimizer,metric] = imregconfig('multimodal');
registered_lr = imregister(rescaled_lr, rescaled_gt, 'similarity', optimizer, metric);
registered_hr = imregister(rescaled_hr, rescaled_gt, 'similarity', optimizer, metric);
output_hr = registered_hr;
output_lr = registered_lr;
output_gt = rescaled_gt;


end