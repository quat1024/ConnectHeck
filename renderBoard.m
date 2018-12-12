function renderBoard(board, player, first)
    width = size(board, 2);
    height = size(board, 1);
    
    % Choose the figure and set the window.
    if first
        figure(1);
    else
        % Instead of using "figure(1)" we'll use this stupid hack.
        % When you use figure, matlab raises that figure to the front.
        % That steals focus away from the matlab console which is how players
        % interact with the game. When you use this bizarre set hack that
        % doesn't happen. Yeah I don't know either.
        set(0, 'CurrentFigure', 1);
    end
    
    % Clear it
    clf('reset');
    
    % Set axes.
    % Offset the x axis starting point a little bit right to avoid making
    % space for the 0th column, which doesn't exist.
    % Offset the y axis up to 1-index it.
    % Offset the y axis a little bit down to avoid tokens
    % colliding with the numbers along the X axis which are useful for
    % gameplay so you can see what the column number is.
    axis([1 width 0.9 height + 0.99]);
    
    % Plot all of the game tokens
    hold on; %(to the same figure of course)
    for row = 1 : height
        for col = 1 : width
            % determine the color of the disc to draw
            at = board(row, col);
            
            if at == 0
                % Don't draw a disc at all!
                continue;
            end
            
            % Do a little rejiggering to account for different coordinate
            % systems \_(:D)_/
            plotX = col;
            plotY = height - row + 1;
            % Plot the point on the connect 4 board
            plot(plotX, plotY, '.', 'MarkerSize', 70, 'color', playerColor(at));
        end
    end
    
    % Plot the player name too, why not?
    text(width / 2, height + 0.5, sprintf('Player %.0f''s turn', player), 'color', playerColor(player));
    
    % Force the screen to draw
    drawnow;
    
    hold off;
end

% Quick function that takes in a player ID and returns its color
function [color] = playerColor(player) 
    if player == 1
        color = [1 0 0];
    elseif player == 2
        color = [0 0 0];
    else
        color = [1 1 1];
    end
end