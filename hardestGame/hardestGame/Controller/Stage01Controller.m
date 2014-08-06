//
//  Stage01Controller.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "Stage01Controller.h"
#import <QuartzCore/QuartzCore.h>
#define kFeetTime (1 + arc4random_uniform(5)/10.0)
@interface Stage01Controller()
{
    CGFloat _leftTime;
    CGFloat _feetLeftTime;
    CADisplayLink * _timer;
}
@end
@implementation Stage01Controller


-(void)viewDidLoad
{
    [self startGame];
}

- (void) startGame
{
    
    //1.脚显示
    [_feetView start];
    //1.1ready go
    [_readyGoView start:^{
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTimeLabel:)];
        [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        self.view.userInteractionEnabled = YES;
    }];
    //2.记分板
    [_scoreBoardView start];
    //3.计时
    _scoreLabel.text = @"7.0";
    _leftTime = 7.0;
    _feetLeftTime = kFeetTime;
}

-(void) theEnd
{
    [self.view setUserInteractionEnabled:NO];
    _leftTime = 0;
    [_timer removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
- (void) updateTimeLabel:(CADisplayLink *) timer
{
    _leftTime -= timer.duration;
    _feetLeftTime -= timer.duration;
    if (_feetLeftTime < 0) {
        _feetLeftTime = kFeetTime;
         [_feetView random];
    }
    if (_leftTime < 0) {
        [self theEnd];
    }
    _scoreLabel.text = [NSString stringWithFormat:@"%.1f",_leftTime];
}
- (IBAction)featherClick:(UIButton *)sender {
    
    int index = (sender.frame.origin.x + 10) / sender.frame.size.width;
    //4.羽毛
    [_featherView start:index];
    if ([_feetView attack:index]) {
        
    }
    
}
@end
