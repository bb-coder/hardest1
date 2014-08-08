//
//  SoundTool.m
//  hardestGame
//
//  Created by bb_coder on 14/8/4.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import "SoundTool.h"

@interface SoundTool()
{
    AVAudioPlayer * _player;
    NSMutableDictionary * _soundsIds;
}
@end
static SoundTool * tool;
@implementation SoundTool
singletonImplementation(SoundTool)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadSound];
        [self loadMusic];
        _isSoundSilent = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isSoundSilent"] boolValue];
        _isMusicSilent = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isMusicSilent"] boolValue];
    }
    return self;
}



-(void)loadMusic
{
    NSURL * url = [[NSBundle mainBundle] URLForResource:kBgMusicFileName withExtension:nil];
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    [_player prepareToPlay];
    _player.numberOfLoops = -1;
}


-(void)loadSound
{
    _soundsIds = [NSMutableDictionary dictionary];
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"sound.bundle" withExtension:nil];
    NSBundle * bundle = [NSBundle bundleWithURL:url];
    NSArray * urls = [bundle URLsForResourcesWithExtension:@"mp3" subdirectory:nil];
    
    for (NSURL * soundUrl in urls) {
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundUrl), &soundID);
        NSString * component = [soundUrl.path lastPathComponent];
        [_soundsIds setObject:@(soundID) forKey:component];
    }
    
}
- (void)playBgMusic
{
    if (self.isMusicSilent)return;
    
    [_player play];
}

- (void)playBtnSoundWithFileName:(NSString *)fileName
{
    if(self.isSoundSilent)return;
    AudioServicesPlaySystemSound([_soundsIds[fileName] unsignedLongValue]);
}

#pragma mark - 设置静音
#pragma mark 设置音乐静音
-(void)setMusicSilent:(BOOL)isMusicSilent
{
    if (isMusicSilent) {
        [_player pause];
    }
    else
    {
        [_player play];
    }
    _isMusicSilent = isMusicSilent;
}

#pragma mark 设置音效静音
-(void)setSoundSilent:(BOOL)isSoundSilent
{
    _isSoundSilent = isSoundSilent;
}
@end

