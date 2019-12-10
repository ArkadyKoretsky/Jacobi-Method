function [xVector] = Jacobi_Method(A_Matrix, bVector)

[row,~] = size(A_Matrix);
xVector = rand([row,1]); % Initial Value - X0
epsilon = 1e-7; % epsilon = 10^-7
A_Diagonal = diag(A_Matrix);

% first iteration of the Jacobi method outside the while loop to intialize
% the temp vector
tempVector = xVector;
xVector = (bVector - (A_Matrix * tempVector - A_Diagonal .* tempVector)) ./ A_Diagonal;

while max(abs(xVector - tempVector)) >= epsilon % check infinity norm
   tempVector = xVector;
   xVector = (bVector - (A_Matrix * tempVector - A_Diagonal .* tempVector)) ./ A_Diagonal; 
end

end