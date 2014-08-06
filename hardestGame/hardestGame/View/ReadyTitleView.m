//
//  ReadyTitleView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ReadyTitleView.h"
#import "SoundTool.h"
#import <QuartzCore/QuartzCore.h>
@implementation ReadyTitleView


- (void)awakeFromNib
{
    [self setFullScreenBgImageWithName:@"select_bg.jpg"];
    
    
}

- (void) startAnimation:(NSTimer *) timer
{
    UILabel * label = timer.userInfo;
    
    label.hidden = NO;
    CABasicAnimation * scale = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scale.fromValue = @0;
    scale.toValue = @1;
    
    CAKeyframeAnimation * trans = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    trans.values = @[@0,@40,@20,@0];
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    
    group.animations = @[scale,trans];
    [label.layer addAnimation:group forKey:nil];
    
    [[SoundTool shareSoundTool]playBtnSoundWithFileName:kSoundDropTitle(label.tag+1)];
}

-(void)setInfo:(StageInfo *)info
{
    
    _info = info;
    [[SoundTool shareSoundTool]playBtnSoundWithFileName:kSoundReady];
    _stageId.text = [NSString stringWithFormat:@"Stage %d",info.stageId ];
    
    //分割字符串
    NSArray * array = [info.title componentsSeparatedByString:@"\\n"];
    
    //计时
    CGFloat countDelay = 0;
    //设置3个标签
    int count = _titleLabels.count;
    
    for (int i = 0; i < count; i++) {
        UILabel * label =  _titleLabels[i];
        label.text = array[i];
        label.tag = i;
        countDelay += (i+1) * 0.25;
        [NSTimer scheduledTimerWithTimeInterval:(i+1)*0.25 target:self selector:@selector(startAnimation:) userInfo:label repeats:NO];
    }
    [NSTimer scheduledTimerWithTimeInterval:countDelay target:self selector:@selector(removeSelfView) userInfo:nil repeats:NO];
}
- (void) removeSelfView
{
    [self removeFromSuperview];
    if (_removeTitleView) {
        _removeTitleView();
    }
}


@end
