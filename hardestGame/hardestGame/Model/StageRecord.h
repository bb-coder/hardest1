//
//  StageRecord.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StageRecord : NSObject<NSCoding>
@property (nonatomic,assign) double score;
@property (nonatomic,copy) NSString * rank;
@property (nonatomic,assign) int stageId;
@property (nonatomic,assign,getter = isUnlocked) BOOL unlocked;


@end
