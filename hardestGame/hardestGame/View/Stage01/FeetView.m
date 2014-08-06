//
//  FeetView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "FeetView.h"

@interface FeetView()
{
    
}
@end

@implementation FeetView

-(void)awakeFromNib
{
    _feet.animationImages = @[
                              [UIImage imageNamed:@"01-feet01.png"],
                              [UIImage imageNamed:@"01-feet02.png"],
                              [UIImage imageNamed:@"01-feet02.png"],
                              [UIImage imageNamed:@"01-feet02.png"],
                              [UIImage imageNamed:@"01-feet03.png"]
                              ];
    _feet.animationRepeatCount = 1;
}

-(void)start
{
    self.hidden = NO;
    [self random];
}

-(int) currentIndex
{
    return self.frame.origin.x / self.frame.size.width;
}

-(void)random
{
    [_feet stopAnimating];
    int oldIndex = [self currentIndex];
    int index = oldIndex;
    while (index == oldIndex) {
        index = arc4random_uniform(3);
    }
    
    CGRect frame = self.frame;
    frame.origin.x = index * self.frame.size.width;
    self.frame = frame;
    
    
}

-(BOOL)attack:(int)index
{
    if ([self currentIndex] == index) {
        [_feet startAnimating];
        return YES;
    }
    return NO;
}

@end
