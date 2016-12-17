//
//  GSPlatformParamConfigManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"

@protocol GSPlatformParamConfigProtocol;
//平台参数配置管理
@interface GSPlatformParamConfigManager : NSObject

+ (instancetype)share;

- (void)addPlatformWithPlatformType:(GSPlatformType)platformType platform:(id<GSPlatformParamConfigProtocol>)platform;

- (void)addSinaPlatformConfigAppKey:(NSString *)appKey redirectURI:(NSString *)redirectURI;

- (void)addQQPlatformConfigAppID:(NSString *)appID;

- (NSDictionary *)getConfigWithPlatformType:(GSPlatformType)platformType;

@end
