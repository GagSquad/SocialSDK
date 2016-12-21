//
//  GSPlatformParamConfigProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"

@protocol GSPlatformParamConfigProtocol <NSObject>

+ (GSPlatformType)platformType;

+ (BOOL)isInstalled;

- (void)config:(NSDictionary *)config;

@end
