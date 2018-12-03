function [newBoard] = dropPiece(board, player, column)
%dropPiece attempts to drop a piece into the Connect 4 board.
%Returns the new gameborad with the piece dropped in.

    % Assume failiure
    newBoard = board;
    
    if board(1, column) ~= 0
        % This column is full!
        return;
    else
        % Loop from the top to the bottom
        for i = 1:size(board, 1)
            % The space right here
            spaceHere = board(i, column);
            % Figure out what is in the next space
            if i == size(board, 1)
                spaceNext = 1;
            else
                spaceNext = board(i + 1, column);
            end
            
            % Is this a blank spot & the next space is not a blank spot?
            if spaceHere == 0 && spaceNext ~= 0
                %Set the piece on the board
                newBoard(i, column) = player;
                break;
            end
        end
    end
end