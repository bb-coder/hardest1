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
@property (weak, nonatomic) IBOutlet UIImageView *pageImageView;
- (IBAction)left:(id)sender;
- (IBAction)right:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *pageDot;

@property (nonatomic,copy) void(^reusem)();
@end
