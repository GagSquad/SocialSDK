//
//  GSShareProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareChannelType.h"
#import "GSPlatformType.h"

@protocol GSShareResultProtocol;

typedef void (^GSShareCompletionBlock) (id<GSShareResultProtocol> result);

@protocol GSShareProtocol <NSObject>

+ (GSPlatformType)platformType;

+ (GSShareChannelType)channelType;

- (void)shareSimpleText:(NSString *)text;

- (void)shareSingleImage:(id)image title:(NSString *)title description:(NSString *)description;

- (BOOL)handleOpenURL:(NSURL *)url;

- (void)setShareCompletionBlock:(GSShareCompletionBlock)completionBlock;

@end
