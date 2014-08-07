//
//  Stage01Controller.h
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeetView.h"
#import "FeatherView.h"
#import "ScoreBoardView.h"
#import "ReadyGoView.h"
#import "StageInfo.h"
@interface Stage01Controller : UIViewController
@property (weak, nonatomic) IBOutlet FeetView *feetView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet FeatherView *featherView;
@property (weak, nonatomic) IBOutlet ReadyGoView *readyGoView;
@property (weak, nonatomic) IBOutlet ScoreBoardView *scoreBoardView;
@property (nonatomic,strong) StageInfo * info;
- (IBAction)featherClick:(UIButton *)sender;
- (IBAction)retry;
- (IBAction)pause;


@end
