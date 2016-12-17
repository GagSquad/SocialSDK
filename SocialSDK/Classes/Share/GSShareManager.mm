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
    NSMutableDictionary <NSNumber *, id<GSShareProtocol>> *_platforms;
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

- (id<GSShareProtocol>)getShareProtocolWithPlatformType:(GSPlatformType)platformType;
{
    id<GSShareProtocol> res = _platforms[@(GSPlatformTypeSina)];
    if (!res) {
        GSLogger(@"未载入该平台");
    }
    return res;
}

- (void)addPlatformWithPlatformType:(GSPlatformType)platformType platform:(id<GSShareProtocol>)platform
{
    _platforms[@(platformType)] = platform;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    __block BOOL res = NO;
    [_platforms enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, id<GSShareProtocol>  _Nonnull obj, BOOL * _Nonnull stop) {
        res = [obj handleOpenURL:url];
        if (res) {
            *stop = YES;
        }
    }];
    return res;
}

@end
