//
//  GSWeChatPlatformParamConfig.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/20.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSWeChatPlatformParamConfig.h"
#import <WXApi.h>

@implementation GSWeChatPlatformParamConfig

+ (void)load
{
    id<GSPlatformParamConfigProtocol> platform = [[GSWeChatPlatformParamConfig alloc] init];
    [[GSPlatformParamConfigManager share] addPlatformWithPlatformType:[GSWeChatPlatformParamConfig platformType] platform:platform];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
}

+ (BOOL)isInstalled
{
    return [WXApi isWXAppInstalled];
}

- (void)config:(NSDictionary *)config
{
    [WXApi registerApp:config[@"appID"]];
}

@end
