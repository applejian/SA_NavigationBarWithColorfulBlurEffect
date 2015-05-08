//
//  SABlurNavigationBar.h
//  ColorfulBlurBar
//
//  Created by gaoqiang xu on 5/8/15.
//  Copyright (c) 2015 SealedCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SABlurNavigationBar : UINavigationBar

/**
 *  Change blur color
 *
 */
- (void)blurWithColor:(UIColor *)color;
/**
 *  Specify an image to customize blur effect
 *
 */
- (void)blurWithImage:(UIImage *)image;

@end
