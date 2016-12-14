//
//  LabelViewItemModel.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface LabelViewItemModel : NSObject
/**
 *  标签名
 */
@property(nonatomic,strong)NSString *labelName;

/**
 *  单元格大小
 */
@property(nonatomic,assign)CGSize itemSize;

- (instancetype)initWithLabelName:(NSString *)labelName font:(UIFont *)labelFont;
@end
