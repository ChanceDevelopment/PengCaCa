//
//  LabelViewItemModel.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "LabelViewItemModel.h"


/**
 标签列表单元格的Model
 */
@implementation LabelViewItemModel

- (instancetype)initWithLabelName:(NSString *)labelName font:(UIFont *)labelFont{
    if (self = [super init]) {
        self.labelName = labelName;
        
        CGSize size = [labelName boundingRectWithSize:
                       CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:labelFont}
                                              context:nil].size;
        self.itemSize = CGSizeMake(size.width + 10, size.height + 5);
    }
    return self;
}

@end
