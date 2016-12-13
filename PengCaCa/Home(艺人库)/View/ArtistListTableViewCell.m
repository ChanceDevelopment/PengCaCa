//
//  ArtistListTableViewCell.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/13.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "ArtistListTableViewCell.h"
#import <HCSStarRatingView.h>
#import <Masonry.h>
#import "Macro.h"

@interface ArtistListTableViewCell ()
/**
 *  头像
 */
@property(nonatomic,strong)UIImageView *coverImage;

/**
 *  用户名
 */
@property(nonatomic,strong)UILabel *nameLabel;

/**
 *  性别图像
 */
@property(nonatomic,strong)UIImageView *genderImageView;

/**
 *  星星View
 */
@property(nonatomic,strong)HCSStarRatingView *ratingView;

/**
 *  分数Label
 */
@property(nonatomic,strong)UILabel *scoreLabel;

/**
 *  订单总数Label
 */
@property(nonatomic,strong)UILabel *orderLabel;

@end

@implementation ArtistListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _coverImage = [[UIImageView alloc]initWithFrame:CGRectZero];
        _coverImage.contentMode = UIViewContentModeScaleAspectFill;
        _coverImage.clipsToBounds = YES;
        _coverImage.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        _coverImage.layer.cornerRadius = 3;
        [self.contentView addSubview:_coverImage];
        [_coverImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(@(15));
            make.height.equalTo(self.contentView).offset(-20);
            make.width.mas_equalTo(kScaleOfScreenWidth(46));
        }];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.text = @"XXX";
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.coverImage.mas_right).offset(10);
            make.top.equalTo(self.coverImage).offset(10);
        }];
        
        _genderImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _genderImageView.layer.cornerRadius = 3;
        _genderImageView.clipsToBounds = YES;
        _genderImageView.backgroundColor = kSelectedColor;
        _genderImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.genderImageView];
        [_genderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLabel);
            make.left.equalTo(self.nameLabel.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(18, 12));
        }];
        
        _ratingView = [[HCSStarRatingView alloc]initWithFrame:CGRectZero];
        _ratingView.maximumValue = 5;
        _ratingView.minimumValue = 1;
        _ratingView.allowsHalfStars = YES;
        _ratingView.enabled = NO;
        _ratingView.value = 3.5;
        [self.contentView addSubview:_ratingView];
        [self.ratingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel);
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(kScaleOfScreenWidth(55), kScaleOfScreenHeight(13)));
        }];
        
        _scoreLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _scoreLabel.backgroundColor = kSelectedColor;
        _scoreLabel.textColor = [UIColor whiteColor];
        _scoreLabel.font = [UIFont systemFontOfSize:13];
        _scoreLabel.layer.cornerRadius = 2;
        _scoreLabel.clipsToBounds = YES;
        [self.contentView addSubview:_scoreLabel];
        _scoreLabel.text = @"3.5";
        [_scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_ratingView.mas_right).offset(5);
            make.centerY.equalTo(_ratingView);
        }];
        
        
        _orderLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _orderLabel.font = [UIFont systemFontOfSize:12];
        _orderLabel.textAlignment = NSTextAlignmentCenter;
        _orderLabel.text = @"158 单 | 违约 2 单";
        _orderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1];
        [self.contentView addSubview:_orderLabel];
        [_orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.centerY.equalTo(_ratingView);
        }];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
