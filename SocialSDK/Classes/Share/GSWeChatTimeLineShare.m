//
//  GSWeChatTimeLineShare.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/20.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSWeChatTimeLineShare.h"
#import "WXApi.h"

@interface GSWeChatTimeLineShare ()<WXApiDelegate>

@end

@implementation GSWeChatTimeLineShare

+ (id<GSShareProtocol>)share
{
    static id<GSShareProtocol> res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSWeChatTimeLineShare alloc] init];
    });
    return res;
}

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[GSWeChatTimeLineShare channelType] channel:[GSWeChatTimeLineShare class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
}

+ (GSShareChannelType)channelType
{
    return GSShareChannelTypeWechatTimeLine;
}

- (void)shareSimpleText:(NSString *)text
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.scene = WXSceneTimeline;
    req.text = text;
    [WXApi sendReq:req];
}

- (void)onResp:(BaseResp *)resp
{
    if (_completionBlock) {
        _completionBlock([self createResultWithResponse:resp]);
    }
    _completionBlock = nil;
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
