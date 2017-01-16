//
//  PlayerManager.h
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-14.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "InputManager.h"

@interface PlayerManager : NSObject

@property NSMutableArray<Player *> *players;
@property NSInteger currentIndex;

- (void) createPlayers: (NSInteger) playerNumber;
- (BOOL) roll;
- (void) resetGame;
- (NSString *) score;

@end
