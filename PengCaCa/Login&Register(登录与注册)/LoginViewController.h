//
//  LoginViewController.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 登录页面
 */
@interface LoginViewController : UIViewController
/**
 *  导航栏实例,rootViewController是LoginViewController
 */
@property(nonatomic,strong,class,readonly)UINavigationController *navigator;

@end
