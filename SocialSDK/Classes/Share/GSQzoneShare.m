//
//  GSQzoneShare.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/20.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSQzoneShare.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>

@interface GSQzoneShare ()<QQApiInterfaceDelegate>

@end

@implementation GSQzoneShare

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[GSQzoneShare channelType] channel:[GSQzoneShare class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeQQ;
}

+ (GSShareChannelType)channelType
{
    return GSShareChannelTypeQzone;
}

- (void)shareSimpleText:(NSString *)text
{
    QQApiImageArrayForQZoneObject *obj = [QQApiImageArrayForQZoneObject objectWithimageDataArray:nil title:text];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:obj];
    QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
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
