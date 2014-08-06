//
//  FeatherView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FeatherView.h"

@implementation FeatherView
-(void)start:(int)index
{
    self.hidden = NO;
    CGRect frame = self.frame;
    frame.origin.x = index * 320/3;    self.frame = frame;
}
@end
