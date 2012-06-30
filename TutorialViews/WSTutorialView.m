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
}

- (void)messageInit;

@end

@implementation WSTutorialView

- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]))
    {
        [self messageInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder*)decoder
{
	if((self = [super initWithCoder:decoder]))
	{
		[self messageInit];
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

- (void)messageInit
{
    self.opaque = NO;
    self.alpha = 0.0;
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
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

    [messageLayer setZPosition:-1.0];
    [self.layer addSublayer:messageLayer];

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
        
    [self addSubview:titleLabel];
    [self addSubview:messageLabel];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextSetRGBFillColor(context, 0.39, 0.99, 0.85, 1.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);

    CGPoint topLeft[] =
	{
		CGPointMake(30.0, 20.0), // x,y
		CGPointMake(40.0, 10.0),
		CGPointMake(50.0, 20.0)
	};
    
	CGContextAddLines(context, topLeft, sizeof(topLeft)/sizeof(topLeft[0]));
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);

    CGContextSetRGBStrokeColor(context, 0.39, 0.99, 0.85, 1.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextMoveToPoint(context, 32.0, 20.0);
    CGContextAddLineToPoint(context, 48.0, 20.0);
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 50.0, 10.0);
    CGContextAddLineToPoint(context, 50.0, 30.0);
    CGContextStrokePath(context);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bounds = [self bounds];
    CGRect titleFrame    = CGRectZero;
    CGRect messageFrame  = CGRectZero;
    
    titleFrame.size.width   = CGRectGetWidth(bounds);
    messageFrame.size.width = CGRectGetWidth(bounds) - 6.0;
    
    titleFrame.size.height   = 20.0;
    messageFrame.size.height = CGRectGetHeight(bounds) - titleFrame.size.height;
    
    titleFrame.origin.y = 20.0;
    messageFrame.origin.y = CGRectGetMaxY(titleFrame);
    messageFrame.origin.x = 3.0;
    
    [titleLabel   setFrame:titleFrame];
    [messageLabel setFrame:messageFrame];
}

- (void)showMessageWithDelay:(int)theDelay 
{
    [UIView animateWithDuration:0.75
                     animations:^{ 
                         self.alpha = 0.9;
                     }];
}

@end

