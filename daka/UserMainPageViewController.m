//
//  UserMainPageViewController.m
//  daka
//
//  Created by Luming Nie on 8/3/14.
//  Copyright (c) 2014 bobatea. All rights reserved.
//

#import "UserMainPageViewController.h"
#import "RandomPicPageViewController.h"
#import "RKSwipeBetweenViewControllers.h"

@interface UserMainPageViewController ()

@end

@implementation UserMainPageViewController

@synthesize desc;
@synthesize recipeDesc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidAppear:(BOOL)animated{
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.desc.text = self.recipeDesc;
    
//    UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeHandle:)];
//    leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
//    [leftRecognizer setNumberOfTouchesRequired:1];
//    [self.view addGestureRecognizer:leftRecognizer];
    
    UIPageViewController *pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    RKSwipeBetweenViewControllers *navigationController = [[RKSwipeBetweenViewControllers alloc]initWithRootViewController:pageController];
    
    UIViewController *UserMainPage = [[UIViewController alloc]init];
    RandomPicPageViewController *RandomPicPage = [[RandomPicPageViewController alloc]init];
    
    [navigationController.viewControllerArray addObjectsFromArray:@[UserMainPage, RandomPicPage,]];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}


//- (void)leftSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
//{
//    //Do moving
//    [self performSegueWithIdentifier:@"swipToRandomPicPage" sender:self];
//}


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

@end
