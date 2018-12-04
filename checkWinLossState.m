function [ winState ] = checkWinLossState(board)
%CHECKWIN Checks if the game should stop due to 4-in-a-row or full board

    % If the top row of the board is totally full, game over, you all lose!
    if all(board(1,:))
        winState = -1;
        return;
    end
    
    % TODO: stufffffff
    
    winState = 0;
end

function [winningPlayer] = checkRuns(board, offsetRow, offsetCol, runLength)
    hasRun = false;
    
    
end
