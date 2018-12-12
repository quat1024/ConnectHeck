function [ winState ] = checkWinLossState(board)
%CHECKWIN Checks if the game should stop due to 4-in-a-row or full board

    % If the top row of the board is totally full, game over, you all lose!
    if all(board(1,:))
        winState = -1;
        return;
    end
    
    % Check for 4 in a rows
    for p = 1 : 2 
        locs = {};
        % Find horizontals
        locs = [locs, findPatterns(board, [p, p, p, p])];
        
        % Find verticals
        locs = [locs, findPatterns(board, [p; p; p; p])];
        
        %Find diagonals
        locs = [locs, findPatterns(board, [p, -1, -1, -1; -1, p, -1, -1; -1, -1, p, -1; -1, -1, -1, p])];
        locs = [locs, findPatterns(board, [-1, -1, -1, p; -1, -1, p, -1; -1, p, -1, -1; p, -1, -1, -1])];
        
        %If there's a 4-in-a-row, that player won
        if ~isempty(locs)
            winState = p;
            return;
        end
    end
    
    % Guess not
    winState = 0;
end