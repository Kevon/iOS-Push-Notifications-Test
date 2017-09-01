//
//  AppDelegate.m
//  Push It to the Limit
//
//  Created by Kevin on 5/25/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    application.applicationIconBadgeNumber = 0;
    UILocalNotification *localNotif = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if(localNotif){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"It's Time for a Notification" message:@"Launched from the background." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *button = [UIAlertAction actionWithTitle:@"Go Away" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:button];
        dispatch_async(dispatch_get_main_queue(), ^{[application.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];});
    }
    return YES;
}

- (void) application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
    application.applicationIconBadgeNumber = 0;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"It's Time for a Notification" message:@"Now we're in the foreground." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *button = [UIAlertAction actionWithTitle:@"Go Away" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:button];
    dispatch_async(dispatch_get_main_queue(), ^{[application.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];});
}

@end
