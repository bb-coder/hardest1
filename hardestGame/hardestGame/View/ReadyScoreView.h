//
//  ReadyScoreView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageInfo.h"
@interface ReadyScoreView : UIView
@property (nonatomic,strong) StageInfo * info;
@property (nonatomic,strong) IBOutletCollection(UILabel) NSArray * labels;
@property (nonatomic,weak) IBOutlet UIImageView * arrow;
@end
