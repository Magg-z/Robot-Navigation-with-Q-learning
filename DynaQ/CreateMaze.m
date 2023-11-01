function [ maze,nrows,ncols ] = CreateMaze()


nrows = 31;
ncols = 31;

% Maze base
A=ones(31,31);
B= imread('bw.png');

j=1;
k=1;
kk=0;
jj=-22;

for ii=1:31
jj= jj+23;
kk= kk+1;
j=1;
k=1;
 for i=1:31
    if B(jj,j)==0
        A(kk,k)=0;
    else
        A(kk,k)=1  ;
    end
 j= j+23;
 k= k+1;
 end
end
imshow(A);
A= ~A;
maze= A;
end