
//
//  GSWeChatSessionShare.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/20.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSWeChatSessionShare.h"
#import "WXApi.h"

@interface GSWeChatSessionShare ()<WXApiDelegate>

@end

@implementation GSWeChatSessionShare

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[GSWeChatSessionShare channelType] channel:[GSWeChatSessionShare class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
}

+ (GSShareChannelType)channelType;
{
    return GSShareChannelTypeWechatSession;
}

- (void)shareSimpleText:(NSString *)text
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.scene = WXSceneSession;
    req.text = text;
    [WXApi sendReq:req];
}

- (void)onResp:(BaseResp *)resp
{
    [self completionWithResult:[self createResultWithResponse:resp]];
}

- (id<GSShareResultProtocol>)createResultWithResponse:(BaseResp *)response
{
    int errCode = response.errCode;
    GSShareResult *res = [[GSShareResult alloc] init];
    res.sourceCode = errCode;
    res.soucreMessage = @"";
    res.status = GSShareResultStatusFailing;
    switch (errCode) {
        case 0: {
            res.status = GSShareResultStatusSuccess;
            break;
        }
        case -2: {
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
    return [WXApi handleOpenURL:url delegate:self];
}
@end
