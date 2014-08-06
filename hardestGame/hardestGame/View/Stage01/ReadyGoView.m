//
//  ReadyGoView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ReadyGoView.h"
#import "SoundTool.h"
@implementation ReadyGoView
- (void) start:(void (^)())completion
{
    self.transform = CGAffineTransformMakeTranslation(320, 0);
    [UIView animateWithDuration:.9 animations:^{
        [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundReadyGo];
        self.hidden = NO;
        self.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.25 delay:.3 options:UIViewAnimationOptionCurveLinear animations:^{
            self.image = [UIImage imageNamed:@"go.png"];
            self.transform = CGAffineTransformMakeTranslation(-320, 0);
        } completion:^(BOOL finished) {
            self.hidden = YES;
            completion();
        }];
    }];
}
@end
