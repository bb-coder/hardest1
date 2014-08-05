//
//  SettingViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/4.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "SettingViewController.h"
#import "SoundTool.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setFullScreenBgImageWithName:@"setting_bg.jpg"];
    // Do any additional setup after loading the view from its nib.
    if ([[SoundTool shareSoundToolInstance] isMusicSilent])
        [_musicButton setTitle:@"音乐 ［关］" forState:UIControlStateNormal];
    else
        [_musicButton setTitle:@"音乐 ［开］" forState:UIControlStateNormal];
    if ([[SoundTool shareSoundToolInstance] isSoundSilent])
        [_soundButton setTitle:@"音效 ［关］" forState:UIControlStateNormal];
    else
        [_soundButton setTitle:@"音效 ［开］" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClick {
    [self.navigationController popViewControllerAnimated:NO];
    [[SoundTool shareSoundToolInstance]playBtnSoundWithFileName:kSoundClickButtonFileName];
}

- (IBAction)musicClick:(UIButton *)sender {
    [[SoundTool shareSoundToolInstance]playBtnSoundWithFileName:kSoundClickButtonFileName];
    if (![[SoundTool shareSoundToolInstance] isMusicSilent]) {
        [sender setTitle:@"音乐 ［关］" forState:UIControlStateNormal];
        [[SoundTool shareSoundToolInstance] setMusicSilent:YES];
    }
    else
    {
        [sender setTitle:@"音乐 ［开］" forState:UIControlStateNormal];
        [[SoundTool shareSoundToolInstance] setMusicSilent:NO];
    }
}

- (IBAction)soundClick:(UIButton *)sender {
        [[SoundTool shareSoundToolInstance]playBtnSoundWithFileName:kSoundClickButtonFileName];
    if (![[SoundTool shareSoundToolInstance] isSoundSilent]) {
        [sender setTitle:@"音效 ［关］" forState:UIControlStateNormal];
        [[SoundTool shareSoundToolInstance] setSoundSilent:YES];
    }
    else
    {
        [sender setTitle:@"音效 ［开］" forState:UIControlStateNormal];
        [[SoundTool shareSoundToolInstance] setSoundSilent:NO];
    }
}


@end
