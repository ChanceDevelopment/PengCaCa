//
//  LabelShowView.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelShowView : UICollectionView

/**
 *  标签数组
 */
@property(nonatomic,strong)NSArray <NSString *>* labelArray;


/**
 计算标签列表在某一宽度内需要占用多高

 @param rectWidth 目标展示View的宽度
 @return 标签列表总共需要的高度
 */
+ (CGFloat)labelHeightInRectWidth:(CGFloat)rectWidth labels:(NSArray <NSString *>*)labels font:(UIFont *)labelFont;
@end
