//
//  PlayerManager.m
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-14.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc] init];
        _currentIndex = 0;
    }
    return self;
}

- (void) createPlayers: (NSInteger) playerNumber {
    
    for (int i = 1; i < playerNumber+1; i++) {
        Player *player = [[Player alloc] initWithName:[NSString stringWithFormat:@"player%i", i]];
        [self.players addObject:player];
    }
}

- (BOOL) roll {
    InputManager *manageInputs = [[InputManager alloc] init];
    NSLog(@"Player %ld's turn. You are at %ld.", self.currentIndex+1, self.players[self.currentIndex].currentSquare);
    if ([manageInputs playerRoll]) {
    [[self currentPlayer] rollDice];
    if (self.players[self.currentIndex].gameOver) {
        NSLog(@"%@", [self score]);
        return YES;
    }
    self.currentIndex = self.currentIndex + 1;
    if (self.currentIndex > self.players.count-1) {
        self.currentIndex = 0;
    }
    NSLog(@"%@", [self score]);
    return NO;
    }
    else {
        return YES;
    }
}

- (void) resetGame{
    [self.players removeAllObjects];
    self.currentIndex = 0;
}

- (Player *) currentPlayer {
    return self.players[self.currentIndex];
}

- (NSString *) score {
    NSMutableString *scoreOutput = [NSMutableString new];
    for (Player *player in self.players) {
        [scoreOutput appendString:[player score]];
    }
    return scoreOutput;
}

@end
