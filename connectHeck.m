% Connect Heck

function connectHeck()
    clc;
    clear;
    fprintf('\n\n\nWelcome to Connect Heck\n\n\n');
    
    % Ask about AI controlled players!
    player1Ai = input('Use an AI player 1 (true / false)? ');
    if isempty(player1Ai) % basic input sanitation...? lol
        player1Ai = false;
    end
    
    player2Ai = input('Use an AI player 2 (true / false)? ');
    if isempty(player2Ai)
        player2Ai = false;
    end
    
    smartness = 1;
    if player1Ai || player2Ai
        smartness = input('AI difficulty (1 - 4)? ');
    end
    
    % Game board.
    % 0 indicates an empty square. 1 and 2 represents
    % tokens from either player, respectively.
    % Official connect 4 gameboards are 6 rows by 7 columns.
    board = zeros(6, 7);
    
    % The current player. Either 1 or 2.
    player = 1;
    
    % Whether this is the first run.
    first = true;
    
    % Loop "forever"
    while true
        % Output the game board to the console
        printBoard(board, player);
        renderBoard(board, player, first);
        
        % Have this player play
        % (this either prompts for input or runs the AI)
        aiControlled = ((player == 1) && player1Ai) || ((player == 2) && player2Ai);
        board = play(board, player, aiControlled, smartness);
        
        % Check win/fail state and break the loop if the game is over
        state = checkWinLossState(board);
        if state ~= 0
            break;
        end
        
        % Toggle between player 1 and 2
        player = 1 - player + 2;
        
        first = false;
    end
    
    % Draw the board 1 more time to show the final game state
    printBoard(board, player);
    renderBoard(board, player, false);
    
    if state == -1
        fprintf('You both lose! The board filled up without a winner.\n');
    elseif state >= 1
        fprintf('Player %.0f wins!\n', state);
    end
end
