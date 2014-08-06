//
//  ReadyViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ReadyViewController.h"
@implementation ReadyViewController

-(void)viewDidLoad
{
    _readyView.info = _info;
    _readyView.removeTitleView = ^{
        _readyScoreView.info = _info;
    };
    [_stageId setText:[NSString stringWithFormat:@"Stage %ld",(long)_info.stageId]];
    [_stageIntro setText:[_info.intro stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    [_stageIcon setImage:[UIImage imageNamed:_info.icon]];
    
}

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}


@end
