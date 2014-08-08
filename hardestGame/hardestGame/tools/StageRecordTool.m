//
//  StageRecordTool.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "StageRecordTool.h"
#import "NSString+path.h"
#define kStageFileName @"records.data"
@interface StageRecordTool ()
{
    NSMutableDictionary * _allStageRecords;
}

@end

@implementation StageRecordTool
singletonImplementation(StageRecordTool)

- (instancetype)init
{
    self = [super init];
    if (self) {

        _allStageRecords = [NSKeyedUnarchiver unarchiveObjectWithFile:[kStageFileName documentsAppend]];
        if(!_allStageRecords)
        {
            _allStageRecords =[NSMutableDictionary dictionary];
            StageRecord * stageRecord =[[StageRecord alloc]init];
            stageRecord.stageId = 1;
            [_allStageRecords setObject:stageRecord forKey:@(1)];
        }
    }
    return self;
}

#pragma mark 存档
-(void)saveStageRecordWithStagerecord:(StageRecord *)stageRecord
{
    if (stageRecord.stageId <= 0)return;
    [_allStageRecords setObject:stageRecord forKey:@(stageRecord.stageId)];
    
    [NSKeyedArchiver archiveRootObject:_allStageRecords toFile:[kStageFileName documentsAppend]];
    
}
- (void)saveStageRecords:(NSArray *)records
{
    for (StageRecord *record in records) {
        // 1.取出no
        int no = record.stageId;
        if (no <= 0) continue;
        
        // 2.存储数据
        [_allStageRecords setObject:record forKey:@(no)];
    }
    // 3.归档
    NSString *path = [kStageFileName documentsAppend];
    [NSKeyedArchiver archiveRootObject:_allStageRecords toFile:path];
}
#pragma mark 读档
-(StageRecord *)stageRecordWithId:(int)StageId
{
    return _allStageRecords[@(StageId)];
}
@end
