# Connect Heck Usage Guide and Writeup

Aka the "project notebook" required of me

## Table of Contents

1. Uhh
2. Uhhhh
3. UHHHHHHH
4. UHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

## Business Plan

This shit is FOSS, I don't make money off it!

TODO: Fill the rest of this out later I guess.

## Documentation

### Introduction

Connect Heck is a two-player clone of Connect Four (inb4 dmca takedown). 
Players take turns dropping checkers into the top of a vertical game 
board. Since the board is aligned vertically, checkers always fall to 
the very bottom of the column they are dropped in. To win, align four of 
your checkers in a row horizontally, vertically, or diagonally before 
your opponent does. You can play against someone else in real life, or a 
computer opponent.

### User Manual

To run the game, run `connectHeck` in your MATLAB console.

You will be asked if Player 2 should be a computerized player. Enter 
`true` if you would like that, and `false` (or just hit enter) if you 
don't.

The game will now begin. A game b oard will be printed to the console, 
which looks something like this:

    PLAYER 1's TURN
    1234567
    '''''''
    '''''''
    '''''''
    '''''''
    '''''''
    '''''''
    -------

This is the current state of the Connect 4 game board. Since there are 
no pieces, all of the spaces are empty. You will also see a prompt at 
the bottom of the screen, asking for a column number to drop your piece 
in. Enter a number between 1 and 7 and press ENTER.

Your piece will be dropped into the board, and the process will repeat 
for player 2; it will complete automatically if player 2 is 
computer-controlled, or if they're not, you'll have to hand the keyboard 
off to the other player and have them move.

The winner is the first player to score 4 pieces in a row. If the board 
fills up before that, both players lose, so be careful.

### Developer Description

:spaghetti:

#### Source File Layout

The game code is split across multiple source files. Here is a 
description of what each is responsible for:

* `connectHeck.m`: The main entry/exit point and game loop.
* `printBoard.m`: Responsible for printing the game board to the MATLAB 
console.
* `renderBoard.m`: Responsible for plotting the game board to Figure 1.
* ~~`heckIntelligence.m`: The AI opponent.~~
* `play.m`: Responsible for asking for user input or running the AI. 
* `dropPiece.m`: Helper function to drop a piece into the game board.
* `checkWinLossState.m`: Helper function to check if there are any 
4-in-a-rows.

#### Variables

There are far too many variables to list here. Many are local to only 
one source file. Here is a selection of the most important ones:

* `board`: A 7 wide, 6 high matrix that represents the game board.
	* Zeroes represent blank spaces. 1 and 2 represent checkers from 
each player.
* `player`: Generally this is a number - 1 or 2 - representing the 
current player or the owner of a certain checker on the game board.
* `row`, `col`, `at`: These are usually temporary iterators when looping 
over every item on the board.
	* `row` and `col` represent the current row and column.
	* `at` represents the checker at that row and column (or 0)

#### Commands?

TODO not really sure what this section is about

#### AI Algorithm

Well right now, this award-winning algorithm drops the piece in column 2 
every single time.

#### Sources

Link that cool Terry Cavanagh article on AI in Dicey Dungeons since I'm 
totaly going to steal the concept when I get around to writing the AI.

## Game Loop Overview

    connectHeck
     > print board to console
     > render board to figure 1
     > drop a piece into the board
       > choose column to drop the piece in to
         > if player is AI controlled:
           > run AI simulation
         > if not:
           > prompt for user input
       > drop the piece into that column on the board
     > check if there are wins or losses
       > there are?
         > print the appropriate message and leave
     > flip between players 1 and 2
     > (back to top)

## Discussion

### Incidents

We ran into MATLAB syntax being different from other languages. A 
particular sticking point is that arrays are 1-indexed.

It took us a while to figure out the best way to iterate over the game 
board. 

Write more here.

### Progression

The game started life as a console-only game. It printed the board to 
the console. You could play it, but it was not much better than playing 
Connect 4 in real life, since you had to look for 4-in-a-rows yourself.

Later, we added graphical output in the form of displaying a figure.

~~Then, we added win detection to the game. This proved to be 
surprisingly difficult, since there are a lot of different possible ways 
to score 4 in a row.~~

~~Finally, the AI was completed, replacing the dummy AI that simply 
always dropped a piece in the second column.~~lol no

## Conclusion

Dont use fkin matlab lol it's terrible and not for games. Duhh
