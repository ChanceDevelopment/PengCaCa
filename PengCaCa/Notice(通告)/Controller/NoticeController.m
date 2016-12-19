//
//  NoticeController.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "NoticeController.h"
#import "Macro.h"
#import "NoticeListTableViewCell.h"
#import "ArtistFilterView.h"
#import <Masonry.h>

@interface NoticeController ()<UITableViewDelegate,UITableViewDataSource,ArtistFilterViewDelegate>
/**
 *  导航栏左边按钮
 */
@property(nonatomic,strong)UIButton *leftButtonItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**
 *  是否需要展示已被过滤的数据
 */
@property(nonatomic,assign)BOOL showFiltered;

/**
 *  完整的数据列表
 */
@property(nonatomic,strong)NSMutableArray *dataArray;

/**
 *  过滤之后的数据列表
 */
@property(nonatomic,strong)NSMutableArray *filterArray;

/**
 *  数据源过滤器
 */
@property(nonatomic,strong)ArtistFilterView *filterView;

@end

@implementation NoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)setupView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.filterView = [[[NSBundle mainBundle]loadNibNamed:@"ArtistFilterView" owner:nil options:nil] firstObject];
    self.filterView.delegate = self;
    [self.view addSubview:self.filterView];
    [self.filterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(40));
    }];
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScaleOfScreenWidth(185), 28)];
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:containerView.bounds];
    searchBar.placeholder = @"输入您想要的ID或者昵称";
    searchBar.layer.cornerRadius = 3;
    searchBar.clipsToBounds = YES;
    searchBar.layer.borderColor = [UIColor blackColor].CGColor;
    searchBar.layer.borderWidth = 1;
    
    UITextField *textfield = [searchBar valueForKeyPath:@"_searchField"];//修改占位符字体
    NSMutableAttributedString *placeHolder = [[NSMutableAttributedString alloc]initWithString:searchBar.placeholder];
    [placeHolder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, searchBar.placeholder.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [placeHolder addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, searchBar.placeholder.length)];
    textfield.attributedPlaceholder = placeHolder;
    
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
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:releaseOrderBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.tableView.separatorStyle  =UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"NoticeListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"NoticeListTableViewCell"];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark :- FilterView Delegate 
- (void)beginFilter:(NSString *)rule {
    NSLog(@"begin filter rule name %@",rule);
}

- (void)endFilter:(NSString *)rule {
    NSLog(@"end filter rule name %@",rule);
}

#pragma mark :- UITableViewDelegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.showFiltered ? self.filterArray.count : self.dataArray.count;
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"NoticeListTableViewCell" forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
