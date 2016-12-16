//
//  GSBaseShare.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSBaseShare.h"

@implementation GSBaseShare

- (void)shareSimpleText:(NSString *)text
{
    
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return NO;
}

- (GSPlatformType)platformType
{
    return GSPlatformTypeNone;
}

- (void)setShareCompletionBlock:(GSShareCompletionBlock)completionBlock
{
    _completionBlock = completionBlock;
}

@end
