//
//  WSAppDelegate.m
//  TutorialViews
//
//  Created by Nick Fox on 6/29/12.
//  Copyright (c) 2012 websmithing.com. All rights reserved.
//

#import "WSAppDelegate.h"
#import "WSViewController.h"

@implementation WSAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[WSViewController alloc] initWithNibName:@"WSViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
