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
#import "FailView.h"
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
        // 1.判断是否有新纪录
        //        if ( ((_model.max > _model.min) && (_scoreNew > _model.recordModel.score))
        //            || ((_model.max < _model.min) && (_scoreNew < _model.recordModel.score)) ) { // 有新纪录
        //            // 设置新的等级和成绩
        //            _model.recordModel.rank = rank;
        //            _model.recordModel.score = _scoreNew;
        //            // 归档
        //            [[StageRecordTool sharedStageRecordTool] saveStageRecord:_model.recordModel];
        //        } else {
        //
        //        }
        
        if ([rank isEqualToString:@"f"]) { // 失败
            FailView * failView =  [[NSBundle mainBundle] loadNibNamed:@"FailView" owner:nil options:nil][0];
            [self.view addSubview:failView];
            // 开始执行动画
            [failView begin];
        } else if ([rank isEqualToString:@"s"]) { // 最好
            [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundNormalGrade];
            [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundSGrade];
        } else { // 普通  rank == A~E
            [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundNormalGrade];
        }
    };
}
@end
