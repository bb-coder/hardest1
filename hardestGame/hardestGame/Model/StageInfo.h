//
//  StageInfo.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StageRecord.h"
@interface StageInfo : NSObject
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * intro;
@property (nonatomic,assign) double  max;
@property (nonatomic,assign) double  min;
@property (nonatomic,assign) NSInteger stageId;
@property (nonatomic,strong) StageRecord * stageRecord;
@property (nonatomic,copy) NSString * uint;
@property (nonatomic,copy) NSString * format;
+ (instancetype) setStageInfoWithDict:(NSDictionary *) dict;
@end
