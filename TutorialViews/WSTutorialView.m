//
//  WSTutorialView.m
//  TutorialViews
//
//  Created by Nick Fox on 6/29/12.
//  Copyright (c) 2012 websmithing.com. All rights reserved.
//

#import "WSTutorialView.h"
#import <QuartzCore/QuartzCore.h>

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 \
green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 \
blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]

@interface WSTutorialView()
{
    UILabel *titleLabel;
    UILabel *messageLabel;
    UIButton *closeButton;
}

- (void)WS_commonTutorialViewInit;
- (void)closeTutorialView:(id)sender;
@end

@implementation WSTutorialView

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]))
    {
        [self WS_commonTutorialViewInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder*)decoder
{
	if((self = [super initWithCoder:decoder]))
	{
		[self WS_commonTutorialViewInit];
	}
	return self;
}

- (void)setTitle:(NSString *)theTitle
{
    [titleLabel setText:theTitle];   
}

- (void)setMessage:(NSString *)theMessage
{
    [messageLabel setText:theMessage];  
}

- (void)WS_commonTutorialViewInit
{
    self.opaque = NO;
    self.alpha = 0.0;
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    CALayer *messageLayer = [CALayer layer];
    messageLayer.frame = CGRectMake(20.0, 20.0, self.layer.frame.size.width-40.0, self.layer.frame.size.height-40.0);    
    messageLayer.backgroundColor = UIColorFromRGB(0x65FCD9).CGColor;
    messageLayer.cornerRadius = 10.0;
    messageLayer.borderColor = [UIColor blackColor].CGColor;
    messageLayer.borderWidth = 1.0;
    messageLayer.shadowOffset = CGSizeMake(3.0, 3.0);
    messageLayer.shadowColor = [UIColor blackColor].CGColor;
    messageLayer.shadowOpacity = 0.4;
    messageLayer.shadowRadius =  3.0;

    [self.layer addSublayer:messageLayer];
    
    CAShapeLayer *arrowLayer = [CAShapeLayer layer];
    arrowLayer.frame = CGRectMake(35.0, 0.0, 40.0, 40.0); // x,y,w,h   
    //arrowLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [arrowLayer setLineJoin:kCALineJoinRound];
    [arrowLayer setStrokeColor:[UIColor blackColor].CGColor];
    [arrowLayer setLineWidth:1.0];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint topLeft[] =
	{
		CGPointMake(0.0, 20.0),
		CGPointMake(10.0, 10.0),
		CGPointMake(20.0, 20.0)
	};
    CGPathAddLines(path, NULL, topLeft, 3);
    CGPathCloseSubpath(path);
    [arrowLayer setPath:path]; 
    
    [self.layer addSublayer:arrowLayer];   
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextAlignment:UITextAlignmentCenter];
    [titleLabel setContentMode:UIViewContentModeCenter];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    
    messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [messageLabel setBackgroundColor:[UIColor clearColor]];
    [messageLabel setTextAlignment:UITextAlignmentCenter];
    [messageLabel setContentMode:UIViewContentModeCenter];
    [messageLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [messageLabel setLineBreakMode:UILineBreakModeWordWrap];
    [messageLabel setNumberOfLines:0];
    
    UIImage *closeImage = [UIImage imageNamed: @"close"];
    closeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [closeButton setBackgroundImage: closeImage forState: UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeTutorialView:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:titleLabel];
    [self addSubview:messageLabel];
    [self addSubview:closeButton];    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bounds       = [self bounds];
    CGRect titleFrame   = CGRectZero;
    CGRect messageFrame = CGRectZero;
    CGRect buttonFrame  = CGRectZero;
    
    UIImage *closeImage = [UIImage imageNamed: @"close"];
    
    titleFrame.size.width   = CGRectGetWidth(bounds);
    messageFrame.size.width = CGRectGetWidth(bounds) - 6.0;
    buttonFrame.size.width  = closeImage.size.width;
    
    titleFrame.size.height   = 20.0;
    messageFrame.size.height = CGRectGetHeight(bounds) - titleFrame.size.height;
    buttonFrame.size.height   = closeImage.size.height;
    
    titleFrame.origin.y = 24.0;
    titleFrame.origin.x = -7.0;
    messageFrame.origin.y = CGRectGetMaxY(titleFrame);
    messageFrame.origin.x = 3.0;
    buttonFrame.origin.x = CGRectGetWidth(bounds)-43.0;
    buttonFrame.origin.y = 25.0;
    
    [titleLabel   setFrame:titleFrame];
    [messageLabel setFrame:messageFrame];
    [closeButton setFrame:buttonFrame];
}

- (void)closeTutorialView:(id) sender
{
    [UIView animateWithDuration:0.75
                     animations:^{ 
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
}

- (void)showMessageWithDelay:(int)theDelay 
{
    [UIView animateWithDuration:0.75
                     animations:^{ 
                         self.alpha = 1.0;
    }];
}

@end

