//
//  GSLoginProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"
#import "GSLoginChannelType.h"

@protocol GSLoginResultProtocol;

typedef void (^GSLoginCompletionBlock) (id<GSLoginResultProtocol> result);

@protocol GSLoginProtocol <NSObject>

+ (GSPlatformType)platformType;

+ (GSLoginChannelType)channelType;

- (void)login;

- (BOOL)handleOpenURL:(NSURL *)url;

- (void)setShareCompletionBlock:(GSLoginCompletionBlock)completionBlock;

@end
