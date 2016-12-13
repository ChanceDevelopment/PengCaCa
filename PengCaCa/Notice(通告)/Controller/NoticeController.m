//
//  NoticeController.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "NoticeController.h"
#import "Macro.h"

@interface NoticeController ()
/**
 *  导航栏左边按钮
 */
@property(nonatomic,strong)UIButton *leftButtonItem;

@end

@implementation NoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)setupView {
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScaleOfScreenWidth(185), 28)];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:containerView.bounds];
    searchBar.placeholder = @"输入您想要的ID或者昵称";
    searchBar.layer.cornerRadius = 3;
    searchBar.clipsToBounds = YES;
    searchBar.layer.borderColor = [UIColor blackColor].CGColor;
    searchBar.layer.borderWidth = 1;
    [containerView addSubview:searchBar];
    self.navigationItem.titleView = containerView;
    
    self.leftButtonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButtonItem.frame = CGRectMake(0, 0, kScaleOfScreenWidth(65),20);
    self.leftButtonItem.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.leftButtonItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.leftButtonItem setTitle:@"杭州 " forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButtonItem];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *releaseOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    releaseOrderBtn.frame = CGRectMake(0, 0, kScaleOfScreenWidth(75), 20);
    [releaseOrderBtn setTitle:@"发布订单" forState:UIControlStateNormal];
    releaseOrderBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [releaseOrderBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    releaseOrderBtn.imageEdgeInsets = UIEdgeInsetsMake(0, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:releaseOrderBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
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
