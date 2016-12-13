//
//  ArtistListCollectionViewCell.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "ArtistListCollectionViewCell.h"
#import <HCSStarRatingView.h>
#import "Macro.h"
#import <Masonry.h>

@interface ArtistListCollectionViewCell ()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) HCSStarRatingView *ratingView;
@property (strong, nonatomic) UILabel *scoreLabel;
@property (strong, nonatomic) UILabel *orderLabel;

/**
 *  性别图标
 */
@property(nonatomic,strong)UIImageView *genderImageView;
@end

@implementation ArtistListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.imageView.clipsToBounds = YES;
        self.imageView.backgroundColor = kSelectedColor;
        self.imageView.layer.cornerRadius = 5;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.contentView);
            make.height.equalTo(self.contentView).multipliedBy(0.6);
        }];
        self.genderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-25, -10, kScaleOfScreenWidth(60), kScaleOfScreenHeight(30))];
        [self.imageView addSubview:self.genderImageView];
        self.genderImageView.backgroundColor = [UIColor darkGrayColor];
        self.genderImageView.transform = CGAffineTransformRotate(self.genderImageView.transform, -M_PI_4);
        self.genderImageView.clipsToBounds = YES;
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.text = @"XXX";
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.self.contentView);
            make.width.lessThanOrEqualTo(self.contentView);
            make.top.equalTo(self.imageView.mas_bottom).offset(10);
        }];
        
        self.ratingView = [[HCSStarRatingView alloc]initWithFrame:CGRectZero];
        self.ratingView.allowsHalfStars = YES;
        self.ratingView.value = 3.5;
        self.ratingView.maximumValue = 5;
        self.ratingView.minimumValue = 1;
        self.ratingView.enabled = NO;
        [self.contentView addSubview:self.ratingView];
        [self.ratingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(_nameLabel.mas_bottom).offset(6);
            make.height.equalTo(@(kScaleOfScreenHeight(13)));
            make.width.equalTo(@(kScaleOfScreenWidth(55)));
        }];
        
        self.scoreLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.scoreLabel.backgroundColor = kSelectedColor;
        self.scoreLabel.textColor = [UIColor whiteColor];
        self.scoreLabel.font = [UIFont systemFontOfSize:13];
        self.scoreLabel.text = @"0.0";
        [self.contentView addSubview:self.scoreLabel];
        [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.ratingView);
            make.left.equalTo(self.ratingView.mas_right).offset(5);
        }];
        
        ///总单数与违约单数
        self.orderLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.orderLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
        self.orderLabel.font = [UIFont systemFontOfSize:13];
        self.orderLabel.text = @"158单 >";
        [self.contentView addSubview:self.orderLabel];
        [self.orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ratingView);
            make.top.equalTo(self.ratingView.mas_bottom).offset(5);
        }];
    }
    return  self;
}


@end
