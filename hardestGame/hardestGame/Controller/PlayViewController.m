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
#import "ReadyViewController.h"
@interface PlayViewController ()
{
    StageListView * _listView;
}
@end

@implementation PlayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setFullScreenBgImageWithName:@"select_bg.jpg"];
    _listView = [[StageListView alloc]initWithFrame:self.view.bounds];
    _listView.delegate = self;
    _listView.itemClickBlock = ^(StageInfo * info){
        [self performSegueWithIdentifier:@"ready" sender:info];
    };
    [self.view insertSubview:_listView atIndex:0];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ReadyViewController * rc = segue.destinationViewController;
    rc.info = sender;
}


- (IBAction)backClick {
    [[SoundTool shareSoundTool] playBtnSoundWithFileName:kSoundClickButtonFileName];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControler.currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
}
-(void)reloadDataAtNo:(int)stageID
{
    [_listView reloadDataAtNo:stageID];
}
@end
