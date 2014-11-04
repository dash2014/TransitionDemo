//
//  ViewController.m
//  Demo
//
//  Created by dash on 14/11/4.
//  Copyright (c) 2014年 com.dash.Qjie. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Transition.h"
#import "TranstionRight.h"

@interface ViewController ()<UITabBarControllerDelegate>

@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    UISwipeGestureRecognizer *gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft:)];
    gestureRecognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:gestureRecognizerLeft];
    
    UISwipeGestureRecognizer *gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
    gestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:gestureRecognizerLeft];
    [self.view addGestureRecognizer:gestureRecognizerRight];
    
    self.currentIndex = 0;
    self.delegate = self;
}


- (void)didSwipeLeft:(id)sender
{
    if (self.currentIndex == 0) {
        self.currentIndex = 1;
        [self setSelectedIndex:1];
    } else {
        return;
    }
}

- (void)didSwipeRight:(id)sender
{
    if (self.currentIndex == 0) {
        return;
    } else {
        self.currentIndex = 0;
        [self setSelectedIndex:0];
    }
}

- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC
{
    if ([fromVC isKindOfClass:[FirstViewController class]]
        && [toVC isKindOfClass:[SecondViewController class]]) {
        return [Transition new];
    } else {
        return [TranstionRight new];
    }
    return nil;
}

@end
