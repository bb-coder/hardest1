//
//  CountScoreViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "CountScoreViewController.h"
#import "SoundTool.h"
#import "CountScoreView.h"
#import "StageRecordTool.h"
#import "FailView.h"
#import "RecordNewView.h"
#import "PlayViewController.h"
@implementation CountScoreViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setFullScreenBgImageWithName:@"rank_bg.jpg"];
    // 2.算分
    [_coutScoreView countScoreWithNewScore:_scoreNew model:_info];
    // 设置积分改变的block
    _coutScoreView.rankChange = ^(NSString *rank){
        _rankLabel.image = [UIImage imageNamed:[NSString stringWithFormat:@"score_%@.png", rank]];
    };
    
    // 3.设置显示结果的block
    _coutScoreView.showResult = ^(NSString *rank){
        // 1.什么时候需要保存游戏数据
        BOOL betterScore = ((_info.max > _info.min) && (_scoreNew > _info.stageRecord.score))
        || ((_info.max < _info.min) && (_scoreNew < _info.stageRecord.score));
        
        // 需要保存数据 ：1> 第一次玩  2> 成绩比上次好
        BOOL needSaveData = _info.stageRecord.rank == nil || betterScore;
        
        // 2.保存数据
        if (needSaveData) {
            [self saveData:rank];
        }
        
        // 3.显示结果（界面效果）
        [self showResultEffect:rank needSaveData:needSaveData];

            };
    
}
#pragma mark 显示结果（界面效果）
- (void)showResultEffect:(NSString *)rank needSaveData:(BOOL)needSaveData
{
    if ([rank isEqualToString:@"f"]) { // 失败
        FailView *failView =  [[NSBundle mainBundle] loadNibNamed:@"FailView" owner:nil options:nil][0];
        failView.scoreNew = _scoreNew;
        [self.view addSubview:failView];
        
        // 开始执行动画
        [failView begin];
    } else { // 成功（合格）
        if (needSaveData) { // 有新纪录
            [self showNewRecord];
        } else { // 没有新纪录
            if ([rank isEqualToString:@"s"]) { // 最好
                [[SoundTool shareSoundTool] playBtnSoundWithFileName: kSoundNormalGrade];
                [[SoundTool shareSoundTool] playBtnSoundWithFileName: kSoundSGrade];
            } else { // 普通  rank == A~E
                [[SoundTool shareSoundTool] playBtnSoundWithFileName: kSoundNormalGrade];
            }
        }
    }
}

#pragma mark 保存游戏数据
- (void)saveData:(NSString *)rank
{
    // 设置新的分数和等级
    _info.stageRecord.rank = rank;
    _info.stageRecord.score = _scoreNew;
    // 归档
    [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:_info.stageRecord];
    
    if (![rank isEqualToString:@"f"]) {
        // 检测下一关
        StageRecord *next = [[StageRecordTool shareStageRecordTool] stageRecordWithId:_info.stageId + 1];
        if (next == nil) { // 解锁下一关
            next = [[StageRecord alloc] init];
            next.stageId = _info.stageId + 1;
            [[StageRecordTool shareStageRecordTool]  saveStageRecordWithStagerecord:next];
        }
    }
}

#pragma mark 显示新纪录
- (void)showNewRecord
{

    
    // 2.添加新纪录view
    RecordNewView *recordNew = [[NSBundle mainBundle] loadNibNamed:@"RecordNewView" owner:nil options:nil][0];
    [self.view insertSubview:recordNew belowSubview:_rankLabel];
    [recordNew begin];
}

- (IBAction)retry {
    // 1.关闭当前控制器
    UINavigationController *nav =  (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav popViewControllerAnimated:NO];
    
    // 2.通知关卡界面重新开始游戏
    [[NSNotificationCenter defaultCenter] postNotificationName:@"restartGame" object:nil];

    
}

- (IBAction)backList {
    UINavigationController * nav =(UINavigationController *) [UIApplication sharedApplication].keyWindow.rootViewController;
    
    PlayViewController *stages = nav.viewControllers[1];
    // 刷新数据
    [stages reloadDataAtNo:_info.stageId];
    
    // 2.回到选择关卡界面
    [nav popToViewController:stages animated:NO];

    
}
@end
