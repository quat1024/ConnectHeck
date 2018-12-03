function drawBoard(board, player)
%drawBoard draws a Connect 4 gameboard to the console
    fprintf('\n');
    width = size(board, 2);
    height = size(board, 1);
    
    % Header
    fprintf('\nPLAYER %.0f''s TURN:\n', player);
    
    % Column markers
    for row = 1 : width
        fprintf('%.0f', row)
    end
    
    fprintf('\n');
    
    % The board itself
    for row = 1 : height
        for col = 1 : width
            at = board(row,col);
            c = ''''; %A single ' character lol
            if at == 1
                c = 'x';
            elseif at == 2
                c = 'o';
            end
            
            fprintf('%s', c);
        end
        fprintf('\n');
    end
    
    % A horizontal line
    fprintf(repmat('-', width, 1));
    
    % And a newline
    fprintf('\n');
end

