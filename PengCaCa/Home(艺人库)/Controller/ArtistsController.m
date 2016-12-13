//
//  ArtistsController.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "ArtistsController.h"
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import "NavigatorSlider.h"
#import "Macro.h"
#import "ArtistListCollectionViewCell.h"
#import "ArtistListTableViewCell.h"

@interface ArtistsController ()<CLLocationManagerDelegate>
/**
 *  定位管理器
 */
@property(nonatomic,strong)CLLocationManager *locationManager;

/**
 *  滑动指示器
 */
@property(nonatomic,strong)UIView *sliderView;

/**
 *  titleView左边按钮
 */
@property(nonatomic,strong)UIButton *leftButton;

/**
 *  titleView右边按钮
 */
@property(nonatomic,strong)UIButton *rightButton;


@property (strong, nonatomic) UICollectionView *collectionView;

/**
 *  左右两侧的列表视图的承载View
 */
@property(nonatomic,strong)UIScrollView *scrollView;

/**
 *  "我的艺人"列表页面
 */
@property(nonatomic,strong)UITableView *tableView;

/**
 *  保存集合视图数据源的数组
 */
@property(nonatomic,copy)NSMutableArray *dataList;

/**
 *  保存tableView数据源的数组
 */
@property(nonatomic,copy)NSMutableArray *myArtistList;

@end

@implementation ArtistsController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = kScaleOfScreenWidth(7.5);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.contentInset = UIEdgeInsetsMake(10, 15, 0, 15);
    }
    return _collectionView;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)setupView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    locationButton.frame = CGRectMake(0, 0, kScaleOfScreenWidth(60), 35);
    locationButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [locationButton setTitle:@"未知" forState:UIControlStateNormal];
    [locationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(onLocation:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:locationButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"艺人库",@"我的艺人"]];
    segmentControl.selectedSegmentIndex = 0;
    
    segmentControl.frame = CGRectMake(0, 0, kScaleOfScreenWidth(100), 25);
    segmentControl.tintColor = kSelectedColor;
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    self.navigationItem.titleView = segmentControl;
    [segmentControl addTarget:self action:@selector(onSegment:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(onIdentity:)];
    UIBarButtonItem *lineItem = [[UIBarButtonItem alloc]initWithTitle:@"|" style:UIBarButtonItemStylePlain target:nil action:nil];
    lineItem.enabled = NO;
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(onSearch:)];
    self.navigationItem.rightBarButtonItems = @[item,lineItem,searchItem];
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(45);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectZero];
    containerView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        make.height.equalTo(_scrollView);
        make.width.equalTo(@(SCREEN_WIDTH * 2));
    }];
    
    [self.collectionView registerClass:[ArtistListCollectionViewCell class] forCellWithReuseIdentifier:@"ArtistListCollectionViewCell"];
    
    [containerView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(containerView);
        make.width.equalTo(@(SCREEN_WIDTH));
    }];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[ArtistListTableViewCell class] forCellReuseIdentifier:@"ArtistListTableViewCell"];
    if ([self.tableView respondsToSelector:@selector(separatorInset)]) {
        self.tableView.separatorInset = UIEdgeInsetsZero;
    }
    [containerView addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SCREEN_WIDTH));
        make.top.bottom.right.equalTo(containerView);
    }];
}

/**
 导航栏位置按钮点击
 */
- (void)onLocation:(UIButton *)item {
    
}
- (void)onSegment:(UISegmentedControl *)segment {
    [self.scrollView setContentOffset:CGPointMake(segment.selectedSegmentIndex * SCREEN_WIDTH, 0) animated:YES];
}

- (void)onIdentity:(UIButton *)btn {
    
}

- (void)onSearch:(UIBarButtonItem *)item {
    
}


#pragma mark :- UICollectionViewDelegate && DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.dataList.count;
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"ArtistListCollectionViewCell" forIndexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake((SCREEN_WIDTH - 50) / 3, kScaleOfScreenHeight(190));
}


#pragma mark :- UITableViewDelegate && DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.myArtistList.count;
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"ArtistListTableViewCell" forIndexPath:indexPath];
}

#pragma mark :- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    CLLocation *location = [locations firstObject];
    
}

@end
