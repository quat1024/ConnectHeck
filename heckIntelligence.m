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
        % 'score' is a sort of weight.
        % Good board positions equal a higher score. Bad positions, lower.
        % The AI will pick a random move with the highest score and play
        % it.
        % How to define "good" and "bad" positions? Lots of patterns. See
        % 'heckIntelligenceScore.m'.
        score = 0;
        if isequal(board, newBoard)
            % Don't do moves that do nothing.
            score = -100000;
        else
            % Come up with a base point score for this board
            score = heckIntelligenceScore(newBoard, scoringPlayer);
            
            % Factor in possible future moves into this board's score
            if (checkWinLossState(board) ~= -1) && (recurse >= 1)
                [~, otherScore] = heckIntelligence(newBoard, otherPlayer, player, recurse - 1);
                score = (score + otherScore) / 2;
            end
        end
        
        scores(i) = score;
    end
    
    % Decide on the best column to drop a piece.
    % Randomly order the columns before doing so.
    % This means that e.g. at the start of the game where all moves
    % are equally worthless, a random column will be chosen.
    bestScore = -999999;
    for i = randperm(boardWidth)
        if scores(i) > bestScore
            bestColumn = i;
            bestScore = scores(i);
        end
    end
end

