//
//  SliderView.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "SliderView.h"
#import "Macro.h"

@interface SliderView ()

/**
 *  下标指示图
 */
@property(nonatomic,strong)UIView *slider;


/**
 *  slider的高度
 */
@property(nonatomic,assign)CGFloat sliderHeight;

/**
 *  单个按钮的宽度
 */
@property(nonatomic,assign)CGFloat itemWidth;
@end

@implementation SliderView

- (instancetype)initWithFrame:(CGRect)frame titleList:(NSArray<NSString *> *)titles {
    if (self = [super initWithFrame:frame]) {
        _sliderHeight = 3.f;
        self.itemWidth = frame.size.width / titles.count;
        for (NSInteger index = 0; index < titles.count; index ++) {
            NSString *title = [titles objectAtIndex:index];
            UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
            segmentButton.tag = 10000 + index;
            [segmentButton setTitle:title forState:UIControlStateNormal];
            segmentButton.titleLabel.font = [UIFont systemFontOfSize:12];
            segmentButton.frame = CGRectMake(index * _itemWidth, 0, _itemWidth, frame.size.height - _sliderHeight);
            [segmentButton addTarget:self action:@selector(onSegment:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:segmentButton];
        }
        
        self.highlightColor = kSelectedColor;
        self.normalColor = [UIColor whiteColor];
        
        self.slider = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - _sliderHeight, _itemWidth, _sliderHeight)];
        self.slider.backgroundColor = kSelectedColor;
        self.slider.layer.cornerRadius = self.sliderHeight * 0.5;
        self.slider.clipsToBounds = YES;
        [self addSubview:self.slider];
    }
    return self;
}

- (void)onSegment:(UIButton *)btn {
    self.currentIndex = btn.tag - 10000;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *subViewButton = (UIButton *)subView;
            if (subViewButton == btn) {
                [subViewButton setTitleColor:self.highlightColor forState:UIControlStateNormal];
            } else {
                [subViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
        }
    }
    if (self.onSelectIndex) {
        self.onSelectIndex(self.currentIndex);
    }
    [UIView animateWithDuration:0.35
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0
                        options:UIViewAnimationOptionOverrideInheritedCurve
                     animations:^{
                         self.slider.frame = CGRectMake(_currentIndex * self.itemWidth, self.slider.frame.origin.y, self.itemWidth, self.sliderHeight);
    } completion:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
