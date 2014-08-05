//
//  PlayViewController.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "PlayViewController.h"
#import "StageListView.h"
#import "SoundTool.h"
@interface PlayViewController ()
{
    
}
@end

@implementation PlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setFullScreenBgImageWithName:@"select_bg.jpg"];
    StageListView * _listView = [[StageListView alloc]initWithFrame:self.view.bounds];
    _listView.delegate = self;
    [self.view insertSubview:_listView atIndex:0];
   
}
- (IBAction)backClick {
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControler.currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
}
@end
