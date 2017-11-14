function C = imfuseFFT(A,B,r)


[oldrow,oldcol] = size(A);
if (oldrow ~= oldcol)
    A = imresize(A,[max(size(A)),max(size(A))]);
    B = imresize(B,size(A));
end
[row,col] = size(A);

C = zeros(size(A));
[X,Y] = meshgrid(1:row,1:col);

Cr = round(row/2);
Cc = round(col/2);
A = double(A);
B = double(B);
A = fftshift(fft2(A));
B = fftshift(fft2(B));


C((X-Cr).^2+(Y-Cc).^2<=r^2) = A((X-Cr).^2+(Y-Cc).^2<=r^2);
C((X-Cr).^2+(Y-Cc).^2>r^2) = B((X-Cr).^2+(Y-Cc).^2>r^2);

C = ifft2(ifftshift(C));
C = imresize(C,[oldrow,oldcol]);

end