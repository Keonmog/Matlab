validInput = false; %Establish the ValidInput = false function for the while loop
n = 1; % Sets n equal to 1 so that the 'while' loop will begin
while n <= 2
    % Looks to see if n is less than or equal to 2
    % If YES, the loop starts
    % If NO (meaning n is greater than 2), the program continues 
    n = input ('What is size of puzzle?: ');
    % Asks for the size of the puzzle
end
 
%random number generator with (1 to n^2 as the range, n^2 as total numbers)
puzzle = randperm(n^2,n^2);
 
%reshaping the RNG into a matrix of (n x n)
puzzle = reshape(puzzle,[n,n]);
 
%now we're taking the n^2 number, the highest number and leaving it at 0
reposition = (puzzle ==n^2) ;
puzzle(reposition) = 0;
 
%while the puzzle is unsolved/wrong, it asks for a guess that is 'm'
all_correct = 0; %start the all_correct variable to start the while loop
while all_correct==0 % establish a while loop where the loop keeps going if its not correct
    while validInput == false % to contain the original statement above
        p=reshape(puzzle,[1,n^2]); % labeling a value p to reshape the puzzle
        p(isnan(p)) = 0; %make sure that it reorganizes NaN as 0
        correct_puzzle = [(1:n^2-1) 0]; %establish the correct_puzzle matrix
        g = reshape(correct_puzzle.',n,n).' ; %Establish the reshape version of it
        num_correct = 0; % start off with a starting point
        for i = 1:length(p) % establish the length of the reshape function and 1 for i
            if p(i) == g(i) % equal them to each other to count the num_Correct
                num_correct = num_correct + 1 ; %have the num_Correct add by the total found each time
                % Using an if loop within an if loop, and to signify that
                % the task is completed
            else
                continue
            end  
        end
     %if num_correct equals n^2-1 then we can break the entire function
     %when its all correct
        if num_correct==n^2
            all_correct = 1;
            break;
        end
   % display and print the correct and display function
   fprintf('Current board:(#correct = %d)\n',num_correct) %display the number correct
   for row = 1 : n %this for loop leaves a blank space where a 0 or NaN would normally be (row aspect)
       for col = 1 : n %this for loop is for the column part to leave the space blank
           if (puzzle(row, col) == 0)
               fprintf(' %5s', ""); %prints the blank space where a 0 would normally be in the puzzle
           else
               fprintf(' %5d', puzzle(row, col)); %prints the normal number if the value is not a 0
           end
       end
       fprintf("\n");
   end
  
   m = input('What is your move?(Press 0 to quit): '); %have a move function with opt to exist
   if (m == 0) % if the user inputs 0 for move, then it quits the puzzle
       fprintf('You have quit the puzzle \n') %Print out that the function is done
       return; %end out of the if loop
   end
        [m_a , m_b] = find(puzzle == m); %move on the board corresponds to move coordinates
        [n_a , n_b] = find(puzzle == 0); %get the NaN part of the puzzle of the puzzle and move it accordingly
   
    
% Establish movements these allow for movement in one direction 
        one = [n_a + 1 , n_b];
        two = [n_a - 1 , n_b];
        three = [n_a , n_b + 1];
        four = [n_a , n_b - 1];
 
    %if input allowed according to the variables above, then it'll let it
        if all([m_a , m_b] == one) || all([m_a, m_b] == two) || all([m_a, m_b] == three) || all([m_a, m_b] == four)
            validInput = true; %USING the || helps separate the value moves
    %if not, then it'll ask you to try again
        else
            fprintf('Invalid input, please try again \n');
        end
    end
 % this accounts for the moves in relation to move and 0 value, which we
 % replace with blank later on
    [m_a , m_b] = find(puzzle == m); %make sure it accounts for the new moves 
    [n_a , n_b] = find(puzzle == 0); %make sure it accounts for NaN
    
%Account for adjusted puzzle with the moves/new inputs in mind 
    newpuzzle = puzzle; 
    newpuzzle(m_a,m_b) = puzzle(n_a,n_b); 
    newpuzzle(n_a,n_b) = puzzle(m_a,m_b);
    puzzle = newpuzzle;
   
%puts the reiteration back into neutral state
    validInput = false;
end
%disp(solvedpuzzle) %display the right puzzle
fprintf('You have finished your puzzle\n'); %when the loop ends it gives your total loop

% Worked with Deena Afana, Brian Damavandi, Alek Marantz, Enrique Ramirez,
% Hamilton Wall,  Michelle Ke, Shayna Farajzadeh