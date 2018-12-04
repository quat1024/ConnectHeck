function printBoard(board, player)
%drawBoard prints a Connect 4 gameboard to the console
    fprintf('\n');
    width = size(board, 2);
    height = size(board, 1);
    
    % Turn header.
    fprintf('\nPLAYER %.0f''s TURN:\n', player);
    
    % Column markers.
    for row = 1 : width
        fprintf('%.0f', row)
    end
    
    fprintf('\n');
    
    % The board itself!
    for row = 1 : height
        for col = 1 : width
            % The number at this space on the game board.
            at = board(row,col);
            
            % Now, let's choose a character to represent it.
            % Players will be X and O, and blank spaces will be represented
            % by an apostrophe.
            
            c = '''';
            if at == 1 % player 1
                c = 'X';
            elseif at == 2 % player 2.
                c = 'O';
            end
            
            % And print the character.
            fprintf('%s', c);
        end
        % All done printing this row so let's print a newline,
        % to correspond to moving down to the next row of the game board.
        fprintf('\n');
    end
    
    % A horizontal line to represent the bottom of the game board.
    fprintf(repmat('-', width, 1));
    
    % And fianlly, a newline.
    fprintf('\n');
end

