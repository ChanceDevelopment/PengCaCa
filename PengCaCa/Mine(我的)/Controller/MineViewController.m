//
//  MineViewController.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "MineViewController.h"
#import "Macro.h"
#import <HCSStarRatingView.h>
#import <Masonry.h>

@interface MineViewController ()
@property (strong, nonatomic) IBOutlet UIView *viewHeaderView;

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UIImageView *genderImageView;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
@property (weak, nonatomic) IBOutlet UILabel *userHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *userWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *shoeSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *userWaistLabel;
@property (weak, nonatomic) IBOutlet UILabel *userChestLabel;
@property (weak, nonatomic) IBOutlet UILabel *userHipLabel;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *ratingLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *orderLabel;
///"需要认证" 按钮
@property (weak, nonatomic) IBOutlet UIButton *authBtn;
///"认证" 按钮
@property (weak, nonatomic) IBOutlet UIButton *authInfoBtn;
/// "钱包"按钮
@property (weak, nonatomic) IBOutlet UIButton *walletBtn;
/// "照片" 按钮
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
// "评论" 按钮
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;

///需要画虚线的两个View
@property (weak, nonatomic) IBOutlet UIView *topLineView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)setupView {
    self.navigationItem.title = @"XXX";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:kSelectedColor};
    
    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(onSettings:)];
    self.navigationItem.leftBarButtonItem = settingsItem;
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(onShare:)];
    UIButton *lineButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 3, 15)];
    [lineButton setTitle:@"|" forState:UIControlStateNormal];
    lineButton.enabled = NO;
    [lineButton setTitleColor:[UIColor colorWithWhite:0.7 alpha:1] forState:UIControlStateNormal];
    UIBarButtonItem *lineItem = [[UIBarButtonItem alloc]initWithCustomView:lineButton];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(onEdit:)];
    self.navigationItem.rightBarButtonItems = @[shareItem,lineItem,editItem];
    
    [self.view addSubview:self.viewHeaderView];
    [self.viewHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)onSettings:(UIBarButtonItem *)item {
    
}

- (void)onShare:(UIBarButtonItem *)item {
    
}

- (void)onEdit:(UIBarButtonItem *)item {
    
}

#pragma mark :- 头部四个按钮点击
- (IBAction)onSegment:(UIButton *)sender {
    NSUInteger index = sender.tag - 10000;//从左到右按照下标数
    
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
