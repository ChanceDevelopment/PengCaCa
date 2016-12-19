//
//  ArtistFilterView.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ArtistFilterViewDelegate <NSObject>

/**
 第一次点击当前按钮

 @param rule 被选中的规则名称
 */
- (void)beginFilter:(NSString *)rule;


/**
 已经点选了当前过滤规则,再次点击当前规则或者点击其他规则时

 @param rule 当前的规则名称
 */
- (void)endFilter:(NSString *)rule;

@end

@interface ArtistFilterView : UIView

/**
 *  -.-
 */
@property(nonatomic,weak)id<ArtistFilterViewDelegate>delegate;

@end
