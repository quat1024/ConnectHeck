function [ bestColumn, score ] = heckIntelligence(board, player, scoringPlayer, recurse)
%HECKINTELLIGENCE Figure out the best column to drop a piece in.
%   xd
    
    % The ID of the other player.
    otherPlayer = 1 - player + 2;
    
    boardWidth = size(board, 2);
    
    scores = zeros(boardWidth, 1);
    
    bestColumn = -1;
    
    % Try dropping a piece in every column.
    for i = 1 : boardWidth
        newBoard = dropPiece(board, player, i);
        score = 0;
        if isequal(board, newBoard)
            % Weight againt do-nothing moves lol
            score = -100000;
        else
            score = heckIntelligenceScore(newBoard, scoringPlayer);
            if score > 1000
                % This position is great. Don't bother searching deeper
                bestColumn = i;
                return;
            end
            
            if score < -1000
                % This position is awful. Don't bother searching deeper
                bestColumn = -1;
                return;
            end
            
            if (checkWinLossState(board) ~= -1) && (recurse >= 1)
                [~, otherScore] = heckIntelligence(newBoard, otherPlayer, player, recurse - 1);
                score = (score + otherScore) / 2;
            end
        end
        
        scores(i) = score;
    end
    
    if recurse == 4
        for i = scores
            fprintf('%.0f ', i);
        end
    end
    
    bestScore = -999999;
    for i = randperm(boardWidth)
        if scores(i) > bestScore
            bestColumn = i;
            bestScore = scores(i);
        end
    end
end

