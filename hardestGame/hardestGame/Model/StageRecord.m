//
//  StageRecord.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "StageRecord.h"

@implementation StageRecord

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.score = [aDecoder decodeDoubleForKey:@"score"];
        self.rank = [aDecoder decodeObjectForKey:@"rank"];
        self.stageId = [aDecoder decodeIntForKey:@"stageId"];
        self.unlocked = [aDecoder decodeBoolForKey:@"unlocked"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.rank forKey:@"rank"];
    [aCoder encodeDouble:self.score forKey:@"score"];
    [aCoder encodeInt:self.stageId forKey:@"stageId"];
    [aCoder encodeBool:self.isUnlocked forKey:@"unlocked"];
}
@end
