function [ patternLocations ] = findPatterns(board, pattern)
%FINDPATTERNS searches for instances of "pattern" embedded inside "board".
%Pattern cells equal to -1 are treated as wildcards.
    boardWidth = size(board, 2);
    boardHeight = size(board, 1);
    
    patternWidth = size(pattern, 2);
    patternHeight = size(pattern, 1);
    
    % The potential locations of patterms.
    patternLocations = {};
    
    % Slide the pattern over the game board.
    % Since we move the upper-left corner of the pattern, and the pattern hash
    % some width and height to it, we don't need to move it over the full
    % width and height of the game board.
    for boardRow = 1 : (boardHeight - patternHeight + 1)
        for boardCol = 1 : (boardWidth - patternWidth + 1)
            
            ok = true;
            
            % Check that each cell in the moved pattern matches the board
            for patternRow = 1 : patternHeight
                for patternCol = 1 : patternWidth
                    boardCell = board(boardRow + patternRow - 1, boardCol + patternCol - 1);
                    patternCell = pattern(patternRow, patternCol);
                    % Ignore -1s in the pattern. This lets you use them as
                    % wildcards that match whatever.
                    if patternCell == -1
                        continue;
                    elseif boardCell ~= patternCell
                        ok = false;
                        break;
                    end
                end
                
                % Hey look matlab has no labeled break statement.
                if ok == false
                    break;
                end
            end
            
            if ok
                % Append this pattern location to the list of matches.
                patternLocations = [patternLocations, [boardRow, boardCol]];
            end
        end
    end
end

