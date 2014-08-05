//
//  StageView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageInfo.h"
@interface StageView : UIView
@property (weak, nonatomic) IBOutlet UIView *lockable;
@property (weak, nonatomic) IBOutlet UIImageView *lockImage;
@property (weak, nonatomic) IBOutlet UIButton *stageId;
@property (weak, nonatomic) IBOutlet UIView *locker;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *currentStage;
@property (weak, nonatomic) IBOutlet UIImageView *priceImage;
@property (weak, nonatomic) IBOutlet UIImageView *price;

@property (nonatomic,strong) StageInfo * info;
@end
