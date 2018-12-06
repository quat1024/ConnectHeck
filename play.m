function [newBoard] = play(board, player, aiControlled)
%PLAY prompts or AI-selects a piece to drop on the board
    boardWidth = size(board, 2);
    boardHeight = size(board, 1);
    
    if aiControlled
        %Do AI stuff i guess
        tic;
        aiColumn = heckIntelligence(board, player);
        
        if aiColumn == -1
            fprintf('AI wasn''t able to figure out where to drop a piece!\n');
            newBoard = board;
        else
            newBoard = dropPiece(board, player, aiColumn);
        end
        
        % Wait at least 1 second for the AI.
        % This helps prevent "oh, the AI was unusually fast"
        % from becoming a hint on its own. It also makes for a more
        % consistent experience.
        elapsedTime = toc;
        if elapsedTime < 1
            pause(1 - elapsedTime);
        end
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
        
        % Ok they have selected a column, let's drop the piece in.
        newBoard = dropPiece(board, player, column);
    end
end

