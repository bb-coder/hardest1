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
    //模拟数据
    {
        StageRecord * r1 = [[StageRecord alloc]init];
        r1.stageId = 1;
        r1.rank = @"s";
        r1.unlocked = YES;
        [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:r1];
        StageRecord * r2 = [[StageRecord alloc]init];
        r2.stageId = 2;
        r2.rank = @"s";
        r2.unlocked = YES;
        [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:r2];
        StageRecord * r3 = [[StageRecord alloc]init];
        r3.stageId = 3;
        r3.rank = @"s";
        r3.unlocked = YES;
        [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:r3];
        StageRecord * r4 = [[StageRecord alloc]init];
        r4.stageId = 4;
        r4.rank = @"s";
        r4.unlocked = YES;
        [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:r4];
        StageRecord * r5 = [[StageRecord alloc]init];
        r5.stageId = 5;
        r5.rank = @"c";
        r5.unlocked = YES;
        [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:r5];
        StageRecord * r6 = [[StageRecord alloc]init];
        r6.stageId = 6;
        [[StageRecordTool shareStageRecordTool] saveStageRecordWithStagerecord:r6];
    }
    
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
