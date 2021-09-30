%ASSIGNMENT 3


%% Question 1 : Suppose we do an experiment where we keep track of response times and accuracy. 
%We stored information about 4 trials in the following structure: 
%Give the Matlab command to find the response times of all accurate trials.
SubjectTest.ResponseTimes=[ 1.2 0.5 4 5 ];
SubjectTest.Accuracy=[ 1 0 1 1  ];

%want to index accurate times of subjecttest.accuracy and correspond it
%with the specific response times. so you write subjecttest.accurracy ==1
%to demonstrate all values equal to one, then you put it in paranthesis
%relating to subjecttest.responsetimes
SubjectTest.ResponseTimes (SubjectTest.Accuracy == 1)

%% Question 2 : Suppose Age is the following vector 
Age = [ 18  25  -1  22  32  -1 ]
%Give the matlab command(s) that change all the -1 values in Age to NaN. 
% write the expression (Age == -1) to signify all the -1 values, then use
% Age (index) = [NaN] to signify they should change
Age (Age == -1) = NaN

%% QUESTION 3: 
%Suppose Age is the following vector: 
Age = [ 18 25 NaN 22 32 NaN ]
% Write the Matlab command that counts the number of missing values 
%represented by the value NaN. 
%Hint: look up  the functions sum and isnan
%We do the isnan function to give the logical array of what values in the
%array where NaN
%Then we used sum to add up everything inthe array.
sum(isnan(Age))

%% Question 4

% Suppose Age is the following vector: [ 18 25 NaN 22 32 NaN ].
Age = [18 25 NaN 22 32 NaN]
% Write the Matlab command that calculates the mean age value
% excluding the missing values represented by the value NaN. 
% There are a number of ways of doing this.
% to do mean age, we write the function mean (Age). However to specify not
% to count the NaN values you do the function nanmean (Age)
nanmean(Age)

%% Question 5
%Suppose we have the following cell arrays that store the 
%names and gender of subjects who participated in an experiment:

Names  = { 'Amy' , 'Chris' , 'John' , 'Karin' , 'Juan' };
Gender = { 'Female' , 'Male' , 'Male' , 'Female' , 'Male' };
%Suppose the experiment also measures response times for a number of trials. 
%We store this information in the following matrix where each column corresponds to a person and each row corresponds to a trial in the experiment:

ResponseTimes = [ 2.4 2.2 2.9 2.7 2.7;  1.6 1.7 1.9 1.5 1.0; 2.1 2.2 0.9 2.5 1.9; 1.7 2.4 1.6 2.1 1.4 ];

%Give the Matlab command that lists all male names.
%Hint: look up the strcmp function.
% you want to do strcmp (Gender, 'Male') to look up all the functions that
% give the male array, and then group it with names
Names(strcmp(Gender,'Male'))

%% Question 6
%Write a single line of Matlab code (i.e., without any semicolons) 
%that calculates the mean response times for each person

%Each column of the trial specifies each name, therefore we will find the
%column means of each column of the trial. From left to right, each column
%represents the how the names are listed in order within the names array.
columnMeans = mean(ResponseTimes, 1)

%% Question 7
%Since Each Trial is represented as each row, 
%you read each trial by the row mean value it is presented. 
%For example, First mean value of first row is = 2.5800,
%mean of Trial 1 is 2.5800. 
meanrow_ResponseTimes = mean (ResponseTimes')

%% Question 8
%Write a single line of Matlab code
%(i.e., without any semicolons) that lists the mean response times for 
%all Male subjects in the experiment.
mean (ResponseTimes(:,strcmp(Gender,'Male')))

%% Question 9
%Write a single line of Matlab code (i.e., without any semicolons) that
%lists all names of subjects who have at least one trial with a response time value larger than 2.5. There are multiple ways of doing this but it might help to look up the documentation for the any function. 
%First we must specify ResponseTimes that were greater than 2.5 as (ResponseTimes > 2.5). 
%Then you must use the any function to specify if there was at least one trial that
%had a responsetime that was greater 2.5 any (ResponseTimes >2.5) 
%Then you must group the index with the Names function to demonstrate which
%names responded to this index.
Names (any(ResponseTimes > 2.5))

