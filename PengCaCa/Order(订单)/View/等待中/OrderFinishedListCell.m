//
//  OrderFinishedListCell.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/19.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "OrderFinishedListCell.h"
#import "LabelShowView.h"

@interface OrderFinishedListCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *danceLabel;
@property (weak, nonatomic) IBOutlet UIButton *femaleLabel;
@property (weak, nonatomic) IBOutlet UIButton *menLabel;
@property (weak, nonatomic) IBOutlet LabelShowView *labelView;
@property (weak, nonatomic) IBOutlet UILabel *schduleLabel;
//"实付" / "实收"
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation OrderFinishedListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)onComment:(UIButton *)sender {
}

@end
