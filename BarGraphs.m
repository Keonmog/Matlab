%BarGraphs
Y = [ 55 71; ...
      42 67;...
      40 60;...
      38 57 ];
 %Suppose we have data organized in matrix
 %Performance in before, and after training
 %Want to visual performance levels with bar graph
 bar (Y(:,1), 'r')
 % r ,makes it red. 
 % want to visualize both data series in bar graphs
 
 clf
 bar (Y)
 %Matlab visualizes first column and second column, and gives different
 %columns to different data series
 %want to give column extra labels
 xticks (1:4);
 xticklabels({'21-30', '31-40', '41-50', '51-60'});
 %Ticks exactly at 1-4, labels instead of arbitrary of 1-4
 legend({'before training','after training'});
 xlabel ('performance');
 %to change this make bar (Y) into bar(h) to make it horizontally
 clf
 barh (Y);
 yticks (1:4);
 yticklabels({'21-30','31-40','41-50','51-60'});
 xlabel('performance');
 ylabel('age group');
 legend({'before training','after training'});
 
 %Make some changes to the y-ticks, now want labels to be organized
 %vertically. 
 
 %Say you want to combine bar graph with some matlab plot
 
 clf
 figure(1);clf;
 bar(Y(:,1));
 xticks(1:4);
 xticklabels({'21-30','31-40','41-50','51-60'});
 xlabel('age group');
 ylabel('performance');
 
 hold on;
%single data series, want to add error bars, suppose I have some data.
e1 = [5 8 9 10]
h = errorbar( 1:4, Y(:,1), e1, 'ko');
set (h, 'linewidth', 1.5);
%hold on function between two graphs
