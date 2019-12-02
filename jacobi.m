clc
clear all

vectorDimension = input('Enter Vector Diomnesion: ');
matrixDimension = vectorDimension * vectorDimension;

prompt = sprintf('Enter %d values in [] for vector b: ', vectorDimension);
bVector = input(prompt);
bVector = reshape(bVector,[vectorDimension,1]);

prompt = sprintf('Enter %d values in [] for Matrix A, each row separete with semicolon (;): ', matrixDimension);
A_Matrix = input(prompt);

if det(A_Matrix) == 0
    disp('There is no solution for the current equation'); 
end
