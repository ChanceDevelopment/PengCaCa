//
//  SliderView.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SliderViewSelectIndexCallBack) (NSUInteger);

/**
 导航栏滑动View
 */
@interface SliderView : UIView

/**
 *  被选中时的标题颜色
 */
@property(nonatomic,strong)UIColor *highlightColor;

/**
 *  未被选中时标题颜色
 */
@property(nonatomic,strong)UIColor *normalColor;

/**
 *  当前选中的下标
 */
@property(nonatomic,assign)NSUInteger currentIndex;


/**
 *  选中下标时回调
 */
@property(nonatomic,copy)SliderViewSelectIndexCallBack onSelectIndex;

- (instancetype)initWithFrame:(CGRect)frame titleList:(NSArray <NSString *>*)titles;
@end
