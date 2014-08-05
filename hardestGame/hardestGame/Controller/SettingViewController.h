//
//  SettingViewController.h
//  hardestGame
//
//  Created by bb_coder on 14/8/4.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
- (IBAction)backClick;
- (IBAction)musicClick:(UIButton *)sender;
- (IBAction)soundClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;

@end
