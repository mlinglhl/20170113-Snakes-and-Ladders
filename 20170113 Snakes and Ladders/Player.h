//
//  Player.h
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-13.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Player : NSObject

@property NSInteger currentSquare;
@property NSDictionary* gameLogic;
@property NSInteger rollCount;
@property BOOL gameOver;
@property NSString *name;

- (instancetype)initWithName: (NSString *) name;
- (void) rollDice;
- (NSInteger) getPosition;
- (BOOL) doIWin;
- (NSString *) score;

@end
