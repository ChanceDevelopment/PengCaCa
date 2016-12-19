//
//  OrderOnGoingListCell.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/19.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "OrderOnGoingListCell.h"
@interface OrderOnGoingListCell ()


@property (weak, nonatomic) IBOutlet UIButton *tagLabel;

/**
 包含头像内容的容器View
 */
@property (weak, nonatomic) IBOutlet UIView *headerImageContainerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sessionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *utilsLabel;

@end

@implementation OrderOnGoingListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
