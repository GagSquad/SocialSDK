//
//  GSSocialManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 30/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSSocialManager.h"
#import "GSLogger.h"

@interface GSSocialManager ()
{
    id<GSHandleProtocol> _handle;
}
@end

@implementation GSSocialManager

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static GSSocialManager *share = nil;
    dispatch_once(&onceToken, ^{
        share = [[GSSocialManager alloc] init];
    });
    return share;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }
    return self;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    GSLogger(@" handleOpenURL: ");
    BOOL res = NO;
    if (_handle) {
        res = [_handle handleOpenURL:url];
    }
    return res;
}

- (void)setHandle:(id<GSHandleProtocol>)handle
{
    _handle = handle;
}

- (void)clearHandle
{
    if (_handle) {
        _handle = nil;
        GSLogger(@"释放handle对象");
    } else {
        GSLogger(@"handle对象已经被释放了");
    }
}

- (void)notification:(NSNotification *)notification
{
    if ([notification.name isEqualToString:UIApplicationDidBecomeActiveNotification]) {
        [self clearHandle];
    }
}

@end
