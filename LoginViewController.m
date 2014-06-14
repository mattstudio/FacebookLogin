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
@property (weak, nonatomic) IBOutlet UIView *loginTopView;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)onLoginBackgroundViewTap:(id)sender;
- (IBAction)onEmailValueChanged:(id)sender;
- (IBAction)onPasswordValueChanged:(id)sender;
- (IBAction)onSignInButton:(id)sender;



- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)validateForm;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"Hello");
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.235 green:0.325 blue:0.604 alpha:1];
    
    self.signInButton.backgroundColor = [UIColor colorWithRed:0.310 green:0.396 blue:0.647 alpha:1];
    self.signInButton.layer.cornerRadius = 3;
    self.signInButton.layer.masksToBounds = YES;
    
    [self validateForm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)onLoginBackgroundViewTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEmailValueChanged:(id)sender {
    
    NSLog(@"Email changed");
    
    [self validateForm];
}

- (IBAction)onPasswordValueChanged:(id)sender {

    NSLog(@"Password changed");
    
    [self validateForm];
}

- (IBAction)onSignInButton:(id)sender {
    
}

- (void)validateForm {
    if ((self.emailTextField.text.length > 0) && (self.passwordTextField.text.length > 0)) {
        [self.signInButton setEnabled:YES];
        NSLog(@"Yes, it's valid.");
    }
    else {
        [self.signInButton setEnabled:NO];
        NSLog(@"No, not valid.");
    }
    
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginTopView.frame = CGRectMake(0, 0, self.loginTopView.frame.size.width, self.loginTopView.frame.size.height);
                         
                         self.signUpButton.frame = CGRectMake(0, self.loginTopView.frame.size.height, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);
                     }
                     completion:nil];
    
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.loginTopView.frame = CGRectMake(0, 100, self.loginTopView.frame.size.width, self.loginTopView.frame.size.height);
                         
                         //Put the sign up button back in its original position
                         self.signUpButton.frame = CGRectMake(0, self.loginTopView.frame.size.height + self.loginTopView.frame.origin.y + 78, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);
                     }
                     completion:nil];
}

@end
