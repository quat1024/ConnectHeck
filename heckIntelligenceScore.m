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
    
    % Give weight to creating "open threes", 3 in a rows with each end
    % open. This is an easy win (or loss, if the other player does it)
    for p = 1 : 2
        pattern = [0 p p p 0];
        openThrees = {};
        openThrees = [openThrees, findPatterns(board, pattern)];
        openThrees = [openThrees, findPatterns(board, rot90(pattern))];
        
        pattern2 = [0 -1 -1 -1 -1; -1 p -1 -1 -1; -1 -1 p -1 -1; -1 -1 -1 -1 p; -1 -1 -1 -1 0];
        openThrees = [openThrees, findPatterns(board, pattern2)];
        openThrees = [openThrees, findPatterns(board, rot90(pattern2))];
        
        add = length(openThrees) * 100000;
        if p ~= player
            add = add * -1;
        end
        score = score + add;
    end
    
    % Give weight to creating runs of 3 of the right color
    for p = 1 : 2
        runs = {};
        
        % Basically I want to step through the 4 possibilities here
        % where p represents a checker and 0 a blank space:
        % ppp0, pp0p, p0pp, 0ppp
        for i = 1 : 4
            pattern = [p, p, p, p];
            pattern(i) = 0;
            runs = [runs, findPatterns(board, pattern)];
            runs = [runs, findPatterns(board, rot90(pattern))];
            
            % Diagonals too
            pattern2 = [p -1 -1 -1; -1 p -1 -1; -1 -1 p -1; -1 -1 -1 p];
            pattern2(i, i) = 0;
            runs = [runs, findPatterns(board, pattern2)];
            runs = [runs, findPatterns(board, rot90(pattern2))];
        end
        
        add = length(runs) * 50;
        if p ~= player
            add = add * -1;
        end
        
        score = score + add;
    end
    
    % Give a little less, but still some, weight to creating runs of 2 of the right color
    for p = 1 : 2
        runs = {};
        for i = 1 : 3
            pattern = [p, p, p];
            pattern(i) = 0;
            runs = [runs, findPatterns(board, pattern)];
            runs = [runs, findPatterns(board, rot90(pattern))];
            
            % Diagonals too
            pattern2 = [p -1 -1; -1 p -1; -1 -1 p];
            pattern2(i, i) = 0;
            runs = [runs, findPatterns(board, pattern2)];
            runs = [runs, findPatterns(board, rot90(pattern2))];
        end
         
        add = length(runs) * 25;
        if p ~= player
            add = add * -1;
        end
        
        score = score + add;
    end
end
