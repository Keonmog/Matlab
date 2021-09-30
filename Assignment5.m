%% ASSIGNMENT 5
 % Question 1
 % Question 1
 if z < 5
    w = 2*z
elseif z < 10
    w = 9 - z
elseif z < 100
    w = sqrt(z)
else
    w = z
end
% Then type z = 1 into command window, and see what it says for w

%% Question 2
% Given the if, else statement, see the answer 
if z < 5
    w = 2*z
elseif z < 10
    w = 9 - z
elseif z < 100
    w = sqrt(z)
else
    w = z
end
% Then type z = 9 into command window, and see what it says for w 
% Answer: w = 0

%% Question 3
if z < 5
    w = 2*z
elseif z < 10
    w = 9 - z
elseif z < 100
    w = sqrt(z)
else
    w = z
end
% Then type z = 100 into command window, and see what it says for w 
% Answer : w = 100

%% Question 4
Q=5;
T=2;
if (Q>T | Q>8) & (T<=4)
        R=Q*T;
end

if (T==0 | Q==2 | Q>T) & (T>-5)
        R=4;
end 
% Then type in, R see the result in command window
% Answer: R = 4
%% Question 5
T = 9; 
if T < 30
    h = 2*T + 1;
elseif T < 10
    h = T-2;
else
   h = 0;
end
    % type in h in command window
    % Answer h = 19
    
 %% Question 6
r = 0;
for y=1:2:5
      r=r+3;
end
% type in r into command window, 
% Answer r = 9

%% Question 7
% The while-end loop will complete repetitions



%% Question 8
i=0;
while i<=3
      j=i*4;
      i=i+1;
end
 % type in j , j = 12

%% Question 9
clc
x = [1 2 3 4 5 6 7];
for i=1:7
    fprintf('This is day %d\n', x(i));
end
% X = represent matrix, i represent the for loop lines, write out f print
% use %d to represent exact number, then end statement with x(i) to index i
% within the x matrix mentioned
%% Question 10
clc
x =[ 70 75 72 68 70 71 73 ];
days = {'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'};
for i=1:7
    fprintf('The temperature on %s was %d degrees \n',days{i}, x(i));
end

% Start with the vector of days values to represent the first matrix (x)
% Then do cell array of days to do categorical matrix
% Then do for loop of i = 1:7, to represent 7 days
% Then represent the f print, s to get exact string for days, 
% Then write %d to get exact x value in fprint 
% Then close statement with \n
% then index it with days {i} for first statement, and x(i) for 2nd
%% Question 11
x = [70 75 72 68 70 71 73;
     75 72 71 76 74 73 78];
days = {'Monday','Tuesday','Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'};
for a=1:2
    for b=1:7
        fprintf('The Temperature on %s in City %d is %d Degrees \n',days{b},a,x(a,b));
    end
end

% Start with the X matrices in two different lines, cell array days
% Then make sure a is first so that it repreats from 1 and 2 in that order
% a = 1:2 makes sure all 1-2 all City 1 IS first, then 2 follows after
% make sure you do b


%% Question 12 
x = [70 75 72 68 70 71 73;
     75 72 71 76 74 73 78];
days = {'Monday','Tuesday','Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'};
for b=1:7
    for a=1:2
        fprintf('The Temperature on %s in City %d is %d Degrees \n',days{b},a,x(a,b));
    end
end

%The only thing you have to switch is make sure b = 1:7 first, then put
% a =1:2, to ensure that the numbers monday
 
%% Question 13
tot = input('total number of observations: ');
obs = nan(tot,1);
for j = 1:tot
    obs(j,1) = input('Enter your Observation: ');
    fprintf('The mean up to now is %0.2f and the %dth observation is %0.2f. \n',nanmean(obs),j,obs(j));
end

 %% Question 14
 % Write a matlab function that converts a temperature (in degrees Fahrenheit)
% to the equivalent temperature in degrees Celcius.   
%°C= (°F ? 32) * 5/9. 
% Note: you have to use the function keyword. 
% See Matlab documentation (Links to an external site.) on examples of Matlab functions. 
function C = tempconversion(F) 
C = (F - 32)*5/9 ;
end

 
 %% Question 15

 %76.1 degrees Fahrenheit converts to 24.5 degrees Celcius
%72.5 degrees Fahrenheit converts to 22.5 degrees Celcius
%72.4 degrees Fahrenheit converts to 22.4 degrees Celcius

F = [ 76.1 72.5 72.4 ];
h = tempconversion(F);
for i = 1:3
fprintf('%1.01f degrees Fahrenheit converts to %1.01f degrees Celcius\n',F(i),h(i))
end

 %% Extra Credit #1
 for n = 1:1000
     if mod(n,10)==0 
         fprintf('The current iteration is %d\n',n);
     end
 end
 
 % Start by representing the the values from 1:1000, to represent all the
 % numbers in the sequence of 1-1000
 % Then make sure you denoate an if sequence with mod, so that it keeps in
 % mind every 10 sequence, then utilize fprintf to print out every 10
 % iteration.
 
 %% Extra Credit #2
clc;
n=input('Enter the number:');
a(1)=0;
a(2)=1;
x=3;
while x<=n
    a(x)=a(x-1)+a(x-2);
    x=x+1;
end
    disp(sum(a))
   
 % Start by asking for the input function to input a value
 % Then utilize a forloop that goes until the given value, and establish
 % two equations that represent the fibunnaci sequence sum. Then call for a
 % display command that represents the sum of the given sequence.
 %% % Example terms

   
     

    