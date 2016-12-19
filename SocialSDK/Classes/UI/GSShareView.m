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

//屏幕SCALE
#define SCREEN_SCALE ([UIScreen mainScreen].scale)
//随机色
#define GSRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface CollectionCell : UICollectionViewCell

@property(nonatomic, weak) UILabel *titleLabel;

@end

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:self.titleLabel];
        self.backgroundColor = GSRandomColor;
    }
    return self;
}

@end

@interface GSShareView () <UICollectionViewDataSource>
{
    NSArray<NSNumber *>* _channels;
}

@end

@implementation GSShareView

+ (void)showShareViewWithChannels:(NSArray *)channels
{
    [[UIApplication sharedApplication].keyWindow addSubview:[[GSShareView alloc] initWithChannels:channels]];
}

- (instancetype)initWithChannels:(NSArray<NSNumber *> *)channels
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = YES;
        _channels = channels;
        _channels = @[
                      @"a",
                      @"b",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      @"c",
                      ];
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
    layout.itemCountPerRow = 5;
    layout.rowCount = 2;
    
    CGFloat wh = contentView.frame.size.height / 2;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/4, wh);
    layout.minimumInteritemSpacing = 0*SCREEN_SCALE;
    layout.minimumLineSpacing = 0*SCREEN_SCALE;
    layout.headerReferenceSize = CGSizeMake(0*SCREEN_SCALE, 0*SCREEN_SCALE);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView =[[UICollectionView alloc] initWithFrame:contentView.bounds
                                                         collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[CollectionCell class]
       forCellWithReuseIdentifier:@"Cell"];
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
    [self remove];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self remove];
}

- (void)remove
{
    [self removeFromSuperview];
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    NSInteger _pageCount = _channels.count;
    //一排显示四个,两排就是八个
    while (_pageCount % 8 != 0) {
        ++_pageCount;
        NSLog(@"%zd", _pageCount);
    }
    return _pageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierCell = @"Cell";
    
    CollectionCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell
                                                     forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"分享渠道%ld", (long)indexPath.row];
    cell.hidden = (indexPath.item >= [_channels count]);
    return cell;
}

@end
