//
//  GSLoginManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSLoginManager.h"
#import "GSLogger.h"
#import "GSSocialManager.h"

@interface GSLoginManager ()
{
    NSMutableDictionary <NSNumber *, Class> *_platforms;
}

@end

@implementation GSLoginManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _platforms = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static GSLoginManager *share = nil;
    dispatch_once(&onceToken, ^{
        share = [[GSLoginManager alloc] init];
    });
    return share;
}

+ (GSLoginChannelType)getShareChannelTypeWithLogoReourcesType:(GSLogoReourcesType)reourcesType;
{
    GSLoginChannelType res = GSLoginChannelTypeNone;
    switch (reourcesType) {
        case GSLogoReourcesTypeSina: {
            res = GSLoginChannelTypeSina;
            break;
        }
        case GSLogoReourcesTypeQQ:
        case GSLogoReourcesTypeQzone: {
            res = GSLoginChannelTypeQQ;
            break;
        }
        case GSLogoReourcesTypeWechatSession:
        case GSLogoReourcesTypeWechatTimeLine: {
            res = GSLoginChannelTypeWeChat;
            break;
        }
        default:
            break;
    }
    return res;
}

- (id<GSLoginProtocol>)getShareProtocolWithChannelType:(GSLoginChannelType)channelType;
{
    id<GSLoginProtocol> res = [[(Class)_platforms[@(channelType)] alloc] init];
    [[GSSocialManager share] setHandle:res];
    if (!res) {
        GSLogger(@"未载入该平台");
    }
    return res;

}

- (void)addChannelWithChannelType:(GSLoginChannelType)channelType channel:(Class)channel;
{
    _platforms[@(channelType)] = channel;
}

- (void)cleanChannel
{
    [[GSSocialManager share] clearHandle];
}

@end
