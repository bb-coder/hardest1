//
//  StageInfo.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  StageRecord;
@interface StageInfo : NSObject
@property (nonatomic,copy) NSString * icon;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * intro;
@property (nonatomic,copy) NSString * max;
@property (nonatomic,copy) NSString * min;
@property (nonatomic,assign) NSInteger stageId;
@property (nonatomic,strong) StageRecord * stageRecord;

+ (instancetype) setStageInfoWithDict:(NSDictionary *) dict;
@end
