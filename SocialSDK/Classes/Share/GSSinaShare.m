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
#import "GSShareManager.h"
#import "GSShareResult.h"

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

+ (void)load
{
    [[GSShareManager share] addPlatformWithPlatformType:[[GSSinaShare share] platformType] platform:[GSSinaShare share]];
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
    if (_completionBlock) {
        _completionBlock([self createResultWithResponse:response]);
    }
    _completionBlock = nil;
}

- (id<GSShareResultProtocol>)createResultWithResponse:(WBBaseResponse *)response
{
    WeiboSDKResponseStatusCode statusCode = response.statusCode;
    GSShareResult *res = [[GSShareResult alloc] init];
    res.sourceCode = statusCode;
    res.soucreMessage = @"";
    res.status = GSShareResultStatusFailing;
    switch (statusCode) {
        case WeiboSDKResponseStatusCodeSuccess: {
            res.status = GSShareResultStatusSuccess;
            break;
        }
        case WeiboSDKResponseStatusCodeUserCancel: {
            res.status = GSShareResultStatusCancel;
        }
        default:
            break;
    }
    
    return res;
}

@end
