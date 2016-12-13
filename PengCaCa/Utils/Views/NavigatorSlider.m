//
//  NavigatorSlider.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "NavigatorSlider.h"

@interface NavigatorSlider ()
/**
 *  SliderView
 */
@property(nonatomic,strong)UIView *sliderView;

/**
 *  标题数组
 */
@property(nonatomic,strong)NSArray <NSString *>* titleArray;


@end

@implementation NavigatorSlider

- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray<NSString *> *)titles {
    if (self = [super initWithFrame:frame]) {
        self.titleArray = titles;
        for (NSString *title in titles) {
            NSUInteger index = [titles indexOfObject:title];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = 10000 + index;
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button addTarget:self action:@selector(onSliderAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.height.equalTo(self);
        }];
        self.sliderView = [[UIView alloc]initWithFrame:CGRectZero];
        self.sliderView.layer.cornerRadius = 3;
        self.sliderView.clipsToBounds = YES;
        [self addSubview:self.sliderView];
        [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.equalTo(self);
            make.height.equalTo(@6);
            make.width.mas_equalTo(frame.size.width / titles.count);
        }];
        
    }
    return self;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.sliderView.backgroundColor = titleColor;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:UIButton.self]) {
            [((UIButton *)subView) setTitleColor:titleColor forState:UIControlStateNormal];
        }
    }
}

- (void)onSliderAction:(UIButton *)btn {
    NSInteger index = btn.tag = 10000;//当前下标
//    UIButton *subView = [self viewWithTag:btn];
    if (self.onSelectIndex) {
        self.onSelectIndex(self,index);
    }
    
    for (UIView *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            if (button == btn) {
                [(UIButton *)button setTitleColor:self.titleColor forState:UIControlStateNormal];
            } else {
                [(UIButton *)button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }
    }
    
    [self.sliderView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn);
    }];
    [UIView animateWithDuration:0.1
                     animations:^{
                         [self layoutIfNeeded];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
