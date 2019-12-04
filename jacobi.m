clc
clear all

% File Input
A_Matrix = readmatrix("matrix.xlsx");
bVector = readmatrix("vector.xlsx");
[row,col] = size(A_Matrix);

% % User Input
% A_Matrix = input("Enter values in [] for square matrix A, each row separete with semicolon (;):" + newline);
% [row,col] = size(A_Matrix);
% prompt = sprintf("Enter %d values in [] for vector b: ", row);
% bVector = input(prompt);
% bVector = reshape(bVector,[row,1]);

if det(A_Matrix) == 0
    prompt = "This Problem don't have exactly one solution";
    disp(prompt);
    msgbox(prompt);
    return
end

if all(abs(diag(A_Matrix)) > sum(abs(A_Matrix),2) - abs(diag(A_Matrix))) % check diagonally dominant matrix, if true perform the Jacobi method
    [xVector] = Jacobi_Method(A_Matrix, bVector);
    prompt = "This system converge with sufficient condition" + newline; 
else
  D_Matrix = diag(diag(A_Matrix));
  L_Matrix = tril(A_Matrix) - D_Matrix;
  U_Matrix = triu(A_Matrix) - D_Matrix;
  Bj_Matrix = -inv(D_Matrix) * (L_Matrix + U_Matrix); 
  
  if all(abs(eig(Bj_Matrix)) < 1) % check if all the eigen values of Bj are inside the unit circle, if true perform the Jacobi method
    [xVector] = Jacobi_Method(A_Matrix, bVector);
    prompt = "This system converge with necessary and sufficient condition" + newline;
  else
     prompt = "This method won't converge for the current A matrix and b vector" + newline + "We suggest you to try the Gauss–Seidel method";
     disp(prompt);
     msgbox(prompt);
     return
  end
end

prompt = prompt + "The answer for this linear system is:" + newline;
for i=1:row-1
    prompt = prompt + sprintf("X%d = %g, ", i, xVector(i)); 
end
prompt = prompt + sprintf("X%d = %g", row, xVector(row));

disp(prompt);
msgbox(prompt);