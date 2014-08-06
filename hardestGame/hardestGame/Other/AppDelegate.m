//
//  AppDelegate.m
//  hardestGame
//
//  Created by bb_coder on 14/8/3.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "AppDelegate.h"
#import "SoundTool.h"
#import "StageRecord.h"
#import "StageRecordTool.h"
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 测试代码
    StageRecord *m1 = [[StageRecord alloc] init];
    m1.stageId = 1;
    m1.score = 26;
    m1.rank = @"s";
    m1.unlocked = YES;
    
    StageRecord *m2 = [[StageRecord alloc] init];
    m2.stageId = 2;
    m2.score = 9.2;
    m2.rank = @"s";
    m2.unlocked = YES;
    
    StageRecord *m3 = [[StageRecord alloc] init];
    m3.stageId = 3;
    m3.score = 1120;
    m3.rank = @"c";
    m3.unlocked = YES;
    
    StageRecord *m4 = [[StageRecord alloc] init];
    m4.stageId = 4;
    m4.score = 205;
    m4.rank = @"s";
    m4.unlocked = YES;
    
    StageRecord *m5 = [[StageRecord alloc] init];
    m5.stageId = 5;
    m5.score = 27;
    m5.rank = @"a";
    m5.unlocked = YES;
    
    StageRecord *m6 = [[StageRecord alloc] init];
    m6.stageId = 6;
    //m6.unlocked = YES;
    
    [[StageRecordTool shareStageRecordTool] saveStageRecords:@[m1, m2, m3, m4, m5, m6]];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [[NSUserDefaults standardUserDefaults] setObject:@([SoundTool shareSoundTool].isSoundSilent) forKey:@"isSoundSilent"];
    [[NSUserDefaults standardUserDefaults] setObject:@([SoundTool shareSoundTool].isMusicSilent) forKey:@"isMusicSilent"];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
