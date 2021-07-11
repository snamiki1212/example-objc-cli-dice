//
//  main.m
//  dice
//
//  Created by shunnamiki on 2021/07/10.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Dice.h"
#import "GameController.h"

const NSString *MENU_DESCRIPTION = @"\n- roll\n- hold\n- reset\n";

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector *ic = [[InputCollector alloc] init];
        GameController *gc = [[GameController alloc] init];
        
        while(true) {
            NSLog(@"%@", MENU_DESCRIPTION);
            NSString *userInput = [ic inputForPrompt: @"Input command:"];
            
            if([userInput isEqualToString:@"hold"]) {
                NSString *indexInputStr = [ic inputForPrompt: @"Input dice index:"];
                int indexInput = [indexInputStr intValue];
                [gc holdDie:indexInput];
                [gc printDice];
                [gc printScore];
                continue;
            }
            
            if([userInput isEqualToString:@"roll"]) {
                [gc roll];
                [gc printDice];
                [gc printScore];
                continue;
            }
            
            if([userInput isEqualToString:@"reset"]) {
                [gc resetDice];
                [gc printDice];
                continue;
            }
        }
    }
    return 0;
}
