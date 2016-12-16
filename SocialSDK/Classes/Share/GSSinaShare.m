//
//  GSSinaShare.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSSinaShare.h"
#import "WeiboSDK.h"
#import "WBHttpRequest.h"

@implementation GSSinaShare

- (void)shareSimpleText:(NSString *)text
{
    WBMessageObject *message = [WBMessageObject message];
    message.text = text;
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message authInfo:[self authRequest] access_token:nil];
    [WeiboSDK sendRequest:request];
}

- (WBAuthorizeRequest *)authRequest
{
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    NSDictionary *sinaConfig = [[[GSPlatformParamConfigManager share] getConfigs] objectForKey:@(GSPlatformTypeSina)];
    authRequest.redirectURI = sinaConfig[@"redirectURI"];
    authRequest.scope = @"all";
    return authRequest;
}

@end
