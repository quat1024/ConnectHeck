% Connect Heck

function connectHeck()
    clc;
    clear;
    fprintf('\n\n\nWelcome to Connect Heck\n\n\n');
    
    player2Ai = input('Use an AI player 2 (true / false)? ');
    if isempty(player2Ai)
        player2Ai = false;
    end
    
    % Game board.
    % 0 indicates an empty square. 1 and 2 represents
    % tokens from either player, respectively.
    % Official connect 4 gameboards are 6 rows by 7 columns.
    board = zeros(6, 7);
    
    % The current player. Either 1 or 2.
    player = 1;
    
    % Loop "forever"
    while true
        % Output the game board to the console
        printBoard(board, player);
        renderBoard(board, player);
        
        % Have this player play
        % (this either prompts for input or runs the AI)
        aiControlled = (player == 2) && player2Ai;
        board = play(board, player, aiControlled);
        
        % Check win/fail state and break the loop if the game is over
        state = checkWinLossState(board);
        if state ~= 0
            break;
        end
        
        % Toggle between player 1 and 2
        player = 1 - player + 2;
    end
    
    if state == -1
        fprintf('You both lose! The board filled up without a winner.\n');
    elseif state >= 1
        fprintf('Player %.0f wins!\n', state);
    end
end