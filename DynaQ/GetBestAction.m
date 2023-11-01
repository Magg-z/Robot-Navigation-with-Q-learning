function [ a ] = GetBestAction( Q, s )
% GetBestAction return the best action for state (s)
% Q: the Qtable
% s: the current state
% Q has structure  Q(states,actions)

% Must do a trick in order to avoid the selection of the same action when
% two or more actions have the same value
nactions=size(Q,2);

[v idx]    = sort(Q(s,:),'descend');
x          = diff(v);
i          = find(x,1);

if isempty(i)
    a = randi(nactions);
else
    % i is the number of equal elements
    j = randi(i);
    
    % idx(j) is the jth index in sorted idx, thus a=idx(j) some of the best
    % (equal values) actions
    a = idx(j);
end
end