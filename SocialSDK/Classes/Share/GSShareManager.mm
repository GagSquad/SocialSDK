//
//  GSShareManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareManager.h"
#import "GSLogger.h"

@interface GSShareManager ()
{
    NSMutableDictionary <NSNumber *, Class> *_platforms;
    id<GSShareProtocol> _channel;
}

@end

@implementation GSShareManager

+ (instancetype)share
{
    static GSShareManager *res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSShareManager alloc] init];
    });
    return res;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _platforms = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id<GSShareProtocol>)getShareProtocolWithChannelType:(GSShareChannelType)channelType
{
    id<GSShareProtocol> res = [[(Class)_platforms[@(channelType)] alloc] init];
    _channel = res;
    if (!res) {
        GSLogger(@"未载入该平台");
    }
    return res;
}

- (void)addChannelWithChannelType:(GSShareChannelType)channelType channel:(Class)channel
{
    _platforms[@(channelType)] = channel;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    BOOL res = NO;
    if (_channel) {
        res = [_channel handleOpenURL:url];
    }
    return res;
}

- (void)cleanChannel
{
    _channel = nil;
}

@end
