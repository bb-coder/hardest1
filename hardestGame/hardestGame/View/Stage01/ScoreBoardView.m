//
//  ScoreBoardView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ScoreBoardView.h"

@implementation ScoreBoardView
-(void)awakeFromNib
{
    self.layer.anchorPoint = CGPointMake(0, 1);
    self.layer.position = CGPointMake(-100, 150);
}
- (void)start
{
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.hidden = NO;
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI_4 / 7);
    } completion:^(BOOL finished) {
        
    }];
}
@end
