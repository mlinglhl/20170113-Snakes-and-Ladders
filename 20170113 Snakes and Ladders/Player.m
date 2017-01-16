//
//  Player.m
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-13.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        _name = name;
        _currentSquare = 0;
        _rollCount = 0;
        _gameOver = NO;
        _gameLogic = @ {
//ladders
            @4:@14,
            @9:@31,
            @20:@38,
            @40:@59,
            @51:@67,
            @63:@81,
//snakes
            @17:@7,
            @28:@84,
            @64:@60,
            @89:@26,
            @95:@75,
            @99:@78
        };
    }
    return self;
}

-(void) rollDice {
    self.rollCount ++;
    int roll = arc4random_uniform(6)+1;
    self.currentSquare = self.currentSquare + roll;
    if (self.currentSquare >= 100) {
        self.currentSquare = 100;
        self.gameOver = YES;
        NSLog(@"You rolled %i. You win! You rolled %@ times.", roll, @(self.rollCount));
    }
    else {
        NSLog(@"You rolled %i.\nYou're now at %@", roll, @(self.currentSquare));
        if ([self.gameLogic.allKeys containsObject:@(self.currentSquare)]) {
            if (self.currentSquare > [self.gameLogic[@(self.currentSquare)] integerValue]) {
                NSLog(@"Snake! You rode the snake down to %@.", self.gameLogic[@(self.currentSquare)]);
            }
            else if (self.currentSquare < [self.gameLogic[@(self.currentSquare)] integerValue]) {
                NSLog(@"Ladder! You climbed the ladder up to %@.", self.gameLogic[@(self.currentSquare)]);
            }
            self.currentSquare = [self.gameLogic[@(self.currentSquare)] integerValue];
        }
    }
}

- (NSInteger) getPosition {
    return self.currentSquare;
}

- (BOOL) doIWin {
    return self.gameOver;
}

- (NSString *) score {
    return [NSString stringWithFormat:@"%@: %ld  ", self.name, self.currentSquare];
}

@end
