//
//  NoticeController.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "NoticeController.h"
#import "Macro.h"

@interface NoticeController ()

@end

@implementation NoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)setupView {
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScaleOfScreenWidth(85), 30)];
    searchBar.placeholder = @"输入您想要的ID或者昵称";
    searchBar.layer.cornerRadius = 3;
    searchBar.clipsToBounds = YES;
    searchBar.layer.borderColor = [UIColor blackColor].CGColor;
    searchBar.layer.borderWidth = 1;
    self.navigationItem.titleView = searchBar;
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
