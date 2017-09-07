function [fig1, fig2] = draw_bm(filename,img_csv,img_size,row,col,patch_size)
% This function receives an image, a file name containing CSV data of block  
% matching a subscript(x,y) of the picture.

img = uint8(reshape(img_csv,flip(img_size)));
figure();
imshow(img');
lineInd = sub2ind(size(img),row,col);
patch_table = get_patchs(filename,lineInd);

M = zeros(length(patch_table),4); %rectangular matrix 
for i = 1:length(patch_table)
    [prow,pcol] = ind2sub(size(img),patch_table(i)); 
    M(i,1) = prow;
    M(i,2) = pcol;
    M(i,3) = patch_size;
    M(i,4) = patch_size;
    
end
patch_table
[pcol,prow] = ind2sub(size(img),lineInd); 

% img_re = img';

fig1 = figure();
img_bm = insertShape(img', 'Rectangle',M);
img_bm = insertShape(img_bm, 'Rectangle',[pcol,prow,patch_size,patch_size],'Color','red');
imshow(img_bm)

fig2 = figure()

for i = 1:length(patch_table)
    subplot(2,length(patch_table)/2,i)
    imshow(imcrop(img',M(i,:)))
    title(sprintf('# %d',i))
end

end