//
//  FailVIew.h
//  hardestGame
//
//  Created by bb_coder on 14/8/8.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullBgView.h"
@interface FailView : FullBgView
@property (weak, nonatomic) IBOutlet UIView *boyAndWord;
@property (weak, nonatomic) IBOutlet UIView *prison;
- (IBAction)retry;
- (IBAction)home;
@property (weak, nonatomic) IBOutlet UILabel *ownerScore;
@property (weak, nonatomic) IBOutlet UILabel *condition;
@property (nonatomic,assign) double scoreNew;

- (void)begin;
@end
