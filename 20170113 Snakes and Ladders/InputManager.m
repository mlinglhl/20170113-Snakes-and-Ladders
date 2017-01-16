//
//  InputManager.m
//  20170113 Snakes and Ladders
//
//  Created by Minhung Ling on 2017-01-14.
//  Copyright © 2017 Minhung Ling. All rights reserved.
//

#import "InputManager.h"

@implementation InputManager

+ (NSString *) manageInput {
    char str[100];
    fgets (str, 100, stdin);
    NSString *inputString = [[NSString alloc] initWithUTF8String:str];
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *userInputSmall = [inputString lowercaseString];
    return userInputSmall;
}

- (NSInteger) enterPlayers {
    BOOL valid = NO;
    while (valid == NO) {
        NSLog (@"Enter the number of players.");
        NSInteger players = [[InputManager manageInput] intValue];
        if (players) {
            return players;
        }
        else {
            NSLog(@"Invalid input.");
        }
    }
    return 1;
}

- (BOOL) playAgain {
    
    BOOL valid = NO;
    while (valid == NO) {
        NSLog(@"Would you like to play again?");
        NSString *inputString = [InputManager manageInput];
        
        if ([inputString isEqualToString:@"yes"]) {
            return YES;
        }
        else if ([inputString isEqualToString:@"no"]) {
            NSLog(@"Goodbye");
            return NO;
        }
        else {
            NSLog(@"Invalid input!");
        }
    }
    return NO;
}

- (BOOL) playerRoll {
    BOOL valid = NO;
    while (valid == NO) {
        NSLog(@"Type roll or r to roll.");
        NSString *userInput = [InputManager manageInput];
        if ([userInput isEqualToString:[NSString stringWithFormat:@"r"]] || [userInput isEqualToString:[NSString stringWithFormat:@"roll"]]) {
            return YES;
        }
        else if ([userInput isEqualToString:@"quit"]) {
            return NO;
        }
        else {
            NSLog(@"Invalid input");
        }
    }
    return YES;
}
@end
