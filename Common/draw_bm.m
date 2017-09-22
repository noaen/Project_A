function [fig1, fig2] = draw_bm(filename,img_csv,img_size,row,col,patch_size, your_name)
% This function receives an image, a file name containing CSV data of block  
% matching a subscript(x,y) of the picture.

img = uint8(reshape(img_csv,flip(img_size)));
% figure();
% imshow(img');
C = textread(filename, '%s','delimiter', '\n');
lineInd = sub2ind(size(img),row,col);
patch_table = get_patchs(C,lineInd);

% in a 3x3 grid there is one block center that has BM, if current selection
% is without BM, search for nearest one.
for i = -1:1
    for j = -1:1
        if (~isempty(patch_table))
            break
        end
        lineInd = sub2ind(size(img),row+i,col+j);
        patch_table = get_patchs(C,lineInd);
    end
end


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
title(sprintf(your_name),'Interpreter','None');
drawnow;

fig2 = figure();
suptitle(your_name)
% suptitle(your_name);
for i = 1:length(patch_table)
    subplot(2,length(patch_table)/2,i)
    imshow(imcrop(img',M(i,:)))
    title(sprintf('# %d',i))
end



end