//
//  StageRecordTool.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StageRecord.h"
#import "Singleton.h"
@interface StageRecordTool : NSObject
singletonInterface(StageRecordTool)
//读档
- (StageRecord *) stageRecordWithId:(int) StageId;


//存档
- (void) saveStageRecordWithStagerecord:(StageRecord *) stageRecord;
- (void)saveStageRecords:(NSArray *)records;

@end
