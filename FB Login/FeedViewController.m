//
//  FeedViewController.m
//  FB Login
//
//  Created by Matt Mitchell on 6/15/14.
//  Copyright (c) 2014 Matt Mitchell. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedActivityIndicator;

- (UIStatusBarStyle)preferredStatusBarStyle;
- (void)loadFeed;

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
    self.view.backgroundColor = [UIColor colorWithRed:0.827 green:0.839 blue:0.859 alpha:1];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.310 green:0.396 blue:0.647 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = @"Feed View";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    UIImage *leftButtonImage = [[UIImage imageNamed:@"nav_searchicon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIImage *rightButtonImage = [[UIImage imageNamed:@"nav_divebarglyph"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;

    [self.feedActivityIndicator startAnimating];
    [self performSelector:@selector(loadFeed) withObject:nil afterDelay:2];
}

- (void)loadFeed
{
    UIScrollView *feedScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIImageView *feedImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"feed-1"]];
    feedImageView.frame = CGRectMake(0, 0, 320, 1455);
    
    feedScrollview.backgroundColor = [UIColor colorWithRed:0.827 green:0.839 blue:0.859 alpha:1];
    [feedScrollview addSubview:feedImageView];
    feedScrollview.contentSize = feedImageView.frame.size;
    feedScrollview.minimumZoomScale = 1;
    feedScrollview.maximumZoomScale = 1;
    [feedScrollview setZoomScale:feedScrollview.minimumZoomScale];
    feedScrollview.delegate = self;
    [self.view addSubview:feedScrollview];
    
    [self.feedActivityIndicator stopAnimating];
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

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
