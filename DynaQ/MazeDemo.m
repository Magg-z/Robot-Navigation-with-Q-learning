function  MazeDemo( maxepisodes )
%% INSTRUCTIONS
%   How to make a black and white image from photos is described in ... 
%   file.

%   Comment/Uncomment sections if needed.

%   Your image will be rotated, because x and y coordinates are starting 
%   from 1'st column and 1'st line of an array, your maze should have 
%   boundaries around a map made from ones, any obstacles also with ones.

%   To set start and goal: 
%   1. Load your maze in command line and rotate it using load and imrotate
%   below.
%   2. Look into your maze variable and choose start/goal from zero cells
%   3. Your start/goal is numbered without the border so it will be
%   start=(start-1) and goal=(goal-1).

maxsteps    = 0;  
alpha       = 0;  
gamma       = 0;  
epsilon     = 0;
 
%% Image1
% load mazetest2.mat;
% maze = imrotate(maze,-90);
% start = [1 1];
% goal = [8 8];
% 
% %parameters for mazetest2
% maxsteps    = 500;  % maximum number of steps per episode
% alpha       = 0.95;   % learning rate
% gamma       = 0.85;  % discount factor
% epsilon     = 0.001;   % probability of a random action selection

%% Image2
% comparison_image= imread('comparison_image.png');
% comparison_image= ~comparison_image;
% maze = comparison_image;
% 
% start = [1 19];
% goal = [23 7];

%load comparison_bestparameters.mat
% maxsteps    = 5000;    % maximum number of steps per episode
% alpha       = 0.95;    % learning rate
% gamma       = 0.85;    % discount factor
% epsilon     = 0.001;  % probability of a random action selection

%% Image3

[maze N M]= CreateMaze();
maze = imrotate(maze,-90);
 start = [3 1];
 goal = [29 27];

% %parameters for bw
maxsteps    = 5000;  % maximum number of steps per episode
alpha       = 0.95;   % learning rate
gamma       = 0.55;  % discount factor
epsilon     = 0.1;   % probability of a random action selection

%% For all
[N M] = size(maze);%N- rows, M-collumns

maze_visited      = maze; %This matrix is for setting visited cells
maze_visited_plot = zeros(N,M); %This one is for plotting visited cells

statelist   = BuildStateList(N,M);  % the list of states
actionlist  = BuildActionList(); % the list of actions

nstates     = size(statelist,1);
nactions    = size(actionlist,1);

%Generate initial Population
Q           = BuildQTable(nstates,nactions ); % the Qtable  
Model       = BuildModel(nstates,nactions ); % the Qtable  

% planning steps
p_steps     = 1000;

% t is for plotting the Q-table
t=1:nstates;

grafica    = false; % set off if don't need plotting, 
                    % but you can set an episode to watch 
                    % before plot function in Episode.m)
grafica    = true;

%% Main episodes loop
for i=1:maxepisodes    
    
    [total_reward,steps,Q,Model]= Episode( i,maxsteps, Q, Model , alpha,... 
    gamma,epsilon,statelist,actionlist,grafica,maze,start,goal,p_steps,...
    maze_visited,maze_visited_plot,t,nstates,maxepisodes) ; 
    
    disp(['Episode: ',int2str(i),'  Steps:',int2str(steps),...
    '  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon),... 
    ' alpha: ',num2str(alpha), ' gamma: ', num2str(gamma)])
    
    
end