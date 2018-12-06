function [ bestColumn ] = heckIntelligence(board, player)
%HECKINTELLIGENCE Figure out the best column to drop a piece in.
%   xd
    
%Literally drop randomly
    for i = randperm(size(board, 2))
        if board(1, i) == 0
            bestColumn = i;
            return;
        end
    end
    
    bestColumn = -1;
end

