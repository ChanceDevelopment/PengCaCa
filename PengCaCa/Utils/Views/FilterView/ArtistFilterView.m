//
//  ArtistFilterView.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "ArtistFilterView.h"
#import "Macro.h"

@interface ArtistFilterView ()

/**
 档期 按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *scheduleBtn;

/**
 过滤图标 按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *filterBtn;

/**
 性别 按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *genderBtn;

/**
 种类 按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *kindBtn;

/**
 排列 按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *arrangeBtn;

/**
 *  ----
 */
//@property(nonatomic,strong)<#type#><#name#>

/**
 *  是否已经展开菜单
 */
@property(nonatomic,assign)BOOL showned;

/**
 *  上一次被选中的规则名称
 */
@property(nonatomic,strong)NSString *lastSelectedRule;

@end

@implementation ArtistFilterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSBundle mainBundle]loadNibNamed:@"ArtistFilterView" owner:self options:nil];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    ///将button的image移动至右边的位置
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) {
            continue;
        }
        UIImageView *imageView = button.imageView;
        UILabel *titleLabel = button.titleLabel;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, titleLabel.frame.size.width, 0, -titleLabel.frame.size.width);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageView.frame.size.width, 0, imageView.frame.size.width);
    }
}
- (IBAction)onFilter:(UIButton *)sender {
    [sender setTitleColor:kSelectedColor forState:UIControlStateNormal];
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) {
            continue;
        }
        if (button != sender) {
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    if (!_showned) {
        if (_delegate) {
            [_delegate beginFilter:sender.titleLabel.text];
        }
    } else {
        if (_delegate) {
            [_delegate endFilter:_lastSelectedRule];
            [_delegate beginFilter:sender.titleLabel.text];
        }
    }
    _lastSelectedRule = sender.titleLabel.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
