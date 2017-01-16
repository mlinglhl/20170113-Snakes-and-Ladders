//
//  main.m
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-13.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "PlayerManager.h"
#import "InputManager.h"

int main(int argc, const char * argv[]) {
    PlayerManager *managePlayers = [[PlayerManager alloc] init];
    InputManager *handleInput = [[InputManager alloc] init];
    BOOL gameOver = NO;
    BOOL restartGame = YES;
    while (restartGame == YES) {
        [managePlayers createPlayers:[handleInput enterPlayers]];
        while (gameOver == NO) {
            if ([managePlayers roll]) {
                gameOver = YES;
            }
        }
        if ([handleInput playAgain]) {
            [managePlayers resetGame];
            gameOver = NO;
            continue;
        }
        else {
            restartGame = NO;
        }
    }
    return 0;
}
