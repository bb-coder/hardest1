//
//  Stage01Controller.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "Stage01Controller.h"
#import <QuartzCore/QuartzCore.h>
#import "SoundTool.h"
#import "PauseViewController.h"
#define kFeetTime (1 + arc4random_uniform(5)/10.0)
@interface Stage01Controller()
{
    CGFloat _leftTime;
    CGFloat _feetLeftTime;
    CADisplayLink * _timer;
    int _hitCount;
}
@end
@implementation Stage01Controller


-(void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(willEnterForeground) name:@"applicationWillEnterForeground" object:nil];
    [self.view setUserInteractionEnabled:NO];
    [self guideDisplay];
}

- (void) willEnterForeground
{
    [self pause];
}
- (void) guideDisplay
{
    self.view.userInteractionEnabled = YES;
    if ([_info.stageRecord.rank isEqualToString:@"f"] || !_info.stageRecord.rank) {
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.animationImages = @[
                                  [UIImage imageNamed:@"guide00.png"],
                                  [UIImage imageNamed:@"guide01.png"]
                                  ];
    imageView.animationDuration = .4;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeGuide:)];
    [imageView addGestureRecognizer:tap];
    imageView.frame = self.view.bounds;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    [imageView startAnimating];
    }
    else
    [self startGame];
    
}
//监听点击手势
- (void) removeGuide:(UITapGestureRecognizer *)tap
{
    [tap.view removeFromSuperview];
    self.view.userInteractionEnabled = NO;
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
    [_scoreBoardView setScore:0 andStageInfo:_info];
    //3.计时
    _scoreLabel.text = @"7.0";
    _leftTime = 7.0;
    _feetLeftTime = kFeetTime;
    _hitCount = 0;
    //4.羽毛
    [_featherView start];
    
}

-(void) theEnd
{
    [_timer invalidate];
    [self.view setUserInteractionEnabled:NO];
    _leftTime = 0;
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
-(void) displayMiss:(int) index
{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01_miss.png"]];
    CGFloat x = self.view.frame.size.width / 3 * index + 53;
    CGFloat y = _feetView.center.y - 40;
    CGRect frame = CGRectMake(x, y, 50, 25);
    imageView.frame = frame;
    [self.view addSubview:imageView];
    [UIView animateWithDuration:.9 animations:^{
        imageView.transform = CGAffineTransformMakeTranslation(0, -150);
        imageView.alpha = 0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}

- (IBAction)featherClick:(UIButton *)sender {
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundTap];
    
    int index = (sender.frame.origin.x + 10) / sender.frame.size.width;
    
    //4.羽毛
    [_featherView setFeather:index];
    if ([_feetView attack:index])
        _hitCount++;
    else
    {
        [self displayMiss:index];
    }
    [_scoreBoardView setScore:(double)_hitCount andStageInfo:_info];
}

- (IBAction)retry {
        [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    [self theEnd];
    [self startGame];
}

- (IBAction)pause {
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    _timer.paused = YES;
    [self performSegueWithIdentifier:@"pause" sender:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PauseViewController * vc = segue.destinationViewController;
    vc.reusem = ^{
        [_readyGoView start:^{
            _timer.Paused = NO;
        }];
    };
}
@end
