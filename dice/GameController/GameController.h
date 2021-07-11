//
//  GameController.h
//  dice
//
//  Created by shunnamiki on 2021/07/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject
@property NSMutableArray *dice;
@property NSMutableSet *indeciesOfHoldDie;
- (void) roll;
- (void) holdDie: (int) index;
- (BOOL) _isHoldDie: (int) index;
- (void) printDice;
- (NSString *) _getDieLogo: (int) index;
- (NSString *) _decorateWithSquareBrackets: (NSString *) str;
- (NSString *) _doGetDieLogo: (int) number;
- (void) printScore;
- (void) resetDice;
@end

NS_ASSUME_NONNULL_END
