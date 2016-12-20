//
//  GSPlatformParamConfigManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSPlatformParamConfigManager.h"
#import "GSLogger.h"
#import "GSPlatformParamConfigProtocol.h"

@interface GSPlatformParamConfigManager ()
{
    NSMutableDictionary *_configs;
    NSMutableDictionary <NSNumber *, id<GSPlatformParamConfigProtocol>> *_platforms;
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
        _platforms = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addPlatformWithPlatformType:(GSPlatformType)platformType platform:(id<GSPlatformParamConfigProtocol>)platform
{
    _platforms[@(platformType)] = platform;
}

- (void)addSinaPlatformConfigAppKey:(NSString *)appKey redirectURI:(NSString *)redirectURI
{
    GSPlatformType p = GSPlatformTypeSina;
    if (appKey) {
        NSDictionary *config = @{
                                 @"appKey": appKey,
                                 @"redirectURI": redirectURI
                                 };
        _configs[@(p)] = config;
        [_platforms[@(p)] config:config];
        GSLogger(@"设Sina_appKey%@", appKey);
        GSLogger(@"设Sina_redirectURI%@", redirectURI);
    } else {
        GSLogger(@"请设置正确的Key");
    }
}

- (void)addQQPlatformConfigAppID:(NSString *)appID;
{
    GSPlatformType p = GSPlatformTypeQQ;
    if (appID) {
        NSDictionary *config = @{
                                 @"appID": appID
                                 };
        _configs[@(p)] = config;
        [_platforms[@(p)] config:config];
        GSLogger(@"设QQ_appID%@", appID);
    } else {
        GSLogger(@"请设置正确的Key");
    }
}

- (void)addWeChatPlatformConfigAppID:(NSString *)appID
{
    GSPlatformType p = GSPlatformTypeWeChat;
    if (appID) {
        NSDictionary *config = @{
                                 @"appID": appID
                                 };
        _configs[@(p)] = config;
        [_platforms[@(p)] config:config];
        GSLogger(@"设置WeChat_appID%@",appID);
    } else {
        GSLogger(@"请设置正确的appID");
    }
}

- (NSDictionary *)getConfigWithPlatformType:(GSPlatformType)platformType
{
    return _configs[@(platformType)];
}

@end
