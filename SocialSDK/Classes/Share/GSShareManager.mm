//
//  GSShareManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareManager.h"
#import "GSSinaShare.h"

@interface GSShareManager ()

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

- (id<GSShareProtocol>)getShareProtocolWithPlatformType:(GSPlatformType)platformType;
{
    id<GSShareProtocol> res = nil;
    switch (platformType) {
        case GSPlatformTypeSina:{
            res = [GSSinaShare share];
            break;
        }
        default:
            break;
    }
    return res;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    BOOL res = NO;
    id<GSShareProtocol> platform = [GSSinaShare share];
    res = [platform handleOpenURL:url];
    return res;
}

@end
