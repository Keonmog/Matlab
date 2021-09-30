%% Extra Credit Assignment 4 Question 1
%To start out, we are going to make all the matrixes and variables we
%would want to use available to us. We did pos and pos2 to demonstrate the
%positive values we want for the error bar function and neg to demonstrate
%the absent values we want to code so we can get just a upward bar
Y = [ 55 71; ...
      42 67; ...
      40 60; ...
      38 57 ];

E = [ 5 6; ...
      8 7; ...
      9 9; ...
      10 10 ];
  
pos = E(:,1);
pos2 =E(:,2);
neg = [0 0 0 0 ];

%Next we want to visualize the graph by doing the following
b = bar(Y);

%next we want to create the x axis label, the y axis label, the ticks for
%the x axis, legends, and tick labels for the x axis as well

hold on ;

%next we wanted to make sure that the error bar values don't move around,
%so we associate each bar with its endpoints 
xend1 = b(1).XEndPoints;
yend1 = b(1).YEndPoints;
xend2 = b(2).XEndPoints;
yend2 = b(2).YEndPoints;

%next we write the two different error bar. We use the error bar function
%and the corresponding x and Y endpoints, while mentioning to use neg and
%pos values we created so that the error bars dont have the negative error
%bar values but the positive upward error bar. We also specificed er.color
%and linestyle so that there is uniform color trend for the specific error bar of
%the bar graph, and no extra linestyles relating to the error bars.
er = errorbar(xend1,yend1,neg,pos);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

%We do the same for the 2nd bar
er2 = errorbar(xend2,yend2,neg,pos2);    
er2.Color = [0 0 0];                            
er2.LineStyle = 'none'; 

%Now we make sure that the error bars that we both created er and er2 have
%a linedwidth that is dark enough to notice so we use the set function
set (er, 'linewidth', 1.5);
set (er2, 'linewidth', 1.5);

%Now we make sure the colors are corresponded as such, with facecolor as
%blue or red for the specific bar of choice
set (b(1),'Facecolor','blue')
set (b(2), 'Facecolor', 'red')

%Now we make different ticks and labels, and make sure the legend is
%appropriate
xticks (1:4);
xticklabels({'21-30','31-40','41-50','51-60'});
ylabel('performance');
xlabel('age group');
legend({'before training','after training'});

hold on ;


%% Question 2
mu1 = 4;
std1 = 1;
mu2 = 7;
std2 = 1.5;
x = linspace( 0 , 15, 200 );
y1 = normpdf( x , mu1 , std1 );
y2 = normpdf( x , mu2 , std2 );
plot (x,y1)
hold on;
plot (x,y2);
patch1 = patch (x,y1,[ 0.8 0.6 0.6 ]);
patch2 = patch (x,y2, [ 0.5 0.8 0.76]);
xline(4,'--k');
xline(7,'--k');
legend([patch1 patch2],'y1','y2','Location','northeast');
hold off;
alpha(0.6)