function [ posp, penalty ] = DoAction( action, pos,maze )
%DoAction: executes the action (a) into the environment
% a: is the direction 
% pos: is the vector containning the position 

x = pos(1);
y = pos(2); 
[N M] = size(maze);

% bounds for x
xmax = (N+1)-1; 
xmin = 0;

% bounds for y
ymax = (M+1)-1; 
ymin = 0;

penalty=0;
if (action==1)
    y = y + 1;
elseif (action==2)
    x = x + 1;
elseif (action==3)
    y = y - 1;
elseif (action==4)
    x = x - 1;
end
x = min(xmax,x);
x = max(xmin,x);
y = min(ymax,y);
y = max(ymin,y);

if maze(x+1,y+1)==1
    x = pos(1);
    y = pos(2); 
    penalty=1;
end
posp=[x y];


