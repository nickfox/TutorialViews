//
//  WSAppDelegate.h
//  TutorialViews
//
//  Created by Nick Fox on 6/29/12.
//  Copyright (c) 2012 websmithing.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSViewController;

@interface WSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WSViewController *viewController;

@end
