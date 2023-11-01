function [ states ] = BuildStateList(N,M)
%BuildStateList builds a state list from a state matrix

x1  = 0:N-1;
x2  = 0:M-1;

states = setprod(x1,x2);

size(states)
end