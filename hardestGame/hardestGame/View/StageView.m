//
//  StageView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "StageView.h"
#import <QuartzCore/QuartzCore.h>
#import "SoundTool.h"
@implementation StageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setInfo:(StageInfo *)info
{
    _info = info;
    
    // 1.关卡编号
    [_stageId setTitle:[NSString stringWithFormat:@"%d", info.stageId] forState:UIControlStateNormal];
    
    // 2.设置图标
    _icon.image = [UIImage imageNamed:info.icon];
    
}

- (CAAnimationGroup *) shakeScaleAnimationGroup
{
    CAKeyframeAnimation * shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    CGFloat angle = M_PI_4 / 5;
    shake.values = @[@(-angle),@(angle),@(-angle),@(-angle),@(angle),@(-angle),@(-angle),@(angle),@(-angle)];
    
    CAKeyframeAnimation * scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scale.values = @[@1.2,@1];
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[shake,scale];
    return group;

    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.lockable removeFromSuperview];
    [self.lockable setHidden:NO];
    self.lockImage.image = [UIImage imageNamed:@"select_stage_new.png"];    
    [UIView animateWithDuration:.25 animations:^{
        CGRect frame = self.locker.frame;
        frame.origin.y += Iphone5?480:568;
        self.locker.frame = frame;
    } completion:^(BOOL finished) {
        [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundNewPopFileName];
        [self.locker removeFromSuperview];
        self.userInteractionEnabled = NO;
        
        [self.currentStage setHidden:NO];
        [self.currentStage.layer addAnimation:[self shakeScaleAnimationGroup] forKey:nil];
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CAAnimationGroup * group =[self shakeScaleAnimationGroup];
    group.delegate = self;
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundChainDropFileName];
    group.duration = 0.4;
    [self.layer addAnimation:group forKey:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
