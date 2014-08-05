//
//  GameViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/3.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "GameViewController.h"
#import "SoundTool.h"
@interface GameViewController ()
{
    CGRect _btnPlayRect;//play按钮
    CGRect _btnSetRect;//设置按钮
    CGRect _btnRankRect;//排名按钮
    CGRect _btnGetRect;//get按钮
    CGRect _btnLauRect;//语言按钮
    CGRect _btnGameRect;//游戏按钮
    
}
@end

@implementation GameViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setFullScreenBgImageWithName:@"home_bg.jpg"];
    [[SoundTool shareSoundToolInstance] playBgMusic];
    //加载plist中的按钮位置
    NSString *  path= [[NSBundle mainBundle] pathForResource:@"home.plist" ofType:nil];
    
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSDictionary * btnRect = nil;
    if (Iphone5)
        btnRect = dict[@"iphone5"];
    else
        btnRect = dict[@"iphone4"];
    
    if (btnRect) {
        _btnPlayRect = CGRectFromString(btnRect[@"btn_play_frame"]);
        _btnSetRect = CGRectFromString(btnRect[@"btn_setting_frame"]);
        _btnRankRect = CGRectFromString(btnRect[@"btn_rank_frame"]);
        _btnLauRect = CGRectFromString(btnRect[@"btn_language_frame"]);
        _btnGetRect = CGRectFromString(btnRect[@"btn_get_frame"]);
        _btnGameRect = CGRectFromString(btnRect[@"btn_more_frame"]);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 监听按钮点击事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(_btnPlayRect, point)) {
        [[SoundTool shareSoundToolInstance] playBtnSoundWithFileName:kSoundClickButtonFileName];
               NSLog(@"点击了play");
        [self performSegueWithIdentifier:@"Stage" sender:nil];
        
    }
    else if (CGRectContainsPoint(_btnSetRect, point))
    {
        [[SoundTool shareSoundToolInstance] playBtnSoundWithFileName:kSoundClickButtonFileName];
        NSLog(@"点击了set");
        [self performSegueWithIdentifier:@"pushSetting" sender:nil];
    }else if (CGRectContainsPoint(_btnGameRect, point))
    {
        [[SoundTool shareSoundToolInstance] playBtnSoundWithFileName:kSoundClickButtonFileName];
        NSLog(@"点击了game");
    }else if (CGRectContainsPoint(_btnLauRect, point))
    {
       [[SoundTool shareSoundToolInstance] playBtnSoundWithFileName:kSoundClickButtonFileName];
        NSLog(@"点击了lauguage");
    }else if (CGRectContainsPoint(_btnRankRect, point))
    {
       [[SoundTool shareSoundToolInstance] playBtnSoundWithFileName:kSoundClickButtonFileName];
                NSLog(@"点击了rank");
    }else if (CGRectContainsPoint(_btnGetRect, point))
    {
       [[SoundTool shareSoundToolInstance] playBtnSoundWithFileName:kSoundClickButtonFileName];
        NSLog(@"点击了get");
    }
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
