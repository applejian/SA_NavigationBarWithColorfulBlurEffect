//
//  SecondViewController.m
//  ColorfulBlurBar
//
//  Created by gaoqiang xu on 5/8/15.
//  Copyright (c) 2015 SealedCompany. All rights reserved.
//

#import "SecondViewController.h"
#import "SABlurNavigationBar.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SABlurNavigationBar *navBar = (SABlurNavigationBar *)self.navigationController.navigationBar;
    [navBar blurWithImage:[self createNavImage]];
}

/**
 *  Create a gradient style image
 *
 */
- (UIImage *)createNavImage
{
    UIImage *image = nil;
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    UIGraphicsBeginImageContext(CGSizeMake(CGRectGetWidth(bounds), 44.f));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef beginColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.9f, 0.1f, 0.01f, .7f});
    CGColorRef endColor = CGColorCreate(colorSpaceRef, (CGFloat[]){0.01f, 0.88f, 0.11f, .7f});
    CFArrayRef colorArray = CFArrayCreate(kCFAllocatorDefault, (const void*[]){beginColor, endColor}, 2, nil);
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpaceRef, colorArray, (CGFloat[]){
        0.0f,
        1.0f
    });
    
    CFRelease(colorArray);
    CGColorRelease(beginColor);
    CGColorRelease(endColor);
    CGColorSpaceRelease(colorSpaceRef);
    
    CGContextDrawLinearGradient(context, gradientRef, CGPointMake(0.0f, 0.0f), CGPointMake(CGRectGetWidth(bounds), 44.0f), 0);
    CGGradientRelease(gradientRef);
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
