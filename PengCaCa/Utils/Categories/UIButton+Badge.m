//
//  UIButton+Badge.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/19.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "UIButton+Badge.h"
#import <Masonry.h>
static NSInteger kUIButtonBadgeViewTagFlag = 100086;

@implementation UIButton (Badge)
- (void)showBadge {
    if (self.titleLabel) {
        UIView *badgeView = [self viewWithTag:kUIButtonBadgeViewTagFlag];
        if (!badgeView) {
            badgeView = [[UIView alloc]initWithFrame:CGRectZero];
            badgeView.layer.cornerRadius = 4;
            badgeView.clipsToBounds = YES;
            badgeView.backgroundColor = [UIColor redColor];
            [self addSubview:badgeView];
            [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.top.equalTo(self.titleLabel);
            }];
        }
        badgeView.hidden = NO;
        
    } else {
        NSLog(@"try show badge on a button without a titleLabel");
    }
}

- (void)hideBadge {
    UIView *badgeView = [self viewWithTag:kUIButtonBadgeViewTagFlag];
    if (badgeView) {
        badgeView.hidden = YES;
    }
}
@end
