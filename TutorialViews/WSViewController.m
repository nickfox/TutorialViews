//
//  WSViewController.m
//  TutorialViews
//
//  Created by Nick Fox on 6/29/12.
//  Copyright (c) 2012 websmithing.com. All rights reserved.
//

#import "WSViewController.h"
#import "WSTutorialView.h"

@implementation WSViewController

@synthesize toolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(startTutorial:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *infoBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    self.toolbar.items = [NSArray arrayWithObjects:infoBarButtonItem, nil];  
}

- (void)startTutorial:(id)sender
{

     WSTutorialView *msgView = [[WSTutorialView alloc] initWithFrame:CGRectMake(100.0, 100.0, 200.0, 200.0)];
     [msgView setTitle:@"Momo Alert"];
     [msgView setMessage:@"You a good momo."];
     
     [self.view addSubview:msgView];
     [msgView showMessageWithDelay:3];

}

- (void)viewDidUnload
{
    [self setToolbar:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
