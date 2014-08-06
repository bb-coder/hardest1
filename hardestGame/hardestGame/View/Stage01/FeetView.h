//
//  FeetView.h
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeetView : UIView

@property (nonatomic,weak) IBOutlet UIImageView * feet;
- (void) start;
- (void) random;
- (BOOL) attack:(int) index;
@end
