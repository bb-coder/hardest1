//
//  SoundTool.h
//  hardestGame
//
//  Created by bb_coder on 14/8/4.
//  Copyright (c) 2014年 bb_coder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "SoundName.h"
#import "Singleton.h"
@interface SoundTool : NSObject

- (void) playBgMusic;
- (void) playBtnSoundWithFileName:(NSString *) fileName;
@property (nonatomic,setter = setMusicSilent:) BOOL isMusicSilent;
@property (nonatomic,setter = setSoundSilent:) BOOL isSoundSilent;
singletonInterface(SoundTool)
@end
