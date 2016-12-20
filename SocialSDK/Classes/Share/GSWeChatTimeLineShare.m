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

+ (id<GSShareProtocol>)share;
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
    [[GSShareManager share] addChannelWithChannelType:[[GSWeChatTimeLineShare share] channelType] channel:[GSWeChatTimeLineShare share]];
}

- (GSShareChannelType)channelType;
{
    return GSShareChannelTypeWechatTimeLine;
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
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
    
}

- (BOOL)handleOpenURL:(NSURL *)url
{
   return [WXApi handleOpenURL:url delegate:self];
}
@end
