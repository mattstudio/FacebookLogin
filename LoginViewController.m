//
//  LoginViewController.m
//  FB Login
//
//  Created by Matt Mitchell on 6/12/14.
//  Copyright (c) 2014 Matt Mitchell. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
- (IBAction)onBackgroundViewTap:(id)sender;

@end

@implementation LoginViewController

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
    
    self.view.backgroundColor = [UIColor colorWithRed:0.235 green:0.325 blue:0.604 alpha:1];
    
    self.signInButton.backgroundColor = [UIColor colorWithRed:0.310 green:0.396 blue:0.647 alpha:1];
    self.signInButton.layer.cornerRadius = 3;
    self.signInButton.layer.masksToBounds = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)onBackgroundViewTap:(id)sender {
        [self.view endEditing:YES];
}
@end
