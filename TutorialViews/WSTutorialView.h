//
//  WSTutorialView.h
//  TutorialViews
//
//  Created by Nick Fox on 6/29/12.
//  Copyright (c) 2012 websmithing.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSTutorialView : UIView

- (void)setTitle:(NSString *)title;
- (void)setMessage:(NSString *)message;
- (void)showMessageWithDelay:(int)delay;

@end
