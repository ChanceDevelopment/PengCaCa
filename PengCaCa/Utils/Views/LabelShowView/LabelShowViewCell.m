//
//  LabelShowViewCell.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "LabelShowViewCell.h"
#import <Masonry.h>

@interface LabelShowViewCell ()

/**
 *  展示标签名的按钮,无点击事件
 */
@property(nonatomic,strong)UIButton *labelButton;


@end

@implementation LabelShowViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.labelButton = [[UIButton alloc]initWithFrame:CGRectZero];
        self.labelButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [self.labelButton setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateNormal];
        self.labelButton.backgroundColor = [UIColor colorWithRed:213 / 255.0 green:213 / 255.0 blue:213 / 255.0 alpha:1];
        self.labelButton.layer.cornerRadius = 3;
        self.labelButton.clipsToBounds = YES;
        [self.contentView addSubview:self.labelButton];
        [self.labelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
    }
    return self;
}
- (void)setLabelName:(NSString *)labelName {
    _labelName = labelName;
    [self.labelButton setTitle:labelName forState:UIControlStateNormal];
}

@end
