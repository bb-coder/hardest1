//
//  CountScoreViewController.h
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageInfo.h"
@class CountScoreView;
@interface CountScoreViewController : UIViewController
- (IBAction)retry;
- (IBAction)backList;

@property (weak, nonatomic) IBOutlet CountScoreView *coutScoreView;
@property (nonatomic,assign) double scoreNew;
@property (nonatomic,strong) StageInfo * info;
@property (weak, nonatomic) IBOutlet UIImageView *rankLabel;
@end
