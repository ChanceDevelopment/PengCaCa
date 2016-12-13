//
//  ArtistListTableViewCell.m
//  PengCaCa
//
//  Created by 龙少 on 2016/12/13.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "ArtistListTableViewCell.h"
@interface ArtistListTableViewCell ()
/**
 *  头像
 */
@property(nonatomic,strong)UIImageView *coverImage;


@end

@implementation ArtistListTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
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
