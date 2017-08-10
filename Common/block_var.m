function B = block_var(A,N)
% the function computes the variance of A by taking blocks of NxN.
% returns B which is the matrix of the block variances, has the same
% dimensions as A.  

% Ron Ziv - ver 0.1 -  12/04/2017

fun = @(z) var(z.data(:))*ones(size(z.data));
B = blockproc(A,[N N], fun);

end