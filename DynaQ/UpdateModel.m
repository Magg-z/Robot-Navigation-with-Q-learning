function [ Model ] = UpdateModel( s, a, r, sp, Model )
% a:  the last executed action

Model(s,a,1) = sp;
Model(s,a,2) = r;