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
#import "GSPlatformParamConfigManager.h"

@interface GSSinaShare () <WeiboSDKDelegate>

@end

@implementation GSSinaShare

+ (id<GSShareProtocol>)share;
{
    static id<GSShareProtocol> res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSSinaShare alloc] init];
    });
    return res;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary *config = [[GSPlatformParamConfigManager share] getConfigWithPlatformType:[self platformType]];
        [WeiboSDK registerApp:config[@"appKey"]];
    }
    return self;
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeSina;
}

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
    NSDictionary *config = [[GSPlatformParamConfigManager share] getConfigWithPlatformType:[self platformType]];
    authRequest.redirectURI = config[@"redirectURI"];
    authRequest.scope = @"all";
    return authRequest;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

#pragma mark - WeiboSDKDelegate
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    
}

@end
