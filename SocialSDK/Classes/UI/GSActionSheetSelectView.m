//
//  GSActionSheetSelectView.m
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSActionSheetSelectView.h"
#import "GSLogger.h"
#import "GSCollectionViewHorizontalLayout.h"
#import "GSCollectionViewCell.h"
#import "GSLogoReources.h"
#import "GSPlatformParamConfigManager.h"
#import "GSPlatformParamConfigProtocol.h"
#import "GSReourcesManager.h"

@interface GSActionSheetSelectView () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSArray<NSNumber *>* _channels;
    
    GSSelectViewCompletionBlock _completionBlock;
    
    BOOL _isUninstall;//标记是否有不支持的平台
}

@property (nonatomic, strong) UIWindow *window;

@end

@implementation GSActionSheetSelectView

- (void)dealloc
{
    GSLogger(@"GSSelectView 释放了");
}

+ (void)showShareViewWithChannels:(NSArray *)channels completionBlock:(GSSelectViewCompletionBlock)completionBlock;
{
    [[GSReourcesManager share] setThemeName:@"actionsheet"];
    GSActionSheetSelectView *w = [[GSActionSheetSelectView alloc] initWithChannels:channels completionBlock:completionBlock];
    [w makeKeyAndVisible];
    w.window = w;
}

- (instancetype)initWithChannels:(NSArray<NSNumber *> *)channels completionBlock:(GSSelectViewCompletionBlock)completionBlock
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _isUninstall = NO;
        [self setWindowLevel:UIWindowLevelAlert + 100];
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
        self.userInteractionEnabled = YES;
        NSMutableArray<NSNumber *> *temp = [NSMutableArray array];
        for (NSNumber *number in channels) {
            GSLogoReourcesType type = [number unsignedIntegerValue];
            id<GSPlatformParamConfigProtocol> config = [[GSPlatformParamConfigManager share] getConfigProtocolWithPlatformType:[GSLogoReources getPlatformTypeWithLogoReourcesType:type]];
            if (type == GSLogoReourcesTypeSina) {
                [temp addObject:@(type)];
            } else {
                if (config && [[config class] isInstalled]) {
                    [temp addObject:@(type)];
                } else {
                    _isUninstall = YES;
                    GSLogger(@"不支持类型GSLogoReourcesType = %ld", (unsigned long)type);
                }
            }
        }
        _channels = [temp copy];
        _completionBlock = completionBlock;
        [self createView];
    }
    return self;
}

- (void)createView
{
    CGFloat height = 240.f;
    CGFloat margin = 10.f;//外边距
    CGSize size = self.frame.size;
    UIView *shareBGView = [[UIView alloc] initWithFrame:CGRectMake(0, size.height, size.width, height)];
    shareBGView.backgroundColor = [UIColor clearColor];
    [self addSubview:shareBGView];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(margin, 0, size.width - margin * 2, height - 60)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 10.f;
    contentView.layer.masksToBounds = YES;
    
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
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[GSCollectionViewCell class] forCellWithReuseIdentifier:@"GSCollectionViewCell"];
    [contentView addSubview:collectionView];
    
    UIView *fooderView = [[UIView alloc] initWithFrame:CGRectMake(margin, contentView.frame.size.height + contentView.frame.origin.y + 8, size.width - margin * 2, 44)];
    fooderView.backgroundColor = [UIColor whiteColor];
    fooderView.layer.cornerRadius = 10.f;
    fooderView.layer.masksToBounds = YES;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cancelBtn.exclusiveTouch = YES;
    cancelBtn.frame = fooderView.bounds;
//    [cancelBtn setTitleColor:[UIColor colorWithRed:90/255.f green:90/255.f blue:90/255.f alpha:1.0] forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [cancelBtn setTitle:@"取消选择" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [fooderView addSubview:cancelBtn];
    //246 250 252
    [shareBGView addSubview:contentView];
    [shareBGView addSubview:fooderView];
    
    [UIView animateWithDuration:0.3 animations:^{
        shareBGView.frame = CGRectMake(0, size.height - height, size.width, height);
    }];
    
#if TARGET_IPHONE_SIMULATOR
    if (_isUninstall) {
        UILabel *error = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 16)];
        error.backgroundColor = [UIColor redColor];
        error.numberOfLines = 0;
        error.text = @"由于部分分享平台不支持，所以隐藏了相关平台的图标，此消息只在模拟器提示";
        [error sizeToFit];
        [self addSubview:error];
    }
#endif
}

- (void)cancelAction:(id)sender
{
    GSLogger(@"cancel");
    [self removeIsCancel:YES reourcesType:GSLogoReourcesTypeNone];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeIsCancel:YES reourcesType:GSLogoReourcesTypeNone];
}

- (void)removeIsCancel:(BOOL)isCancel reourcesType:(GSLogoReourcesType)reourcesType;
{
    if (_completionBlock) {
        _completionBlock(isCancel,reourcesType);
    }
    [self resignKeyWindow];
    _window = nil;
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
    [self removeIsCancel:NO reourcesType:[_channels[row] unsignedIntegerValue]];
}

@end
