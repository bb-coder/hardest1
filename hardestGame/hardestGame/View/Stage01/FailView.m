//
//  FailVIew.m
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FailView.h"
#import "SoundTool.h"
@implementation FailView
- (void)awakeFromNib
{
    // 设置背景
    [self setFullScreenBgImageWithName:@"fail_bg.jpg"];
    
    self.frame = [UIScreen mainScreen].bounds;
    
}

// 开始执行动画
- (void)begin
{
    [_ownerScore setText:[NSString stringWithFormat:@"您的得分：%.0f分",_scoreNew]];
    // 1.默认就让文字、监狱在最上面
    _boyAndWord.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(_boyAndWord.frame));
    _prison.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(_prison.frame));
    
    // 2.文字动画
    [UIView animateWithDuration:0.3 animations:^{
        _boyAndWord.transform = CGAffineTransformIdentity;
        [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundFailDrop];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            _prison.transform = CGAffineTransformIdentity;
            [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundCageDrop];
            [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundFailShout];
        }];
    }];
}

- (IBAction)retry {
    // 1.关闭当前控制器
    UINavigationController *nav =  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav popViewControllerAnimated:NO];
    
    // 2.通知关卡界面重新开始游戏
    [[NSNotificationCenter defaultCenter] postNotificationName:@"restartGame" object:nil];
    
}

- (IBAction)home {
    [[SoundTool shareSoundTool]playBtnSoundWithFileName:kSoundClickButtonFileName];
    UINavigationController *nav =  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav popToRootViewControllerAnimated:NO];
}
@end
