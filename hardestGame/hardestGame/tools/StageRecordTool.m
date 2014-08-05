//
//  StageRecordTool.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "StageRecordTool.h"
#define kStageFileName @"records.data"
#define kPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:kStageFileName]
@interface StageRecordTool ()
{
    NSMutableDictionary * _allStageRecords;
}

@end


static StageRecordTool * stageRecordTool;

@implementation StageRecordTool

+(id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stageRecordTool = [super allocWithZone:zone];
    });
    return stageRecordTool;
}

+(StageRecordTool *)shareStageRecordTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stageRecordTool = [[self alloc]init];
    });
    return stageRecordTool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

        _allStageRecords = [NSKeyedUnarchiver unarchiveObjectWithFile:kPath];
        if(!_allStageRecords)
        {
            _allStageRecords =[NSMutableDictionary dictionary];
        }
    }
    return self;
}

#pragma mark 存档
-(void)saveStageRecordWithStagerecord:(StageRecord *)stageRecord
{
    if (stageRecord.stageId <= 0)return;
    [_allStageRecords setObject:stageRecord forKey:@(stageRecord.stageId)];
    
    [NSKeyedArchiver archiveRootObject:_allStageRecords toFile:kPath];
    
}
#pragma mark 读档
-(StageRecord *)stageRecordWithId:(int)StageId
{
    return _allStageRecords[@(StageId)];
}
@end
