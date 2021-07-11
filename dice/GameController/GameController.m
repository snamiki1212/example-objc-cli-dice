//
//  GameController.m
//  dice
//
//  Created by shunnamiki on 2021/07/10.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dice = [NSMutableArray new];
        [self.dice addObjectsFromArray: @[
            [[Dice alloc] init],
            [[Dice alloc] init],
            [[Dice alloc] init],
            [[Dice alloc] init],
            [[Dice alloc] init],
        ]];
        self.indeciesOfHoldDie = [NSMutableSet new];
    }
    return self;
}
- (void) roll {
    for(NSUInteger idx = 0; idx < [self.dice count]; idx++) {
        if([self _isHoldDie: idx]) continue;
        [self.dice[idx] roll];
    }
    return;
}

- (void) holdDie: (int) index {
    [self _isHoldDie: index]
        ? [self.indeciesOfHoldDie removeObject: @(index)]
        : [self.indeciesOfHoldDie addObject: @(index)];
    return;
}

- (BOOL) _isHoldDie: (int) index {
    return [self.indeciesOfHoldDie containsObject: @(index)];
}

- (void) printDice {
    NSMutableString *result = [[NSMutableString alloc] initWithString: @""];
    for(NSUInteger idx = 0; idx < [self.dice count]; idx++) {
        NSString *diceStr = [self _getDieLogo: idx];
        [result appendFormat: @" %@", diceStr];
    }
    NSLog(@"%@", result);
    return;
}

- (NSString *) _getDieLogo: (int) index {
    Dice *die = [self.dice objectAtIndex: index];
    NSString *dieStr = [self _doGetDieLogo: die.value];
    return [self _isHoldDie: index] ? [self _decorateWithSquareBrackets: dieStr] : dieStr;
}

- (NSString *) _decorateWithSquareBrackets: (NSString *) str {
    return [[NSString new] stringByAppendingFormat: @"[%@]", str];
}

- (NSString *) _doGetDieLogo: (int) number {
    if(number == 1) return @"⚀";
    if(number == 2) return @"⚁";
    if(number == 3) return @"⚂";
    if(number == 4) return @"⚃";
    if(number == 5) return @"⚄";
    if(number == 6) return @"⚅";
    return @"";
}

- (void) printScore {
    int score = 0;
    for(int idx = 0; idx < [self.dice count]; idx++) {
        if(![self _isHoldDie: idx]) continue;
        Dice *die = [self.dice objectAtIndex:idx];
        score += [die value];
    }
    NSLog(@"score: %d", score);
}

- (void) resetDice {
    self.indeciesOfHoldDie = [NSMutableSet new];
    return;
}
@end
