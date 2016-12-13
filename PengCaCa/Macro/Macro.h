//
//  Macro.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define kScaleOfScreenWidth(a) (SCREEN_WIDTH * ((a) / (375.0)))
#define kScaleOfScreenHeight(a) (SCREEN_HEIGHT * ((a) / (667.0)))

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

///默认选中颜色
#define kSelectedColor ([UIColor colorWithRed:253 / 255.0 green:141 / 255.0 blue:21 / 255.0 alpha:1])


///默认导航栏颜色
#define kNavigationColor ([UIColor colorWithRed:29 / 255.0 green:29 / 255.0 blue:32 / 255.0 alpha:1])
