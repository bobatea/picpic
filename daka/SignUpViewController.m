//
//  SignUpViewController.m
//  daka
//
//  Created by Luming Nie on 7/27/14.
//  Copyright (c) 2014 bobatea. All rights reserved.
//

#import "SignUpViewController.h"
#import "NetWorkApi.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password1;
@property (weak, nonatomic) IBOutlet UITextField *password2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;

@end

@implementation SignUpViewController

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
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


-(void) showAlert:(NSString *)title message:(NSString*) message{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    //[alert release];
}


- (IBAction)signUp:(id)sender {
    if([_userName.text isEqual:@""] || [_password1.text isEqual:@""] || [_password2.text isEqual:@""] ){
        [self showAlert:@"Error" message:@"Plase fill all fields."];
    }else if(![_password1.text isEqualToString: _password2.text] ){
        [self showAlert:@"Error" message: @"Password dissmatch, please try again."];
    }else if(_password1.text.length < 6){
        [self showAlert:@"Error" message:  @"Password needs at least 6 characters."];
    }else{
        NSLog(@"sign up a new user: @%@, password:@%@, gender:@%d",_userName.text,_password1.text, _gender.selectedSegmentIndex);
        [NetWorkApi signUpAccountWithUserName:_userName.text
                                     password:_password1.text
                                       gender:_gender.selectedSegmentIndex
                                   completion:^(BOOL success, NSString* desc) {
                                       if (success) {
                                           [self showAlert:@"Cangraulations!" message: @"Sign Up Success! Tap OK to login"];
                                           [self performSegueWithIdentifier:@"signUpSuccess" sender:self];
                                           
                                       } else {
                                           [self showAlert:@"Error!" message: desc];
                                       }
                                   }];
    }
}


-(void)dismissKeyboard {
    [self.view endEditing:YES];
} //make the view end editing!


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
