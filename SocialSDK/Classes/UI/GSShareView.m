//
//  GSShareView.m
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareView.h"
#import "GSLogger.h"
#import "GSCollectionViewHorizontalLayout.h"
#import "GSCollectionViewCell.h"

@interface GSShareView () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSArray<NSNumber *>* _channels;
    GSShareViewCompletionBlock _completionBlock;
}

@end

@implementation GSShareView

+ (void)showShareViewWithChannels:(NSArray *)channels completionBlock:(GSShareViewCompletionBlock)completionBlock;
{
    [[UIApplication sharedApplication].keyWindow addSubview:[[GSShareView alloc] initWithChannels:channels completionBlock:completionBlock]];
}

- (instancetype)initWithChannels:(NSArray<NSNumber *> *)channels completionBlock:(GSShareViewCompletionBlock)completionBlock
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = YES;
        _channels = channels;
        _completionBlock = completionBlock;
        [self createView];
    }
    return self;
}

- (void)createView
{
    CGFloat height = 200.f;
    
    CGSize size = self.frame.size;
    UIView *shareBGView = [[UIView alloc] initWithFrame:CGRectMake(0, size.height - height, size.width, height)];
    shareBGView.backgroundColor = [UIColor redColor];
    [self addSubview:shareBGView];
    
    CGFloat hfHeight = 40.f;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, hfHeight)];
    headerView.backgroundColor = [UIColor brownColor];
    UILabel *title = [[UILabel alloc] initWithFrame:headerView.bounds];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"选择分享平台";
    [headerView addSubview:title];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height + headerView.frame.origin.y, size.width, height - hfHeight * 2)];
    contentView.backgroundColor = [UIColor cyanColor];
    
    GSCollectionViewHorizontalLayout *layout =[[GSCollectionViewHorizontalLayout alloc] init];
    layout.itemCountPerRow = 4;
    layout.rowCount = 2;
    
    CGFloat wh = contentView.frame.size.height / 2;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/4, wh);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.headerReferenceSize = CGSizeMake(0, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView =[[UICollectionView alloc] initWithFrame:contentView.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[GSCollectionViewCell class] forCellWithReuseIdentifier:@"GSCollectionViewCell"];
    [contentView addSubview:collectionView];
    
    UIView *fooderView = [[UIView alloc] initWithFrame:CGRectMake(0, contentView.frame.size.height + contentView.frame.origin.y, size.width, hfHeight)];
    fooderView.backgroundColor = [UIColor orangeColor];
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.exclusiveTouch = YES;
    cancelBtn.frame = fooderView.bounds;
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn setTitle:@"取消分享" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [fooderView addSubview:cancelBtn];
    
    [shareBGView addSubview:headerView];
    [shareBGView addSubview:contentView];
    [shareBGView addSubview:fooderView];
}

- (void)cancelAction:(id)sender
{
    GSLogger(@"cancel");
    [self removeIsCancel:YES channelType:GSShareChannelTypeNone];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeIsCancel:YES channelType:GSShareChannelTypeNone];
}

- (void)removeIsCancel:(BOOL)isCancel channelType:(GSShareChannelType)channelType;
{
    [self removeFromSuperview];
    if (_completionBlock) {
        _completionBlock(isCancel,channelType);
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger res = 0;
    GSCollectionViewHorizontalLayout *layout = (GSCollectionViewHorizontalLayout *)collectionView.collectionViewLayout;
    NSInteger count = _channels.count;
    NSInteger pageCount = layout.itemCountPerRow * layout.rowCount;
    NSUInteger t = 0;
    if (pageCount != 0) {
        t = count / pageCount;
    }
    if (count % pageCount != 0) {
        res = pageCount * (t + 1);
    } else {
        res = count;
    }
    return res;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierCell = @"GSCollectionViewCell";
    GSCollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    if (indexPath.item < [_channels count]) {
        [cell updateUI:[_channels[indexPath.row] unsignedIntegerValue]];
    }
    cell.hidden = (indexPath.item >= [_channels count]);
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    [self removeIsCancel:NO channelType:[_channels[row] unsignedIntegerValue]];
}

@end
