//
//  OrderViewController.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderWaitListController.h"
#import "OrderOnGoingListController.h"
#import "OrderFinishedListController.h"
#import "SliderView.h"
#import "Macro.h"

@interface OrderViewController ()
/**
 *  等待中 列表页面
 */
@property(nonatomic,strong)OrderWaitListController *waitListVc;

/**
 *  进行中 列表页面
 */
@property(nonatomic,strong)OrderOnGoingListController *onGoingListVc;

/**
 *  已完成 列表界面
 */
@property(nonatomic,strong)OrderFinishedListController *onFinishListVc;


@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    SliderView *slider = [[SliderView alloc]initWithFrame:CGRectMake(0, 0, kScaleOfScreenWidth(180), 44) titleList:@[@"等待中",@"进行中",@"已完成"]];
    slider.onSelectIndex = ^(NSUInteger index) {
        
    };
    self.navigationItem.titleView = slider;
    
    _waitListVc = [[OrderWaitListController alloc]initWithStyle:UITableViewStyleGrouped];
    _waitListVc.view.frame = self.view.bounds;
    [self addChildViewController:_waitListVc];
    _onGoingListVc = [[OrderOnGoingListController alloc]initWithStyle:UITableViewStyleGrouped];
    _onGoingListVc.view.frame = self.view.bounds;
    [self addChildViewController:_onGoingListVc];
    _onFinishListVc = [[OrderFinishedListController alloc]initWithStyle:UITableViewStyleGrouped];
    _onFinishListVc.view.frame = self.view.bounds;
    [self addChildViewController:_onFinishListVc];
    
    [self setViewControllers:@[self.waitListVc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
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
