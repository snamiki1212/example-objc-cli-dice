//
//  Dice.m
//  dice
//
//  Created by shunnamiki on 2021/07/10.
//

#import "Dice.h"

@implementation Dice
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self roll];
    }
    return self;
}

- (void) roll {
    self.value = arc4random_uniform(6) + 1;
    return;
}

@end
