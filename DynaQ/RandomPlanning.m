function Q = RandomPlanning(Q, Model, steps, alpha, gamma )

% states and actions for wich there is a learned model, i.e. previously
% visited state and previously actions taken in states.
[s_list a_list] = find(Model(:,:,1));

for j=1:steps
    %random index over s_list
    i = randi(numel(s_list));

    % random previously visited state
    s = s_list(i);
    % random action previously taken at state s
    a = a_list(i);

    sp  = Model(s,a,1);    
    r   = Model(s,a,2);    
    
    Q      = UpdateQLearning( s, a, r, sp, [], Q , alpha, gamma );
    
end
end