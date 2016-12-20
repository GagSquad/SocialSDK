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
#import <TencentOpenAPI/TencentOAuth.h>

@implementation GSQzoneShare

+ (id<GSShareProtocol>)share;
{
    static id<GSShareProtocol> res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSQzoneShare alloc] init];
    });
    return res;
}

+ (void)load
{
    [[GSShareManager share] addChannelWithChannelType:[[GSQzoneShare share] channelType] channel:[GSQzoneShare share]];
}

- (GSShareChannelType)channelType;
{
    return GSShareChannelTypeQzone;
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeQQ;
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
    switch (sendResult) {
        case EQQAPISENDSUCESS:{
            break;
        }
        case EQQAPIVERSIONNEEDUPDATE:{
            break;
        }
        default:
            break;
    }
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}

@end
