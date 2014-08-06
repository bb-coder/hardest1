//
//  ReadyTitleView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FullBgView.h"
#import "StageInfo.h"
@interface ReadyTitleView : FullBgView

@property (nonatomic,copy) void(^removeTitleView)();
@property (nonatomic,weak) IBOutlet UILabel *stageId;
@property (nonatomic,strong) IBOutletCollection(UILabel) NSArray * titleLabels;
@property (nonatomic,strong) StageInfo *info;
@end
