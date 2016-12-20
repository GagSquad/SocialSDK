
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

+ (id<GSShareProtocol>)share;
{
    static id<GSShareProtocol> res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSWeChatSessionShare alloc] init];
    });
    return res;
}

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[[GSWeChatSessionShare share] channelType] channel:[GSWeChatSessionShare share]];
}

- (GSShareChannelType)channelType;
{
    return GSShareChannelTypeWechatSession;
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
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
    
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}
@end
