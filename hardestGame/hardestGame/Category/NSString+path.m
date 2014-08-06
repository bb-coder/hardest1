//
//  NSString+path.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "NSString+path.h"
@implementation NSString (path)
-(NSString *)documentsAppend
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths[0];
    return [path stringByAppendingPathComponent:self];
}
@end
