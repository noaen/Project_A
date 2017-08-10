function B = rescale(A)
% A is a matrix of any dimension (can also be a vecotr) 
% B has the same dimension as A but is a double scaled to [0,1]
% Ron Ziv - ver 0.1 - 12/04/2017

B = double((A-min(A(:)))/(max(A(:))-min(A(:))));

end