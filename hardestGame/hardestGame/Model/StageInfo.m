//
//  StageInfo.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "StageInfo.h"

@implementation StageInfo

+ (instancetype) setStageInfoWithDict:(NSDictionary *) dict
{
    StageInfo * stage = [[StageInfo alloc]init];
    
    stage.icon = dict[@"icon"];
    stage.title = dict[@"title"];
    stage.intro = dict[@"intro"];
    stage.max = dict[@"max"];
    stage.min = dict[@"min"];
    
    return  stage;
}
@end
