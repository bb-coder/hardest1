//
//  PauseViewController.h
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PauseViewController : UIViewController
- (IBAction)resume;
- (IBAction)back;

@property (nonatomic,copy) void(^reusem)();
@end
