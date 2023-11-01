function [total_reward,steps,Q,Model] = Episode( e,maxsteps, Q,Model,... 
alpha,gamma,epsilon,statelist,actionlist,grafic,maze,start,goal,p_steps,...
maze_visited, maze_visited_plot,t,nstates,maxepisodes );

%% INSTRUCTIONS
% maxsteps: the maximum number of steps per episode
% Q: the current QTable
% alpha: the current learning rate
% gamma: the current discount factor
% epsilon: probablity of a random action
% statelist: the list of states
% actionlist: the list of actions

%%
x            = start;
steps        = 0;
total_reward = 0;
% Convert the continous state variables to an index of the statelist
s   = DiscretizeState(x,statelist);
% Selects an action using the epsilon greedy selection strategy
a   = e_greedy_selection(Q,s,epsilon);

%% Loop for each step
for i=1:maxsteps    
    
%  Convert the index of the action into an action value
    action = actionlist(a);    
    
%  Do the selected action and get the next state    
    [posp, penalty]  = DoAction( action , x, maze );    
    xp = posp;
    
%  Observe the reward at state xp and the final state flag
    [r,f]   = GetReward(xp,goal,penalty,maze_visited);
    total_reward = total_reward + r;
    
%  Convert the continous state variables in [xp] to an index of the 
%  statelist and get the next state when xp was performed
    sp  = DiscretizeState(xp,statelist);
    
%  Select action prime
    ap = e_greedy_selection(Q,sp,epsilon);
    
%  Update the Qtable, that is,  learn from the experience
    Q = UpdateQLearning( s, a, r, sp, ap, Q , alpha, gamma );
    
%  Planning 
    Model = UpdateModel(s,a,r,sp,Model);
    Q     = RandomPlanning(Q, Model, p_steps, alpha, gamma);
    
%  Update the current variables
    s = sp;
    a = ap;
    x = xp;
    
%  For maze with visited cells
    %coordinates to set in maze_visited
    xx=x(1);
    yy=x(2);
    maze_visited(xx,yy)=1;
    %coordinates to plot
    xxx=x(1);
    yyy=x(2);
    maze_visited_plot(xxx+1,yyy+1)=1;
    
%  Increment the step counter
    steps=steps+1;
    
%%  PLOTTING
    %  e == which episode would you like to observe
    % delete f and steps condition if you want to obeserve in real time
    
%    if (grafic==true && e==1 && (f==true || steps == maxsteps) ) 
%    figure(1)     
%    Plot(i,x,a,steps,maze,start,goal,['Episode: e='... 
%     num2str(e) ';', ' Step: s=' num2str(i) ';',' X: ' num2str(xx)...
%     ';',' Y: ' num2str(yy) ';'],maze_visited_plot, xxx, yyy,Q,t,nstates);
%    end
%    
%     if (grafic==true && e==2 && (f==true || steps == maxsteps)) 
%    figure(2)     
%    Plot(i,x,a,steps,maze,start,goal,['Episode: e='... 
%     num2str(e) ';', ' Step: s=' num2str(i) ';',' X: ' num2str(xx)...
%     ';',' Y: ' num2str(yy) ';'],maze_visited_plot, xxx, yyy,Q,t,nstates);
%     end
  
%      if (grafic==true && e==3 && (f==true || steps == maxsteps)) 
%    figure(3)    
%    Plot(i,x,a,steps,maze,start,goal,['Episode: e='... 
%     num2str(e) ';', ' Step: s=' num2str(i) ';',' X: ' num2str(xx)...
%     ';',' Y: ' num2str(yy) ';'],maze_visited_plot, xxx, yyy,Q,t,nstates);
%      end
  
%       if (grafic==true && e==4 && (f==true || steps == maxsteps)) 
%    figure(4)    
%    Plot(i,x,a,steps,maze,start,goal,['Episode: e='... 
%     num2str(e) ';', ' Step: s=' num2str(i) ';',' X: ' num2str(xx)...
%     ';',' Y: ' num2str(yy) ';'],maze_visited_plot, xxx, yyy,Q,t,nstates);
%       end
%   
%            if (grafic==true && e==5 && (f==true || steps == maxsteps)) 
%    figure(5)    
%    Plot(i,x,a,steps,maze,start,goal,['Episode: e='... 
%     num2str(e) ';', ' Step: s=' num2str(i) ';',' X: ' num2str(xx)...
%     ';',' Y: ' num2str(yy) ';'],maze_visited_plot, xxx, yyy,Q,t,nstates);
%           end
     
    if (grafic==true && e==20 && (f==true || steps == maxsteps)) 
   figure(1)    
   Plot(i,x,a,steps,maze,start,goal,['Episode: e='... 
    num2str(e) ';', ' Step: s=' num2str(i) ';',' X: ' num2str(xx)...
    ';',' Y: ' num2str(yy) ';'],maze_visited_plot, xxx, yyy,Q,t,nstates);
    end
   
%%  SAVE WORKSPACE
    if (e==maxepisodes) %Save variables when needed
        save('Workspace_lastepisode');
    end
    
%%  BREAK EPISODE
    if (f==true) % If Agent reachs the goal - in GetReward function
        break 
    end
    
end