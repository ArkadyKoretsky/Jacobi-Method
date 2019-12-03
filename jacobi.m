clc
clear all
    


prompt = sprintf("Enter values in [] for vector b: ");
bVector = input(prompt);
[row,col] = size(bVector);
vectorDimension = row * col; % number of elements * 1
bVector = reshape(bVector,[vectorDimension,1]);

matrixDimension = vectorDimension * vectorDimension;
prompt = sprintf("Enter %d values in [] for square matrix A, each row separete with semicolon (;): ", matrixDimension);
A_Matrix = input(prompt);

if det(A_Matrix) == 0
    msgbox("This Problem don't have exactly one solution");
    exit
end

if all((2*abs(diag(A))) >= sum(abs(A),2)) % check diagonally dominant matrix, if true perform the Jacobi method
    % TODO: implement Jacobi function
else
  D_Matrix = diag(diag(A_matrix));
  L_Matrix = tril(A_MAtrix) - D_Matrix;
  U_Matrix = triU(A_MAtrix) - D_Matrix;
  Bj_Matrix = -inv(D_Matrix) * (L_Matrix + U_Matrix);

  if all(abs(eig(Bj_Matrix)) < 1) % check if all the eigen values of Bj are inside the unit circle, if true perform the Jacobi method
    % TODO: implement Jacobi function 
  else
     msgbox("This method won't converge for the A matrix and b vector" + newline + "We suggest you to try the Gauss–Seidel method"); 
  end
end

