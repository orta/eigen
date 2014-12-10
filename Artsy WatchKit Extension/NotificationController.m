#import "NotificationController.h"

@interface NotificationController()
@property (strong, nonatomic) IBOutlet WKInterfaceImage *image;
@end

@implementation NotificationController

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    // Initialize variables here.
    // Configure interface objects here.
    NSLog(@"%@ init", self);
    

    return self;
}

- (void)willActivate
{
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);

}

- (void)didDeactivate
{
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler 
 {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification inteface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
     NSLog(@"LOCAL");
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification inteface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.

    NSLog(@"REMOTE");

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSString *address = remoteNotification[@"image_url"];
        NSURL *url = [NSURL URLWithString:address];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *placeholder = [UIImage imageWithData:data];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.image setImage:placeholder];
        });
    });

    completionHandler(WKUserNotificationInterfaceTypeCustom);
}

@end
