//
//  GSShareManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareManager.h"
#import "GSLogger.h"
#import "GSSocialManager.h"

@interface GSShareManager ()
{
    NSMutableDictionary <NSNumber *, Class> *_platforms;
}

@end

@implementation GSShareManager

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
    static GSShareManager *res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSShareManager alloc] init];
    });
    return res;
}

+ (GSShareChannelType)getShareChannelTypeWithLogoReourcesType:(GSLogoReourcesType)reourcesType;
{
    GSShareChannelType res = GSShareChannelTypeNone;
    switch (reourcesType) {
        case GSLogoReourcesTypeSina: {
            res = GSShareChannelTypeSina;
            break;
        }
        case GSLogoReourcesTypeQQ: {
            res = GSShareChannelTypeQQ;
            break;
        }
        case GSLogoReourcesTypeQzone: {
            res = GSShareChannelTypeQzone;
            break;
        }
        case GSLogoReourcesTypeWechatSession: {
            res = GSShareChannelTypeWechatSession;
            break;
        }
        case GSLogoReourcesTypeWechatTimeLine: {
            res = GSShareChannelTypeWechatTimeLine;
            break;
        }
        default:
            break;
    }
    return res;
}

- (id<GSShareProtocol>)getShareProtocolWithChannelType:(GSShareChannelType)channelType
{
    id<GSShareProtocol> res = [[(Class)_platforms[@(channelType)] alloc] init];
    [[GSSocialManager share] setHandle:res];
    if (!res) {
        GSLogger(@"未载入该平台");
    }
    return res;
}

- (void)addChannelWithChannelType:(GSShareChannelType)channelType channel:(Class)channel
{
    _platforms[@(channelType)] = channel;
}

- (void)cleanChannel
{
    [[GSSocialManager share] clearHandle];
}

@end
