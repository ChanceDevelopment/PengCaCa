//
//  ArtistsController.h
//  PengCaCa
//
//  Created by likeSo on 2016/12/12.
//  Copyright © 2016年 chance. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 艺人库查询类型

 - ArtistTypeAllArtists: 艺人库
 - ArtistTypeMyArtists: 我的艺人
 */
typedef NS_ENUM(NSUInteger, ArtistType) {
    ArtistTypeAllArtists,
    ArtistTypeMyArtists
};



/**
 艺人库首页
 */
@interface ArtistsController : UIViewController<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UITableViewDelegate,
UITableViewDataSource>

@end
