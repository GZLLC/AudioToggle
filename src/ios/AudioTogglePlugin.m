#import "AudioTogglePlugin.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation AudioTogglePlugin

- (void)setAudioMode:(CDVInvokedUrlCommand *)command
{
    NSError* __autoreleasing err = nil;
    NSString* mode = [NSString stringWithFormat:@"%@", [command.arguments objectAtIndex:0]];

    AVAudioSession *session = [AVAudioSession sharedInstance];

    if ([mode isEqualToString:@"earpiece"]) {
        [session setCategory:AVAudioSessionCategoryPlayAndRecord mode:AVAudioSessionModeVoiceChat options:AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers error:&err];
        [session overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&err];
        [session setActive:true error:&err];
    } else if ([mode isEqualToString:@"speaker"] || [mode isEqualToString:@"ringtone"]) {
        [session setCategory:AVAudioSessionCategoryPlayAndRecord mode:AVAudioSessionModeVideoChat options:AVAudioSessionCategoryOptionAllowBluetoothA2DP error:&err];
        [session setActive:true error:&err];
    } else if ([mode isEqualToString:@"normal"]) {
        [session setCategory:AVAudioSessionCategorySoloAmbient error:&err];
        [session setMode:AVAudioSessionModeDefault error:&err];
    }
}

@end
