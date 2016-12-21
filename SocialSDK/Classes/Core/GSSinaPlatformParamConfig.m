//
//  GSSinaPlatformParamConfig.m
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSSinaPlatformParamConfig.h"
#import "WeiboSDK.h"

@implementation GSSinaPlatformParamConfig

+ (void)load
{
    id<GSPlatformParamConfigProtocol> platform = [[GSSinaPlatformParamConfig alloc] init];
    [[GSPlatformParamConfigManager share] addPlatformWithPlatformType:[GSSinaPlatformParamConfig platformType] platform:platform];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeSina;
}

+ (BOOL)isInstalled
{
    return [WeiboSDK isWeiboAppInstalled];
}

- (void)config:(NSDictionary *)config
{
    [WeiboSDK registerApp:config[@"appKey"]];
}

@end
