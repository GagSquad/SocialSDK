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
#import <UIKit/UIKit.h>

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

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description
{
    QQApiImageArrayForQZoneObject *img ;
    if ([image isKindOfClass:[NSData class]]) {
        img = [QQApiImageArrayForQZoneObject objectWithimageDataArray:@[image] title:title];
    } else if ([image isKindOfClass:[UIImage class]]) {
        img = [QQApiImageArrayForQZoneObject objectWithimageDataArray:@[UIImagePNGRepresentation(image)] title:title];
    }
    img.description = description;
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:img];;
    QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
    [self handleSendResult:sent];
}

- (void)shareURL:(NSString *)url title:(NSString *)title description:(NSString *)description thumbnail:(id)thumbnail
{
    QQApiNewsObject *obj;
    if ([thumbnail isKindOfClass:[NSData class]]) {
        obj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:url] title:title description:description previewImageData:thumbnail];
    } else if ([thumbnail isKindOfClass:[UIImage class]]) {
        obj = [QQApiNewsObject objectWithURL:[NSURL URLWithString:url] title:title description:description previewImageData:UIImagePNGRepresentation(thumbnail)];
    }
    [obj setCflag:kQQAPICtrlFlagQZoneShareOnStart];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:obj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

- (void)shareMusicURL:(NSString *)musicURL
      musicLowBandURL:(NSString *)musicLowBandURL
         musicDataURL:(NSString *)musicDataURL
  musicLowBandDataURL:(NSString *)musicLowBandDataURL
                title:(NSString *)title
          description:(NSString *)description
            thumbnail:(id)thumbnail
{
    QQApiAudioObject *obj;
    if ([thumbnail isKindOfClass:[NSData class]]) {
        obj = [QQApiAudioObject objectWithURL:[NSURL URLWithString:musicURL] title:title description:description previewImageData:thumbnail];
    } else if ([thumbnail isKindOfClass:[UIImage class]]) {
        obj = [QQApiAudioObject objectWithURL:[NSURL URLWithString:musicURL] title:title description:description previewImageData:UIImagePNGRepresentation(thumbnail)];
    }
    [obj setCflag:kQQAPICtrlFlagQZoneShareOnStart];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:obj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

- (void)shareVideoURL:(NSString *)videoURL
      videoLowBandURL:(NSString *)videoLowBandURL
       videoStreamURL:(NSString *)videoStreamURL
videoLowBandStreamURL:(NSString *)videoLowBandStreamURL
                title:(NSString *)title
          description:(NSString *)description
            thumbnail:(id)thumbnail
{
    QQApiVideoObject *obj;
    if ([thumbnail isKindOfClass:[NSData class]]) {
        obj = [QQApiVideoObject objectWithURL:[NSURL URLWithString:videoURL] title:title description:description previewImageData:thumbnail];
    } else if ([thumbnail isKindOfClass:[UIImage class]]) {
        obj = [QQApiVideoObject objectWithURL:[NSURL URLWithString:videoURL] title:title description:description previewImageData:UIImagePNGRepresentation(thumbnail)];
    }
    [obj setCflag:kQQAPICtrlFlagQZoneShareOnStart];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:obj];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
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
