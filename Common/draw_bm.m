function draw_bm(filename,img, col,row,patch_size)
% This function receives an image, a file name containing CSV data of block  
% matching a subscript(x,y) of the picture.

lineInd = sub2ind(size(img),row,col); %shifted row and col for row stack ind
patch_table = get_patchs(filename,lineInd);

M = zeros(length(patch_table),4); %rectangular matrix 
for i = 1:length(patch_table)
    [prow,pcol] = ind2sub(size(img),patch_table(i)); 
    M(i,1) = prow;
    M(i,2) = pcol;
    M(i,3) = patch_size;
    M(i,4) = patch_size;
end

img_bm = insertShape(img, 'Rectangle',M);
imshow(img_bm)

end