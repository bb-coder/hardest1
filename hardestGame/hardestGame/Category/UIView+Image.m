//
//  UIView+Image.m
//  hardestGame
//
//  Created by bb_coder on 14/8/3.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "UIView+Image.h"

@implementation UIView (Image)
- (void)clearAlias
{
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    // 就会把图层当做是一个bitmap来渲染
    self.layer.shouldRasterize = YES;
    
    for (UIView *child in self.subviews) {
        [child clearAlias];
    }
}
@end
