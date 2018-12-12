function [score] = heckIntelligenceScore(board, player)
%heckIntelligenceScore attempts to "score" a position.
%The idea is that high-scoring positions are more desireable, and the AI should
%try to obtain these positions.
    
    score = 0;
    otherPlayer = 1 - player + 2;
    
    % Give big weight to winning or losing.
    winState = checkWinLossState(board);
    if winState == player
        score = score + 1000000;
    elseif winState == otherPlayer
        score = score - 1000000;
    end
    
    % Give weight to creating runs of 3 of the right color
    for p = 1 : 2
        runs = {};
        runs = [runs, findPatterns(board, [p, p, p, 0])];
        runs = [runs, findPatterns(board, [p, p, 0, p])];
        runs = [runs, findPatterns(board, [p, 0, p, p])];
        runs = [runs, findPatterns(board, [0, p, p, p])];
        runs = [runs, findPatterns(board, [p; p; p; 0])];
        runs = [runs, findPatterns(board, [p; p; 0; p])];
        runs = [runs, findPatterns(board, [p; 0; p; p])];
        runs = [runs, findPatterns(board, [0; p; p; p])];
        
        add = length(runs) * 100;
        if p ~= player
            add = add * -1;
        end
        
        score = score + add;
    end
end
