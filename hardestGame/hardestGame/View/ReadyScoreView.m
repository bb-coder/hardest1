//
//  ReadyScoreView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ReadyScoreView.h"
#import "StageRecord.h"
@implementation ReadyScoreView
-(void)setInfo:(StageInfo *)info
{
    _info = info;
    
    CGFloat score = (info.max - info.min) / 5;
    for (int i = 0; i < 6; i++) {
        UILabel * label = _labels[i];
        label.text = [NSString stringWithFormat:info.format,info.max - (score * i)];
    }
    if (!info.stageRecord.score)
        _arrow.hidden = YES;
    // 设置指示器的中点x
    CGPoint center = _arrow.center;
    center.x = self.frame.size.width;
    // 如果不是F等级
    if (![_info.stageRecord.rank isEqualToString:@"f"]) {
        CGFloat delta = _info.stageRecord.score - _info.min;
        CGFloat total = score * 6;
        CGFloat widthPerScore = (self.frame.size.width + 5) / total;
        center.x -= delta * widthPerScore;
    }
    if(center.x < 0)center.x = 0;
    _arrow.center = center;
   
    //执行动画
    self.transform = CGAffineTransformMakeTranslation(0, 200);
    [UIView animateWithDuration:.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        
       
        if (_arrow.hidden) return ;
        CAKeyframeAnimation * twink = [CAKeyframeAnimation animationWithKeyPath:@"hidden"];
        twink.values = @[@0,@1,@0,@0,@1,@0];
        twink.repeatCount = 2;
        [_arrow.layer addAnimation:twink forKey:nil];
        
        
    }];
    
    
    
}
@end
