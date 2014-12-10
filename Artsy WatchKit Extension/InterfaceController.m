//
//  InterfaceController.m
//  Artsy WatchKit Extension
//
//  Created by Orta on 09/12/2014.
//  Copyright (c) 2014 Artsy. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context
{
    self = [super initWithContext:context];
    if (!self) return nil;

    // Initialize variables here.
    // Configure interface objects here.
    NSLog(@"%@ initWithContext - %@", self, context);

    

    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



