//
//  GSQQShare.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSQQShare.h"
#import "GSPlatformParamConfigManager.h"
#import "GSShareManager.h"
#import <TencentOpenAPI/QQApiInterface.h>

@interface GSQQShare ()

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
    [[GSShareManager share] addPlatformWithPlatformType:[[GSQQShare share] platformType] platform:[GSQQShare share]];
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

@end
