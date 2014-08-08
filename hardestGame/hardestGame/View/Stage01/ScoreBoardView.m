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
    [self clearAlias];
}
- (void)start
{
    self.scoreLabel.text = @"000";
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.hidden = NO;
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI_4 / 7);
    } completion:^(BOOL finished) {
    }];
}
-(void)setScore:(double)score andStageInfo:(StageInfo *)info
{
    NSString * format = nil;
    if (score < 10) {
        format = [NSString stringWithFormat:@"00%@",info.format];
    }
    else if(score < 100)
    {
        format = [NSString stringWithFormat:@"0%@",info.format];
    }
    else
    {
        format = info.format;
    }
    _scoreLabel.text = [NSString stringWithFormat:format,score];
    
    
    
    //执行动画
    CAKeyframeAnimation * shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation"];
    shake.values = @[@(0),@(-10),@(0)];
    [self.layer addAnimation:shake forKey:nil];
    
}
@end
