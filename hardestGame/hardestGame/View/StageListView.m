//
//  StageListView.m
//  hardestGame
//
//  Created by bb_coder on 14/8/5.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "StageListView.h"
#import "FullBgView.h"
#import "StageInfo.h"
#import "StageView.h"
@implementation StageListView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadBg];
        self.frame = frame;
        self.contentSize = CGSizeMake(self.frame.size.width * 4,0);
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        [self loadInfo];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark 加载背景
- (void) loadBg
{
    [self addBgWithName:@"select_easy_bg.jpg" andIndex:0];
    [self addBgWithName:@"select_normal_bg.jpg" andIndex:1];
    [self addBgWithName:@"select_hard_bg.jpg" andIndex:2];
    [self addBgWithName:@"select_insane_bg.jpg" andIndex:3];
}
#pragma mark 加载关卡信息
- (void) loadInfo 
{
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"stages" withExtension:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfURL:url];
    unsigned long count = array.count;
    
    // 固定数值
    CGSize viewSize = self.frame.size;
    CGFloat stageViewWdith = 110;
    CGFloat stageViewHeight = 93;
    
    
    // 水平间距
    CGFloat marginX = 30;
    // 垂直间距
    CGFloat marginY = 30;
    
    // 开始的y
    CGFloat startY = 90 + (Iphone5?44:0);
    for (int i = 0; i < count; i++) {
        NSDictionary * dict = array[i];
        NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"StageView" owner:nil options:nil];
        StageInfo * info = [StageInfo setStageInfoWithDict:dict];
        info.stageId = i + 1;
        StageView * stageView = views[0];
        stageView.info = info;
        CGFloat startX = (viewSize.width - 2 * stageViewWdith - marginX) * 0.5 + (i/6) * viewSize.width;
        
        // y
        CGFloat y = startY + (i%3) * (stageViewHeight + marginY);
        CGFloat x = startX + (i/3)%2 * (stageViewWdith + marginX);
        
        CGRect frame = stageView.frame;
        frame.origin.x = x;
        frame.origin.y = y;
        stageView.frame = frame;

        [self addSubview:stageView];
        [stageView sendSubviewToBack:self];
        
    }
}

#pragma mark 添加背景图片根据图片名
- (void) addBgWithName:(NSString *) Name andIndex:(int) index
{
    FullBgView * bgView = [[FullBgView alloc]init];
    CGRect frame = self.frame;
    frame.origin.x = index * self.frame.size.width;
    bgView.frame = frame;
    [bgView setFullScreenBgImageWithName:Name];
    [self addSubview:bgView];
}



@end
