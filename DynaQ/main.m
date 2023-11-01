%%
%   Main code built for 'Mountain Car problem' by:
%   Jose Antonio Martin H. <jamartinh@fdi.ucm.es>

%   Modified for student project 'Reinforcement learning-based mobile 
%   robot navigation using Q-learning.'  by:
%   Magdalena Falkowska <falkowska.madzia@gmail.com>

%   Code goes for Dyna-Q algorithm
%%
clear all
clc
close all

MazeDemo(20);

load Workspace_lastepisode.mat; %load workspace from last episode
