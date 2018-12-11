function [ winState ] = checkWinLossState(board)
%CHECKWIN Checks if the game should stop due to 4-in-a-row or full board

    % If the top row of the board is totally full, game over, you all lose!
    if all(board(1,:))
        winState = -1;
        %return;
    end
    
    locs = {};
    locs = [locs, findPatterns(board, [1, 1, 1, 1])];
    locs = [locs, findPatterns(board, [1; 1; 1; 1])];
    locs = [locs, findPatterns(board, [1, -1, -1, -1; -1, 1, -1, -1; -1, -1, 1, -1; -1, -1, -1, 1])];
    locs = [locs, findPatterns(board, [-1, -1, -1, 1; -1, -1, 1, -1; -1, 1, -1, -1; 1, -1, -1, -1])];
    
    fprintf('Found wins: %.0f', length(locs));
    
    for x = locs
        coords = x{1};
       % fprintf('Winrar at %.0f %.0f\n', coords(1), coords(2));
    end
    
    winState = 0;
end