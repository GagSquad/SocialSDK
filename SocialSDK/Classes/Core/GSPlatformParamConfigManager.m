//
//  GSPlatformParamConfigManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSPlatformParamConfigManager.h"
#import "GSLogger.h"
#import "WeiboSDK.h"

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

- (void)addSinaPlatformConfigAppKey:(NSString *)appKey redirectURI:(NSString *)redirectURI
{
    if (appKey) {
        NSDictionary *config = @{
                                 @"appKey": appKey,
                                 @"redirectURI": redirectURI
                                 };
        _configs[@(GSPlatformTypeSina)] = config;
        GSLogger(@"设Sina_appKey%@", appKey);
        GSLogger(@"设Sina_redirectURI%@", redirectURI);
    } else {
        GSLogger(@"请设置正确的Key");
    }
}

- (NSDictionary *)getConfigWithPlatformType:(GSPlatformType)platformType
{
    return _configs[@(platformType)];
}

- (NSMutableDictionary *)getConfigs
{
    return _configs;
}
@end
