#import "ARWatchCommunicator.h"
#import <MMWormhole/MMWormhole.h>

@interface ARWatchCommunicator()
@property (readonly, nonatomic, strong) MMWormhole *wormhole;
@end

@implementation ARWatchCommunicator

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    _wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.net.artsy.eigen" optionalDirectory:@"watch"];
    [_wormhole listenForMessageWithIdentifier:@"thing" listener:^(id messageObject) {
        NSLog(@"message for thing %@", messageObject);
    }];

    return self;
}


@end
