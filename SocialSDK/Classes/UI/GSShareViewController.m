//
//  GSShareViewController.m
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareViewController.h"
#import "GSLogger.h"

@interface GSShareWindow ()
{
    NSArray<NSNumber *>* _channels;
}

@end

@implementation GSShareWindow

+ (void)showShareViewWithChannels:(NSArray *)channels
{
    [[UIApplication sharedApplication].keyWindow addSubview:[[GSShareWindow alloc] initWithChannels:channels]];
}

- (instancetype)initWithChannels:(NSArray<NSNumber *> *)channels
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = YES;
        _channels = channels;
        [self createView];
    }
    return self;
}

- (void)createView
{
    CGFloat height = 100.f;
    
    CGSize size = self.frame.size;
    UIView *shareBGView = [[UIView alloc] initWithFrame:CGRectMake(0, size.height - height, size.width, height)];
    shareBGView.backgroundColor = [UIColor redColor];
    [self addSubview:shareBGView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, 40)];
    headerView.backgroundColor = [UIColor brownColor];
    UILabel *title = [[UILabel alloc] initWithFrame:headerView.bounds];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"选择分享平台";
    [headerView addSubview:title];
    
    [shareBGView addSubview:headerView];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self remove];
}

- (void)remove
{
    [self removeFromSuperview];
}

@end
