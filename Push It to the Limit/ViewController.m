//
//  ViewController.m
//  Push It to the Limit
//
//  Created by Kevin on 5/25/16.
//  Copyright © 2016 Kevin Skompinski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) requestPermission;
- (void) createNotification:(int)secondsInThefuture;

@end

@implementation ViewController

- (void) requestPermission{
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void) createNotification:(int)secondsInThefuture{
    UILocalNotification *notif = [[UILocalNotification alloc] init];
    notif.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInThefuture];
    notif.timeZone = nil;
    notif.alertTitle = @"15 Seconds Has Passed";
    notif.alertBody = @"Click here to further the plot.";
    notif.alertAction = @"Go Away";
    notif.soundName = UILocalNotificationDefaultSoundName;
    notif.applicationIconBadgeNumber = 1738;
    [[UIApplication sharedApplication] scheduleLocalNotification:notif];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonTapped:(id)sender {
    [self requestPermission];
    [self createNotification:15];
}

@end
