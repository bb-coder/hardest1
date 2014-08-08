//
//  CountScoreView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StageInfo;
@interface CountScoreView : UIView
@property (nonatomic, weak) IBOutlet UIImageView *scoreBorder;
@property (nonatomic, weak) IBOutlet UIImageView *scoreHint;

@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *unitLabel;
@property (nonatomic, copy) void (^rankChange)(NSString *rank);

@property (nonatomic, copy) void (^showResult)(NSString *rank);

- (void)countScoreWithNewScore:(double)newScore model:(StageInfo *)model;
@end
