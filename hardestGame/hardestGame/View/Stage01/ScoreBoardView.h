//
//  ScoreBoardView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageInfo.h"
@interface ScoreBoardView : UIView
@property (nonatomic,weak) IBOutlet UILabel * scoreLabel;
- (void) start;
- (void) setScore:(double) score andStageInfo:(StageInfo *) info;
@end
