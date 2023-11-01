function [ r,f] = GetReward( pos,goal,penalty,maze_visited )
% GetReward returns the reward at the current state
% x: a vector of position and velocity of the robot
% r: the returned reward.
% f: true if the robot reached the goal, otherwise f is false

if  (pos==goal) 
	r = 5;
    f = true;

elseif (penalty==1) %when hitting the wall
    r = -0.1;
    f = false;
 
elseif (maze_visited(pos)==1) %when going to already visited cell
    r = -0.005;
    f= false;

else
    r = -0.01;
    f = false;
 
end
