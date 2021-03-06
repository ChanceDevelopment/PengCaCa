//
//  MainViewController.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "MainViewController.h"
#import "Macro.h"
#import "LoginViewController.h"
#import "UIImage+Utils.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    [UINavigationBar appearance].barTintColor = kNavigationColor;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kSelectedColor} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    
    self.tabBar.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
    self.tabBar.shadowImage = [UIImage new];
    
    [self.navigationController presentViewController:[LoginViewController navigator] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
