function [ Q ] = UpdateQLearning( s, a, r, sp, ~, Q , alpha, gamma )

TD_error =   ((r + gamma*max(Q(sp,:))) - Q(s,a));
Q(s,a) =  Q(s,a) + alpha * TD_error;
