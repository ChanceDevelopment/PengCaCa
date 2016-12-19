//
//  NoticeListTableViewCell.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "NoticeListTableViewCell.h"
#import "LabelShowView.h"
#import "Macro.h"


@interface NoticeListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UIButton *menButton;
@property (weak, nonatomic) IBOutlet LabelShowView *labelView;
@property (weak, nonatomic) IBOutlet UILabel *scheduleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *lineImageView;
@property (weak, nonatomic) IBOutlet UILabel *signedLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *paymentLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelShowViewHeightConstraint;

@end

@implementation NoticeListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.labelView.labelArray = @[@"包吃住",@"包车费",@"自带服饰"];
    CGFloat viewHeight = [LabelShowView labelHeightInRectWidth:SCREEN_WIDTH labels:self.labelView.labelArray font:[UIFont systemFontOfSize:13] ];
    self.labelShowViewHeightConstraint.constant = viewHeight;
}

- (void)setLabelArray:(NSArray<NSString *> *)labelArray {
    _labelArray = labelArray;
//    self.labelView
}

- (void)setFrame:(CGRect)frame {
    CGRect targetFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height - 5);
    [super setFrame:targetFrame];
//    super.frame
    //使用修改单元格高度的方式来实现单元格下方的横条的效果
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
