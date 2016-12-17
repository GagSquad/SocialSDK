//
//  GSShareManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"
#import "GSShareProtocol.h"

@interface GSShareManager : NSObject

+ (instancetype)share;

- (id<GSShareProtocol>)getShareProtocolWithPlatformType:(GSPlatformType)platformType;

- (void)addPlatformWithPlatformType:(GSPlatformType)platformType platform:(id<GSShareProtocol>)platform;

- (BOOL)handleOpenURL:(NSURL *)url;

@end
