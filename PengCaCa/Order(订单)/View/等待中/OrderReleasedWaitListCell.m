//
//  OrderReleasedWaitListCell.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/19.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "OrderReleasedWaitListCell.h"
#import "LabelShowView.h"

@interface OrderReleasedWaitListCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *danceLabel;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
@property (weak, nonatomic) IBOutlet UIButton *menLabel;
@property (weak, nonatomic) IBOutlet LabelShowView *labelView;
@property (weak, nonatomic) IBOutlet UILabel *scheduleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *signedLabel;



@end

@implementation OrderReleasedWaitListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/**
 选人 按钮

 @param sender
 */
- (IBAction)onChosePerson:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
