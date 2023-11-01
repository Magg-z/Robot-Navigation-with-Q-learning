function Plot(~, x,~,~,maze,start,goal, ptitle, maze_visited_plot, xxx,...
yyy,Q,t,nstates)

[N M] = size(maze);
agentsize= 5;
mazesize= 6;

%% Main maze with Agent only
subplot(2,3,1);

    %% Maze 
    [mx my] = find(maze);
    plot(mx-0.5,my-0.5,'s','MarkerEdgeColor', '#29292a' ,'MarkerFaceColor',...
    '#535353','MarkerSize',mazesize);

    hold on;
    
    % All below is drawed on top
    % Create axes
    set(gca,'YTick',0:M,'YGrid','on',...
        'XTick',0:N,...
        'XGrid','on',...
        'XTickLabel',[],...
        'YTickLabel',[],...
        'PlotBoxAspectRatio',[N M 1],...
        'GridLineStyle','-',... 
        'GridColor','#000000',... 
        'DataAspectRatio',[1 1 1]);
    xlim(gca,[0 N]);
    ylim(gca,[0 M]);
    box(gca,'on');

    % Start and Goal
    text(start(1)+0.3,start(2)+0.5,'S','FontName','Courier New');
    text(goal(1)+0.3,goal(2)+0.5,'G','FontName','Courier New');

    %% Agent
    plot(x(1)+0.5,x(2)+0.5,'sk','MarkerFaceColor','k','MarkerSize',...
    agentsize);
    title(ptitle);

    hold off;

%% Maze for showing path
subplot(2,3,2);

    %% Maze part
    [mmx mmy] = find(maze);
    plot(mmx-0.5,mmy-0.5,'s','MarkerEdgeColor', '#29292a' ,'MarkerFaceColor',...
    ' #535353 ','MarkerSize',mazesize);
    hold on
    [mx my] = find(maze_visited_plot);
    plot(mx-0.5,my-0.5,'s','MarkerEdgeColor', '#d35400' ,'MarkerFaceColor',...
    ' #f39c12 ','MarkerSize',mazesize);

  
    %%
    % Create axes
    set(gca,'YTick',0:M,'YGrid','on',...
        'XTick',0:N,...
        'XGrid','on',...
        'XTickLabel',[],...
        'YTickLabel',[],...
        'PlotBoxAspectRatio',[N M 1],...
        'GridLineStyle','-',... 
        'GridColor','#000000',...
        'DataAspectRatio',[1 1 1]);
    xlim(gca,[0 N]);
    ylim(gca,[0 M]);
    box(gca,'on');

    % Start and Goal
    text(start(1)+0.3,start(2)+0.5,'S','FontName','Courier New');
    text(goal(1)+0.3,goal(2)+0.5,'G','FontName','Courier New');

    %% Agent part
    plot(x(1)+0.5,x(2)+0.5,'sk','MarkerFaceColor','k','MarkerSize',...
    agentsize);
    title(ptitle);
 
    hold off

%% Q-table visualized
    subplot(2,3,[4,5])
    
    %%
for gg = 1:nstates 
    Up(gg) = Q(gg,1);
    Down(gg)= Q(gg,3);
    Right(gg)= Q(gg,2);
    Left(gg)= Q(gg,4);
end
    plot(t,Up,t,Down,t,Right,t,Left);
    title('Q table for all actions');
    legend({'Up','Down','Right','Left'},'Location','northwest');
    xlabel('states');
    ylabel('reward');
    xlim([0 nstates])
    ylim([-0.5 5])
drawnow;
