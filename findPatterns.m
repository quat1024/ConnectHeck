function [ patternLocations ] = findPatterns(board, pattern)
%FINDPATTERNS searches for instances of "pattern" embedded inside "board".
%Pattern cells equal to -1 are treated as wildcards.
    boardWidth = size(board, 2);
    boardHeight = size(board, 1);
    
    patternWidth = size(pattern, 2);
    patternHeight = size(pattern, 1);
    
    patternLocations = {};
    
    for boardRow = 1 : (boardHeight - patternHeight + 1)
        for boardCol = 1 : (boardWidth - patternWidth + 1)
            
            ok = true;
            
            for patternRow = 1 : patternHeight
                for patternCol = 1 : patternWidth
                    boardCell = board(boardRow + patternRow - 1, boardCol + patternCol - 1);
                    patternCell = pattern(patternRow, patternCol);
                    if patternCell == -1
                        continue;
                    elseif boardCell ~= patternCell
                        ok = false;
                        break;
                    end
                end
                
                if ok == false
                    break;
                end
            end
            
            if ok
                patternLocations = [patternLocations, [boardRow, boardCol]];
            end
        end
    end
end

