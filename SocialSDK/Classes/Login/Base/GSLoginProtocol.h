//
//  GSLoginProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSLoginChannelType.h"
#import "GSHandleProtocol.h"

@protocol GSLoginResultProtocol;

typedef void(^GSLoginCompletionBlock)(id<GSLoginResultProtocol>result);

@protocol GSLoginProtocol <NSObject, GSHandleProtocol>

+ (GSLoginChannelType)channelType;

- (void)doLogin;

- (void)setLoginCompletionBlock:(GSLoginCompletionBlock)completionBlock;

@end
