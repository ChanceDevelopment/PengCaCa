//
//  OrderFinishedListCell.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/19.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 订单 已完成  列表 Cell
 */
@interface OrderFinishedListCell : UITableViewCell

/**
 *  是否是我发起的内容
 */
@property(nonatomic,assign,getter=isReleasedFromMe)BOOL releasedFromMe;


@end
