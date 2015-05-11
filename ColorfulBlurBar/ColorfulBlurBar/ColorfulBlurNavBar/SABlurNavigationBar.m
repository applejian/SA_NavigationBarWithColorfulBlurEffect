//
//  SABlurNavigationBar.m
//  ColorfulBlurBar
//
//  Created by gaoqiang xu on 5/8/15.
//  Copyright (c) 2015 SealedCompany. All rights reserved.
//

#import "SABlurNavigationBar.h"

@interface SABlurNavigationBar ()
@property (strong, nonatomic) CALayer *backgroundColorLayer;
@end


@implementation SABlurNavigationBar

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_7_0
        || NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) {
        return;
    }
    
    self.barStyle = UIBarStyleBlack;
    self.backgroundColorLayer = [CALayer layer];
    self.backgroundColorLayer.opacity = 0.85f;
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    [super setBarTintColor:barTintColor];
    
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_7_0
        || NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) {
        return;
    }
    
    if (self.backgroundColorLayer && !self.backgroundColorLayer.superlayer) {
        [self.layer addSublayer:self.backgroundColorLayer];
    }
    
    self.backgroundColorLayer.backgroundColor = barTintColor.CGColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.backgroundColorLayer) {
        [self.backgroundColorLayer removeFromSuperlayer];
        CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        self.backgroundColorLayer.frame = CGRectMake(0, -statusBarHeight, CGRectGetWidth(self.frame), statusBarHeight+CGRectGetHeight(self.frame));
        [self.layer insertSublayer:self.backgroundColorLayer atIndex:1];
    }
}

- (void)blurWithColor:(UIColor *)color
{
    self.barTintColor = color;
    self.translucent = YES;
}

- (void)blurWithImage:(UIImage *)image
{
    [self blurWithColor:[UIColor colorWithPatternImage:image]];
}

@end
