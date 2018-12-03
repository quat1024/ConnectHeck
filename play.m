function [newBoard] = play(board, player, aiControlled)
%PLAY prompts or AI-selects a piece to drop on the board
    boardWidth = size(board, 2);
    boardHeight = size(board, 1);
    
    if aiControlled
        %Do AI stuff i guess
        newBoard = dropPiece(board, player, 2);
        
        % Sleep...?
        % This makes it feel a lot better to play against AI. Idk.
        % Player 2's board doesn't fly past at warp speed
        pause(1);
    else
        column = -1;
        % Prompt the player for a column to drop a piece in
        % And do some basic sanity checking to it as well
        while true
            column = input(sprintf('Player %.0f, what column? ', player));
            if isempty(column)
                fprintf('Sorry, couldn''t hear you, come again?\n')
            elseif column ~= round(column, 0)
                fprintf('Enter a whole number lol\n')
            elseif column < 1 || column > boardWidth
                fprintf('Enter a number between 1 and %.0f, please\n', boardWidth)
            elseif board(1, column) ~= 0
                fprintf('That column is already full of pieces!\n');
            else
                break;
            end
        end
        
        newBoard = dropPiece(board, player, column);
    end
end

