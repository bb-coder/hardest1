//
//  PauseViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/7.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "PauseViewController.h"
#import "SoundTool.h"
#import <QuartzCore/QuartzCore.h>
@interface PauseViewController()
{
    int _currentPageIndex;
    NSTimer * _timer;
}

@end

@implementation PauseViewController

-(void)viewDidLoad
{
    [self.view setFullScreenBgImageWithName:@"pause_bg.jpg"];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(step) userInfo:nil repeats:YES];
    _currentPageIndex = 1;
    
    
}

- (void) step
{
    _currentPageIndex ++;
    
    [self change];
}
- (void) change
{
    if (_currentPageIndex > 4) {
        _currentPageIndex = 1;
    }
    else if (_currentPageIndex < 1)
    {
        _currentPageIndex = 4;
    }
    CATransition * anim = [CATransition animation];
    anim.type = @"rippleEffect";
    _pageImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad0%d.png",_currentPageIndex]];
    [_pageImageView.layer addAnimation:anim forKey:nil];
    for (int i = 0; i < 4; i++) {
        UIImageView * imageView =_pageDot[i];
        if (imageView.tag + 1 == _currentPageIndex) {
            imageView.image = [UIImage imageNamed:@"pagedot02.png"];
        }
        else
        {
            imageView.image = [UIImage imageNamed:@"pagedot01.png"];
        }
    }
    
    
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
- (IBAction)left:(id)sender {
    [_pageImageView stopAnimating];
    _currentPageIndex--;
    [self change];
}

- (IBAction)right:(id)sender {
    [_pageImageView stopAnimating];
    _currentPageIndex++;
    [self change];
}
@end
