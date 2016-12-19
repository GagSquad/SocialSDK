//
//  GSCollectionViewHorizontalLayout.h
//  SocialSDKDemo
//
//  Created by lijunjie on 19/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSCollectionViewHorizontalLayout : UICollectionViewFlowLayout
{
    
}

//一行中cell的个数
@property (nonatomic) NSUInteger itemCountPerRow;

//一页显示多少行
@property (nonatomic) NSUInteger rowCount;

@end
