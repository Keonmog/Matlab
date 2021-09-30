% Step 1 ID NUMBER INPUT
ID = input('What is your ID number: ');
% This is to establish the ID number of the user <--- STEP 1
 
% Step 2 Establish number of trial loop
n = input('what is your number of trials: ');
while mod(n,2)==1
   n = input('what is your number of trials (must be even): ');
end
% first asking for the input of n for number of trials
% We also use a mod function to make sure it's even
% if not even function doesn't work
 
% Step 3 & Step 4 Random Permutation 
% allocate n/2 signal events and n/2 noise events to the n trials 
% and Also randomization should be for each ID
rng(ID) ;
% Using rng to make sure it saves the ID seed every time even after restart
conditions = [ones(1,n/2) zeros(1,n/2)];
% conditions represents an array with half 0s and half 1s distributed even
r = randperm (n);
% randperm randomly n; scrambles 0s and 1s
conditions = conditions (r);
% represent 'conditions' variable now as scrambled values of 0s and 1s
Is_Correct = zeros(1,n); % Is Correct represents stored user inputs and is 1 if they got it correct or 0 if wrong
 
% Step 5 and 6 Generate Signal or Noise Trial With Response Feedback
for i=1:n
    condition = conditions(i);
    if condition == 1
    sr=44100; %sample rate in Hz
    f1=normrnd(1100, 100); %frequency in Hz #1
    f2=normrnd(1100, 100); %frequency in Hz #2
    f3=normrnd(1100, 100); %frequency in Hz #3
    f4=normrnd(1100, 100); %frequency in Hz #4
    d=.05; %duration
    t=linspace(0, d, sr*d); %time vector
    tone1=sin(2*pi*f1*t); %actual, final tone for sound #1. sin gives pure tone.
    tone2=sin(2*pi*f2*t); %actual, final tone for sound #2. sin gives pure tone.
    tone3=sin(2*pi*f3*t); %actual, final tone for sound #3. sin gives pure tone.
    tone4=sin(2*pi*f4*t); %actual, final tone for sound #4. sin gives pure tone.
    sound([tone1 tone2 tone3 tone4], sr); %converts matrix of data into output of sound
    pause (0.05) %pauses sound for 50 milliseconds
    end 
if condition == 0
    sr=44100; %sample rate in Hz
    f1=normrnd(1000, 10); %frequency in Hz #1
    f2=normrnd(1000, 10); %frequency in Hz #2
    f3=normrnd(1000, 10); %frequency in Hz #3
    f4=normrnd(1000, 10); %frequency in Hz #4
    d=.05; %duration
    t=linspace(0, d, sr*d); %time vector
    tone1=sin(2*pi*f1*t); %actual, final tone for sound #1. sin gives pure tone.
    tone2=sin(2*pi*f2*t); %actual, final tone for sound #2. sin gives pure tone.
    tone3=sin(2*pi*f3*t); %actual, final tone for sound #3. sin gives pure tone.
    tone4=sin(2*pi*f4*t); %actual, final tone for sound #4. sin gives pure tone.
    sound([tone1 tone2 tone3 tone4], sr); %converts matrix of data into output of sound
    pause (0.05); %pauses sound for 50 milliseconds
end
 
x = input('What did you hear? (1 = signal and 0 = noise): '); %requests user input in response to sound tones
Guesses(i) = x; %creates a vector in the workspace which displays the guesses made by the user
if condition ==x 
    fprintf ('Correct!\n')
    Is_Correct(i) = 1; % indicates whether the user inputted the correct value or not
else
    fprintf ('Incorrect!\n') % outputs the string "Incorrect!" if the user answered incorrectly
end
end
 
% Step 7 Calculating Probability of Hit, False Alarm, Sensitivity, and Beta
Hit = mean(Is_Correct(conditions==1)); %probability of hit based off only signal was given to user
% conditions array = noise or signal user input; is correct did the user get it right or not
% We filtered Is_Correct to user inputs only given trials where signal was
% provided to user. What we know because we filtered where signal was
% given, if user got it correct that means they gave a signal when signal
% was provided
False_Alarm = 1- mean(Is_Correct(conditions==0)); %probability of user saying signal when noise was provided
%  When we take 1 - mean of is correct of conditions =0, that mean for all
%  the user answers, when the system provided a noise, we wanted to know
%  that average. What is the average that the user got it correct when it
%  provided noise, that average is saying that the user provided a noise
%  correctly when noise was provided. However, not we're looking for. Thats
%  just the inverse of percentage of what we correct. When we didnt provide
%  noise we provided signal so we subtract. 
% Calculate numerator and denominator. 
 
% We retrieve conditions at i position in respect to even distribute & rng
 
%Solving D' when observed hit or false alarm is 0 or 1:
if Hit == 0
    Hit = 0.01 ;
end 
if Hit == 1
    Hit = 0.99;
end
if False_Alarm == 1
    False_Alarm = 0.99 ;
end
if False_Alarm == 0
    False_Alarm = 0.01;
end
% we set an if statement that if Hit == 0, it reports back an input of 0.01
% we did another one where False_Alarm == 1, False_Alarm = 0.99
zHit = -sqrt(2)*erfcinv(2*Hit) ;
zFA = -sqrt(2)*erfcinv(2*False_Alarm) ;
 
d = zHit-zFA ; 
% d' is found by subtracting the z score corresponding to false alarm
% proportion from the z score with hit proportion. 
 
Beta= exp((norminv(Hit)^2 - norminv(False_Alarm)^2)/2); %Beta is calculated from this value
% most-used index for estimating the subject's bias
 
dprime = norminv(Hit)-norminv(False_Alarm); %To get D prime, we want to use these values
 
% Step 8 Display the Performance Numbers to the User
Hit_Value = ['Hit: ',num2str(Hit)]; %Create a vector to display the Hit Value
disp(Hit_Value) % Display the Hit Value as an expression, to give output of Hit
 
False_Alarm_Value = ['False_Alarm: ',num2str(False_Alarm)]; %Create a vector to display the Hit Value as an expression
disp(False_Alarm_Value) % Display the False Alarm Value as an expression, to give output of False Alarm
 
dprime_Value = ['Sensitivity (dprime): ',num2str(dprime)]; %Create a vector to display the D prime values as an expression
disp(dprime_Value) % Display the D Prime Values Value as an expression, to give output of False Alarm
 
Beta_Value = ['Beta (bias) index: ',num2str(Beta)]; %Create a vector to display the D prime values as an expression
disp(Beta_Value) % Display the D Prime Values Value as an expression, to give output of False
 
% Step 9 Save the Matlab File under USER ID NAME
 
filenm = sprintf('%d.mat',ID); % Create filename, to contain ID number of User
% use sprintf to make formatted string, using %d fixed number with ID,
% followed by .mat followed up extension. 
save(filenm,'ID','n','Hit','False_Alarm','dprime','Is_Correct','conditions','Guesses','Beta')
% Can go in command window to load('1111.mat') and then whos and get list
% Ensures that the data is stored with the file name being the Student ID

% Worked with Deena Afana, Hamilton Wall, Brian Damavandi, Alek Marantz,
% Enrique Ramirez, Michelle Ke, and Shayna Farajzadeh