//
//  FeatherView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FeatherView.h"

@implementation FeatherView
-(void)start
{
    self.alpha = 0;
}
-(void)setFeather:(int)index
{
    self.alpha = 1;
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame = self.frame;
        frame.origin.x = index * 320/3;
        self.frame = frame;
    } completion:^(BOOL finished) {
        CGPathRef path = CGPathCreateWithEllipseInRect(CGRectMake(-25, -25, 50, 50), nil);
        CAKeyframeAnimation * shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation"];
        shake.path = path;
        shake.delegate = self;
        [self.layer addAnimation:shake forKey:nil];
        CGPathRelease(path);
    }];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = 0;
    }];
}

@end
