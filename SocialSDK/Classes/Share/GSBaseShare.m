//
//  GSBaseShare.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSBaseShare.h"
#import "GSShareManager.h"

@interface GSBaseShare ()
{
    GSShareCompletionBlock _completionBlock;
}

@end

@implementation GSBaseShare

+ (GSPlatformType)platformType
{
    return GSPlatformTypeNone;
}

+ (GSShareChannelType)channelType;
{
    return GSShareChannelTypeNone;
}

- (void)shareSimpleText:(NSString *)text
{
    
}

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description
{
    
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return NO;
}

- (void)setShareCompletionBlock:(GSShareCompletionBlock)completionBlock
{
    _completionBlock = completionBlock;
}

- (void)completionWithResult:(id<GSShareResultProtocol>)result
{
    if (_completionBlock) {
        _completionBlock(result);
    }
    _completionBlock = nil;
    [[GSShareManager share] cleanChannel];
}

@end
