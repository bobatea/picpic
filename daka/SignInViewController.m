//
//  SignInViewController.m
//  daka
//
//  Created by Luming Nie on 7/27/14.
//  Copyright (c) 2014 bobatea. All rights reserved.
//

#import "SignInViewController.h"
#import "NetWorkApi.h"
#import "DataHelper.h"
#import "Notification.h"
#import "UserMainPageViewController.h"

@interface SignInViewController ()
- (IBAction)SignIn:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property NSString *apiDesc;

@end

@implementation SignInViewController

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

-(void)dismissKeyboard {
    [self.view endEditing:YES];
} //make the view end editing!

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) getNotification
{
    NSLog(@"getNotification");
    [NetWorkApi getNotification:0 completion:^(NSMutableArray *notificationList) {
        [DataHelper setNotification:notificationList];
    }];
    
    [self performSelector:@selector(getNotification) withObject:self afterDelay:15.0f];
}

- (IBAction)SignIn:(id)sender {

    //    [NetWorkApi candidatesList:25
    //                    completion:^(NSMutableArray *candidates){
    //
    //                    }];
    
    [NetWorkApi signInAccountWithUserName:self.username.text
                                 password:self.password.text
                               completion:^(BOOL success, NSString* desc) {
                                   if (success) {
                                       //[self performSelector:@selector(getNotification) withObject:self];
                                       NSLog(@"-------------login Success-------------");
                                       NSLog(@"%@", desc);
                                       self.apiDesc = desc;
                                       //After getting success, do this:
                                       [self performSegueWithIdentifier:@"SignInSuccess" sender:self];
                                   } else {
                                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"user name or password dismatch"
                                                                                       message:@"You need to type your user name or password again."
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"OK"
                                                                             otherButtonTitles:nil];
                                       [alert show];
                                   }
                               }];
    
    
    // [alert release];

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqual:@"SignInSuccess"]) {
        UserMainPageViewController *destVC = segue.destinationViewController;
        destVC.recipeDesc = self.apiDesc;
    }

}



@end
