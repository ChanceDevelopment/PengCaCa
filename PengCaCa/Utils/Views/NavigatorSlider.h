//
//  NavigatorSlider.h
//  PengCaCa
//
//  Created by 龙少 on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
@class NavigatorSlider;
typedef void(^OnSelectSliderCallback)(NavigatorSlider *slider,NSUInteger index);

@interface NavigatorSlider : UIView
/**
 *  按钮颜色
 */
@property(nonatomic,strong)UIColor *titleColor;


- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray <NSString *>*)titles;

/**
 *  选中时回调
 */
@property(nonatomic,copy)OnSelectSliderCallback onSelectIndex;
@end
