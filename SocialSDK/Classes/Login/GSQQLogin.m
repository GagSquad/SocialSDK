//
//  GSQQLogin.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/27.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSQQLogin.h"

@implementation GSQQLogin

+ (void)load
{
    [[GSLoginManager share] addChannelWithChannelType:[GSQQLogin channelType] channel:[GSQQLogin class]];
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeQQ;
}

- (void)doLogin
{
    
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return YES;
}

@end
