//
//  GSPlatformParamConfigManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSPlatformParamConfigManager.h"
#import "GSPlatformType.h"

@interface GSPlatformParamConfigManager ()
{
    NSMutableDictionary *_configs;
}

@end

@implementation GSPlatformParamConfigManager

+ (instancetype)share
{
    static GSPlatformParamConfigManager *res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSPlatformParamConfigManager alloc] init];
    });
    return res;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _configs = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addSinaPlatformConfig:(NSString *)key
{
    if (key) {
        NSDictionary *config = @{
                                 @"key": key
                                 };
        _configs[@(GSPlatformTypeSina)] = config;
    } else {
        NSLog(@"请设置正确的Key");
    }
}

@end
