//
//  PlayViewController.h
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController<UIScrollViewDelegate>
- (IBAction)backClick;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControler;
- (void) reloadDataAtNo:(int) stageID;
@end
