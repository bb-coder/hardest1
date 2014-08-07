//
//  PauseViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "PauseViewController.h"
#import "SoundTool.h"
@implementation PauseViewController

-(void)viewDidLoad
{
    [self.view setFullScreenBgImageWithName:@"pause_bg.jpg"];
}

- (IBAction)resume
{
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    [self.navigationController popViewControllerAnimated:NO];
    if(self.reusem)
    self.reusem();
}

- (IBAction)back {
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    [self.navigationController popToRootViewControllerAnimated:NO];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
}
@end
