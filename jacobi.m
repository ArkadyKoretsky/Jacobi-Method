clc
clear all

% File Input
A_Matrix = readmatrix("matrix.xlsx");
bVector = readmatrix("vector.xlsx");
[row,~] = size(A_Matrix);

if det(A_Matrix) == 0 % check if this linear system has exactly one solution
    prompt = "This current linear system doesn't have exactly one solution" + newline;
    disp(prompt);
    Display_Input(A_Matrix, bVector);
    msgbox(prompt);
    return
end

A_Diagonal = diag(A_Matrix);
if all(abs(A_Diagonal) > sum(abs(A_Matrix),2) - abs(A_Diagonal)) % check diagonally dominant matrix, if true perform the Jacobi method
    [xVector] = Jacobi_Method(A_Matrix, bVector);
    prompt = "This current linear system converge with sufficient condition" + newline; 
else % check for the necessary and sufficient condition   
  D_Matrix = diag(A_Diagonal);
  L_Matrix = tril(A_Matrix) - D_Matrix;
  U_Matrix = triu(A_Matrix) - D_Matrix;
  Bj_Matrix = -inv(D_Matrix) * (L_Matrix + U_Matrix);
  
  if all(abs(eig(Bj_Matrix)) < 1) % check if all the eigen values of Bj are inside the unit circle, if true perform the Jacobi method
    [xVector] = Jacobi_Method(A_Matrix, bVector);
    prompt = "This current linear system converge with necessary and sufficient condition" + newline;
  else
     prompt = "This method won't converge for the current linear system" + newline + "We suggest you to try the Gauss–Seidel method" + newline;
     disp(prompt);
     Display_Input(A_Matrix, bVector);
     msgbox(prompt);
     return
  end
end

prompt = prompt + "The answer for this linear system is:" + newline;
for i=1:row-1
    prompt = prompt + sprintf("X%d = %g, ", i, xVector(i)); 
end
prompt = prompt + sprintf("X%d = %g", row, xVector(row)) + newline;

disp(prompt);
Display_Input(A_Matrix, bVector);
msgbox(prompt);