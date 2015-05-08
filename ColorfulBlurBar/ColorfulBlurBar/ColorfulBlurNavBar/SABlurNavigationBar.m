//
//  SABlurNavigationBar.m
//  ColorfulBlurBar
//
//  Created by gaoqiang xu on 5/8/15.
//  Copyright (c) 2015 SealedCompany. All rights reserved.
//

#import "SABlurNavigationBar.h"

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
