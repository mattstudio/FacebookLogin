//
//  FeedViewController.m
//  FB Login
//
//  Created by Matt Mitchell on 6/15/14.
//  Copyright (c) 2014 Matt Mitchell. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica Neue Bold" size:14], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.310 green:0.396 blue:0.647 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    UIImage *leftButtonImage = [[UIImage imageNamed:@"nav_searchicon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIImage *rightButtonImage = [[UIImage imageNamed:@"nav_divebarglyph"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onLeftButton:(id)sender
{
    NSLog(@"Left button pressed.");
}

- (void)onRightButton:(id)sender
{
    NSLog(@"Right button pressed.");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
