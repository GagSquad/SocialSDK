//
//  GSSinaLogin.m
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSSinaLogin.h"
#import "GSLoginManager.h"
#import "GSLogger.h"

@implementation GSSinaLogin

+ (void)load
{
    [[GSLoginManager share] addChannelWithChannelType:[GSSinaLogin channelType] channel:[GSSinaLogin class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeSina;
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeSina;
}

- (void)doLogin
{
    GSLogger(@"新浪登录");
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return NO;
}

@end
