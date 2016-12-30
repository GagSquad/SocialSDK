//
//  GSBaseLogin.m
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSBaseLogin.h"
#import "GSLogger.h"

@interface GSBaseLogin ()
{
    GSLoginCompletionBlock _completionBlock;
}
@end

@implementation GSBaseLogin

- (void)dealloc
{
    GSLogger(@"%@ 释放了", [self class]);
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeNone;
}

- (void)doLogin
{
    
}

- (void)setLoginCompletionBlock:(GSLoginCompletionBlock)completionBlock
{
    _completionBlock = completionBlock;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return NO;
}

- (void)completionWithResult:(id<GSLoginResultProtocol>)result
{
    if (_completionBlock) {
        _completionBlock(result);
    }
    _completionBlock = nil;
}

@end
