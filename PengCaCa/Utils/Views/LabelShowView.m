//
//  LabelShowView.m
//  PengCaCa
//
//  Created by likeSo on 2016/12/14.
//  Copyright © 2016年 chance. All rights reserved.
//

#import "LabelShowView.h"
#import "LabelViewItemModel.h"
@interface LabelShowView () <UICollectionViewDelegate,UICollectionViewDataSource>
/**
 *  标签列表数组
 */
@property(nonatomic,copy)NSMutableArray <LabelViewItemModel *>*labelList;
@end

@implementation LabelShowView

- (instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
        self.scrollEnabled = NO;
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)setLabelArray:(NSArray<NSString *> *)labelArray {
    _labelArray = labelArray;
    [self.labelList removeAllObjects];
    NSMutableArray *labelModelList = [NSMutableArray arrayWithCapacity:labelArray.count];
    for (NSString *labelName in labelArray) {
        LabelViewItemModel *itemModel = [[LabelViewItemModel alloc]initWithLabelName:labelName font:[UIFont systemFontOfSize:13]];
        [labelModelList addObject:itemModel];
    }
    [self.labelList addObjectsFromArray:labelModelList];
    [self reloadData];
}


- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    return [view isKindOfClass:[UIButton class]];//如果点击的是UIButton,则允许点击之后滑动
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark :- UICollectionViewDelegate && DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.labelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  [collectionView dequeueReusableCellWithReuseIdentifier:@"" forIndexPath:indexPath];
}






+ (CGFloat)labelHeightInRectWidth:(CGFloat)rectWidth
                           labels:(NSArray<NSString *> *)labels
                             font:(UIFont *)labelFont {
    NSUInteger lineCount = 1;
//    CGFloat originX = 0.0;
    CGFloat finalX = 0.0;
    CGFloat columeSpacing = 5.0;
    CGFloat itemHeight = 0.0;
    CGFloat lineSpacing = 5.0;
    for (NSString *labelName in labels) {
        LabelViewItemModel *itemModel = [[LabelViewItemModel alloc]initWithLabelName:labelName font:labelFont];
        if (itemHeight != itemModel.itemSize.height) {
            itemHeight = itemModel.itemSize.height;
        }
        CGSize itemSize = itemModel.itemSize;
        if (rectWidth > itemSize.width + finalX + columeSpacing) {//可以放下当前的单元格
            finalX += itemSize.width + finalX;
        } else {//放不下当前单元格,执行换行操作
            finalX = 0.0;
            lineCount += 1;
        }
    }
    CGFloat viewHeight = lineCount * itemHeight + (lineCount - 1) * lineSpacing;
    return viewHeight;
}

@end
