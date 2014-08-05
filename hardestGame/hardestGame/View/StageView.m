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
#import "StageRecord.h"
#import "stageRecordTool.h"
@implementation StageView
{
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark 当view从xib加载的时候调用此方法
-(void)awakeFromNib
{
    NSMutableArray * marray = [NSMutableArray array];
    for (int i = 1; i < 4; i++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"select_stage_s%02d.png",i]];
        [marray setObject:image atIndexedSubscript:i-1];
    }
    _lockImage.animationImages = marray;
}

- (void)setInfo:(StageInfo *)info
{
    _info = info;
    
    // 1.关卡编号
    [_stageId setTitle:[NSString stringWithFormat:@"%d", info.stageId] forState:UIControlStateNormal];
    
    // 2.设置图标
    _icon.image = [UIImage imageNamed:info.icon];
    
    [self updateStageState];
    
}
#pragma mark 根据游戏记录更新关卡状态
- (void) updateStageState
{
    //第一次玩游戏，所有关卡未解锁
    if(!_info.stageRecord)
    {
        [self updateStageStateWithNoRecord];
    }else//有玩过
    {
        //已经解锁
        if (_info.stageRecord.isUnlocked) {
            [self updateStageStateWithUnlocked];
        }
        else
        {
            //即将解锁
            [self updateStageStatewillWithUnlock];
        }
    }
}

#pragma mark 没有记录(加锁)
- (void) updateStageStateWithNoRecord
{
    [self setUserInteractionEnabled:NO];
}
#pragma mark 已经解锁
- (void) updateStageStateWithUnlocked
{
    
    [self.locker removeFromSuperview];
    [self.lockable removeFromSuperview];
    if(_info.stageRecord.rank)//玩过
    {
    [self.currentStage setHidden:YES];
        self.priceImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"select_stage_%@.png",_info.stageRecord.rank]];
        [self.priceImage setHidden:NO];
        [self.shadowImage setHidden:NO];
        if ([@"s" isEqualToString:_info.stageRecord.rank]) {
            _lockImage.animationDuration = 0.27;
            [_lockImage startAnimating];
        }
    }
    else//没玩过
    {
    self.lockImage.image = [UIImage imageNamed:@"select_stage_new.png"];
    [self.currentStage setHidden:NO];
    }
}
#pragma mark 即将解锁
- (void) updateStageStatewillWithUnlock
{
    [self setUserInteractionEnabled:NO];
    [self unlock];
    StageRecord * sr = [[StageRecord alloc]init];
    sr.stageId = _info.stageId;
    sr.unlocked = YES;
    sr.rank = nil;
    _info.stageRecord = sr;
    [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:sr];

}


#pragma mark 摇晃缩放动画组
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
        self.userInteractionEnabled = YES;
        
        [self.currentStage setHidden:NO];
        [self.currentStage.layer addAnimation:[self shakeScaleAnimationGroup] forKey:nil];
    }];
}
-(void)unlock
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
