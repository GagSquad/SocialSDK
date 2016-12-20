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

+ (id<GSShareProtocol>)share;
{
    static id<GSShareProtocol> res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSQQShare alloc] init];
    });
    return res;
}

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[[GSQQShare share] channelType] channel:[GSQQShare share]];
}

- (GSShareChannelType)channelType
{
    return GSShareChannelTypeQQ;
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeQQ;
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
        if (_completionBlock) {
            _completionBlock([self createErrorResult:sendResult]);
        }
        _completionBlock = nil;
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
    if (_completionBlock) {
        _completionBlock([self createResultWithResponse:resp]);
    }
    _completionBlock = nil;
}

- (void)onReq:(QQBaseReq *)req
{
    
}

- (void)isOnlineResponse:(NSDictionary *)response
{
    
}

@end
