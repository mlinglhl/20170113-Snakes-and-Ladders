//
//  InputManager.h
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-14.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputManager : NSObject

+ (NSString *) manageInput;
- (BOOL) playAgain;
- (NSInteger) enterPlayers;
- (BOOL) playerRoll;
@end
