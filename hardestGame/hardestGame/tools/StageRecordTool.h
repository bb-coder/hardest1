//
//  StageRecordTool.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StageRecord.h"
@interface StageRecordTool : NSObject

+ (StageRecordTool *) shareStageRecordTool;

//读档
- (StageRecord *) stageRecordWithId:(int) StageId;


//存档
- (void) saveStageRecordWithStagerecord:(StageRecord *) stageRecord;


@end
