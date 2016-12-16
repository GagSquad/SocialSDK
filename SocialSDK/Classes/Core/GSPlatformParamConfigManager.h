//
//  GSPlatformParamConfigManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"

@interface GSPlatformParamConfigManager : NSObject

+ (instancetype)share;

- (void)addSinaPlatformConfigKey:(NSString *)key redirectURI:(NSString *)redirectURI;

- (NSMutableDictionary *)getConfigs;

@end
