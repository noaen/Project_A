function [fig1, fig2,davg,dvar] = draw_bm(filename,img_csv,img_size,row,col,patch_size, your_name)
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
ref_block = [pcol,prow,patch_size,patch_size];

fig1 = figure();
img_bm = insertShape(img', 'Rectangle',M);
img_bm = insertShape(img_bm, 'Rectangle',ref_block,'Color','red');
imshow(img_bm)
title(sprintf(your_name),'Interpreter','None');
drawnow;

fig2 = figure();

% suptitle(your_name);
subplot(2,length(patch_table)/2,1)
ref_img = imcrop(img',ref_block);
imshow(ref_img,[])
title(sprintf('ref block'))
dist_list = zeros(length(length(patch_table)-1));
for i = 1:length(patch_table)-1
    block_img = imcrop(img',M(i,:));
    dist = norm(double(ref_img(:))-double(block_img(:)),2);
    dist_list(i) = dist;
    subplot(2,length(patch_table)/2,i+1)
    imshow(block_img,[])
    title(sprintf(' d = %.1f',dist))
end
top_title = strrep(your_name,'_','\_');
top_title = [top_title sprintf(' avg_d = %.1f',mean(dist_list)) sprintf(' var_d = %.1f',var(dist_list))];
suptitle(top_title)
davg = mean(dist_list);
dvar = var(dist_list);

end