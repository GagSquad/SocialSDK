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
    [[GSPlatformParamConfigManager share] addPlatformWithPlatformType:[platform platformType] platform:platform];
}

- (void)config:(NSDictionary *)config
{
    [WXApi registerApp:config[@"appID"]];
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
}

@end
