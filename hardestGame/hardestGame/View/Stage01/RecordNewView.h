//
//  RecordNewView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FullBgView.h"

@interface RecordNewView : FullBgView
@property (weak, nonatomic) IBOutlet UIImageView *lightView;
@property (weak, nonatomic) IBOutlet UIView *highScoreView;
@property (weak, nonatomic) IBOutlet UIView *recordNewBoard;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
- (void)begin;
@end
