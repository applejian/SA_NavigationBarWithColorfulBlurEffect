//
//  FirstViewController.m
//  ColorfulBlurBar
//
//  Created by gaoqiang xu on 5/8/15.
//  Copyright (c) 2015 SealedCompany. All rights reserved.
//

#import "FirstViewController.h"
#import "SABlurNavigationBar.h"

@interface FirstViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeNavBarColor];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:4
                                                  target:self
                                                selector:@selector(timerAction)
                                                userInfo:nil
                                                 repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5f];
    [self changeNavBarColor];
    [UIView commitAnimations];
}

- (void)changeNavBarColor
{
    SABlurNavigationBar *navBar = (SABlurNavigationBar *)self.navigationController.navigationBar;
    [navBar blurWithColor:[UIColor colorWithRed:arc4random()%255/255.f
                                          green:arc4random()%255/255.f
                                           blue:arc4random()%255/255.f
                                          alpha:(1+arc4random()%10)/10.f]];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
