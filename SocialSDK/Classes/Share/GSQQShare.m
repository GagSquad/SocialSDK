//
//  GSQQShare.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSQQShare.h"
#import <TencentOpenAPI/QQApiInterface.h>

@interface GSQQShare ()<QQApiInterfaceDelegate>

@end

@implementation GSQQShare

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[GSQQShare channelType] channel:[GSQQShare class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeQQ;
}

+ (GSShareChannelType)channelType
{
    return GSShareChannelTypeQQ;
}

- (void)shareSimpleText:(NSString *)text
{
    QQApiTextObject *txtObj = [QQApiTextObject objectWithText:text];
    SendMessageToQQReq *request = [SendMessageToQQReq reqWithContent:txtObj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:request];
    [self handleSendResult:sent];
}

- (void)handleSendResult:(QQApiSendResultCode)sendResult
{
    if (sendResult != EQQAPISENDSUCESS) {
        [self completionWithResult:[self createErrorResult:sendResult]];
    }
}

- (id<GSShareResultProtocol>)createErrorResult:(QQApiSendResultCode)sendResult
{
    GSShareResult *res = [[GSShareResult alloc] init];
    res.sourceCode = sendResult;
    res.status = GSShareResultStatusFailing;
    return res;
}

- (id<GSShareResultProtocol>)createResultWithResponse:(QQBaseResp *)response
{
    NSInteger resultCode = [response.result integerValue];
    GSShareResult *res = [[GSShareResult alloc] init];
    res.sourceCode = resultCode;
    res.soucreMessage = @"";
    res.status = GSShareResultStatusFailing;
    switch (resultCode) {
        case 0: {
            res.status = GSShareResultStatusSuccess;
            break;
        }
        case -4:{
            res.status = GSShareResultStatusCancel;
            break;
        }
        default:
            break;
    }
    
    return res;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [QQApiInterface handleOpenURL:url delegate:self];
}
#pragma mark QQApiInterfaceDelegate
- (void)onResp:(QQBaseResp *)resp
{
    [self completionWithResult:[self createResultWithResponse:resp]];
}

- (void)onReq:(QQBaseReq *)req
{
    
}

- (void)isOnlineResponse:(NSDictionary *)response
{
    
}

@end
