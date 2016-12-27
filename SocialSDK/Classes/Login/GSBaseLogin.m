//
//  GSBaseLogin.m
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSBaseLogin.h"

@interface GSBaseLogin ()
{
    GSLoginCompletionBlock _completionBlock;
}

@end

@implementation GSBaseLogin

+ (GSPlatformType)platformType
{
    return GSPlatformTypeNone;
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeNone;
}

- (void)login
{
    
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return NO;
}

- (void)setShareCompletionBlock:(GSLoginCompletionBlock)completionBlock
{
    _completionBlock = completionBlock;
}

@end
