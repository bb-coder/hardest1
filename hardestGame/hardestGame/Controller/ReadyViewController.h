//
//  ReadyViewController.h
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageInfo.h"
#import "ReadyTitleView.h"
#import "ReadyScoreView.h"
@interface ReadyViewController : UIViewController
- (IBAction)backClick:(id)sender;
@property (weak, nonatomic) IBOutlet ReadyTitleView *readyView;

@property (weak, nonatomic) IBOutlet UIImageView *stageIcon;
@property (weak, nonatomic) IBOutlet UILabel *stageId;
@property (weak, nonatomic) IBOutlet UILabel *stageIntro;

@property (weak, nonatomic) IBOutlet ReadyScoreView *readyScoreView;

@property (nonatomic,strong) StageInfo * info;
@end
