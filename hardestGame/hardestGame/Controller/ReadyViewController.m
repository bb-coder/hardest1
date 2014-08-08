//
//  ReadyViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/6.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "ReadyViewController.h"
#import "SoundTool.h"
#import "Stage01Controller.h"
@implementation ReadyViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _readyView.info = _info;
    _readyView.removeTitleView = ^{
        _readyScoreView.info = _info;
    };
    [_stageId setText:[NSString stringWithFormat:@"Stage %ld",(long)_info.stageId]];
    [_stageIntro setText:[_info.intro stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"]];
    [_stageIcon setImage:[UIImage imageNamed:_info.icon]];
    
}

- (IBAction)backClick:(id)sender {
    [[SoundTool shareSoundTool]playBtnSoundWithFileName:kSoundClickButtonFileName];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    Stage01Controller * vc =  segue.destinationViewController;
    vc.info = _info;
}

@end
