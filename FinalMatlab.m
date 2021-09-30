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
 
%now we're taking the n^2 number, the highest number, and turning it into NaN
reposition = (puzzle ==n^2) ;
puzzle(reposition) = 0;
 
solvedpuzzle = (1:n^2);
solvedpuzzle = reshape(solvedpuzzle.', n,n).' ;
spadjust = (solvedpuzzle ==n^2) ;
solvedpuzzle(spadjust) = 0;
solvedpuzzle(solvedpuzzle == 0) = []
%while the puzzle is unsolved/wrong, it asks for a guess that is 'm'
all_correct = 0; %start the all_correct variable to start the while loop
while all_correct==0 
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
        if num_correct==n^2
            all_correct = 1;
            break;
        end
   % display and print the correct and display function
   fprintf('Current board:(#correct = %d)',num_correct) %display the number correct
   display(puzzle) %display the puzzle board at each instance of i
   % Establish the move after each loop
   m = input('What is your move?(Press enter to quit, 0 represents the empty space): '); %have a move function with opt to exist
   if m == [] % if the user inputs 0 for move, then it quits the puzzle
       fprintf('You have quit the puzzle \n') %Print out that the function is done
       break; %end out of the if loop
   end
        [m_a , m_b] = find(puzzle == m); %move on the board corresponds to move coordinates
        [n_a , n_b] = find(puzzle == 0); %get the NaN part of the puzzle of the puzzle and move it accordingly
   
    
% Establish movements these allow for movement in one direction 
        one = [n_a + 1 , n_b];
        two = [n_a - 1 , n_b];
        three = [n_a , n_b + 1];
        four = [n_a , n_b - 1];
 
    %if input allowed according to the variables above, then it'll let it
        if [m_a , m_b] == one | [m_a, m_b] == two | [m_a, m_b] == three | [m_a, m_b] == four
            validInput = true;
            
    %if not, then it'll ask you to try again
        else
            fprintf('Invalid input, please try again \n');
        end
    end
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
disp(solvedpuzzle) %display the right puzzle
fprintf('You have finished your puzzle\n'); %when the loop ends it gives your total loop
 
 
