//
//  InputCollector.h
//  dice
//
//  Created by shunnamiki on 2021/07/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject
- (NSString *) inputForPrompt:(NSString *) promptString;
+ (NSString *) parseStr: (NSString *) str;
@end

NS_ASSUME_NONNULL_END
