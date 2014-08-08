//
//  RecordNewView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//
#import "RecordNewView.h"
#import <QuartzCore/QuartzCore.h>
#import "SoundTool.h"

@implementation RecordNewView

- (void)awakeFromNib
{
    // 1.加载灯光图片
    _lightView.animationImages = @[
                                   [UIImage imageNamed:@"scene_light02.png"],
                                   [UIImage imageNamed:@"scene_light03.png"],
                                   [UIImage imageNamed:@"scene_light04.png"]
                                   ];
    _lightView.animationDuration = 0.4;
    
    // 2.设置边框为屏幕尺寸
    self.frame = [UIScreen mainScreen].bounds;
    
    // 3.让板倾斜
    _recordNewBoard.transform = CGAffineTransformMakeRotation(M_PI_4/6);
    _backImageView.hidden = NO;
}

- (void)begin
{
    // 1.平移动画（highScore）
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    anim.fromValue = @0;
    anim.toValue = @-360;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 1;
    
    [_highScoreView.layer addAnimation:anim forKey:nil];
    
    // 2.灯光
    [_lightView startAnimating];
    
    // 3.播放声音
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundRecordNew2];
    
    // 4.板掉下来
    CGAffineTransform oldForm = _recordNewBoard.transform;
    
    _recordNewBoard.transform = CGAffineTransformScale(oldForm, 2, 2);
    [UIView animateWithDuration:0.05 animations:^{
        _recordNewBoard.transform = oldForm;
        [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundRecordNew1];
    }];
}

@end
