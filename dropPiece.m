function [newBoard] = dropPiece(board, player, column)
%dropPiece attempts to drop a piece into the Connect 4 board.
%Returns the new gameborad with the piece dropped in.
    newBoard = board; % No changes by default.
    
    if column <= 0 || column > size(board, 2);
        % Break on obviously invalid input
        return;
    end
    
	% Make sure the column isn't already full
    if board(1, column) == 0
        % Not full? Ok, now loop from the top to the bottom
        for i = 1:size(board, 1)
            % I want to place the piece in a location where there is either
            % the bottom of the board or another piece below it.
            
            spaceHere = board(i, column);
            if i == size(board, 1) % (hit the bottom of the board)
                spaceNext = 1;
            else
                spaceNext = board(i + 1, column);
            end
            
            % Is this a blank spot & the next space is *not* a blank spot?
            if spaceHere == 0 && spaceNext ~= 0
                %Set the piece on the board
                newBoard(i, column) = player;
                return;
            end
        end
    end
end