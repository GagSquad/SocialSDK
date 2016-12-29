//
//  GSQQPlatformParamConfig.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/17.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSQQPlatformParamConfig.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>

@interface GSQQPlatformParamConfig ()
{
    TencentOAuth *_oauth;
}
@end

@implementation GSQQPlatformParamConfig

+ (void)load
{
    id<GSPlatformParamConfigProtocol> platform = [[GSQQPlatformParamConfig alloc] init];
    [[GSPlatformParamConfigManager share] addPlatformWithPlatformType:[GSQQPlatformParamConfig platformType] platform:platform];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeQQ;
}

+ (BOOL)isInstalled
{
    return [QQApiInterface isQQInstalled];
}

- (void)config:(NSDictionary *)config
{
   _oauth = [[TencentOAuth alloc] initWithAppId:config[@"appID"] andDelegate:nil];
}

- (TencentOAuth *)oauth
{
    return _oauth;
}

@end
