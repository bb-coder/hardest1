//
//  StageListView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageInfo.h"
@interface StageListView : UIScrollView
@property (nonatomic,copy) void (^itemClickBlock)(StageInfo * info);
- (void) reloadDataAtNo:(int) stageID;
@end