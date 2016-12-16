//
//  GSPlatformParamConfigManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSPlatformParamConfigManager.h"
#import "GSPlatformType.h"
#import "GSLogger.h"

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

- (void)addSinaPlatformConfigKey:(NSString *)key redirectURI:(NSString *)redirectURI
{
    if (key) {
        NSDictionary *config = @{
                                 @"key": key,
                                 @"redirectURI": redirectURI
                                 };
        _configs[@(GSPlatformTypeSina)] = config;
        GSLogger(@"设Sina_Key%@", key);
    } else {
        GSLogger(@"请设置正确的Key");
    }
}

@end
