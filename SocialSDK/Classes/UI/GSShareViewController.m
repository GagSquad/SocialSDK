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
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}

@end
