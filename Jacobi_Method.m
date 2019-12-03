function [xVector] = Jacobi_Method(A_Matrix, bVector)

[row,col] = size(A_Matrix);
xVector = rand([row,1]);
epsilon = 1e-7; % ? = 10^-7

% first iteration of the Jacobi method outside the while loop to intialize
% the temp vector
for i=1:row
    tempVector = xVector;
    xVector(i) = (bVector(i) - (A_Matrix(i,:) * tempVector - A_Matrix(i,i) * tempVector(i))) / A_Matrix(i,i);
end

while max(abs(xVector - tempVector)) >= epsilon
    for i=1:col
        tempVector = xVector;
        xVector(i) = (bVector(i) - (A_Matrix(i,:) * tempVector - A_Matrix(i,i) * tempVector(i))) / A_Matrix(i,i);
    end
end

end