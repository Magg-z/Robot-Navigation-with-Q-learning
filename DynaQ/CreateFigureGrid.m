function CreateFigureGrid(N,M)
%CREATEFIGURE

%  Auto-generated by MATLAB on 19-Nov-2010 16:49:38

% Create figure
%figure1 = figure('PaperSize',[20.98 29.68]);
figure1 = figure();
% Create axes
axes1 = axes('Parent',figure1,'YTick',0:M,'YGrid','on',...
    'XTick',0:N,...
    'XGrid','on',...
    'XTickLabel',[],...
    'YTickLabel',[],...        
    'Position',[0.1368 0.1153 0.775 0.815],...
    'PlotBoxAspectRatio',[N M 1],...
    'GridLineStyle','-',...
    'DataAspectRatio',[1 1 1]);
% Uncomment the following line to preserve the X-limits of the axes
 xlim(axes1,[0 N]);
% Uncomment the following line to preserve the Y-limits of the axes
 ylim(axes1,[0 M]);
box(axes1,'on');
hold on
text(0.3,0.5,'S','FontName','Courier New');
text(5.3,5.5,'G');