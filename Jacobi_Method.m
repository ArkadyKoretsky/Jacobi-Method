function [xVector] = Jacobi_Method(A_Matrix, bVector)
%JACOBI_METHOD Summary of this function goes here
%   Detailed explanation goes here
[row,col] = size(A_Matrix);
xVector = zeros(row,1);
error = 1e-5;


for i=1:col
   tempVector = xVector;
   xVector(i) = (bVector(i) - (A_Matrix(i,1:i-1)*tempVector(1:i-1))-(A_Matrix(i,i+1:col)*tempVector(i+1:col)))/(A(row,row));
end

end

