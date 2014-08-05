//
//  FullBgView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/3.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FullBgView.h"


@interface FullBgView()
{
    NSString * _name;
}

@end
@implementation FullBgView

- (void) setFullScreenBgImageWithName:(NSString *) name
{
    _name = name;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if(!_name)return;
    UIImage * image = [UIImage imageNamed:_name];
    if (!Iphone5) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 88, 640, 960));
        image = [UIImage imageWithCGImage:imageRef];
    }
    [image drawInRect:rect];
    
}
@end
