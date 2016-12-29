//
//  GSBasePlatformParamConfig.m
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSBasePlatformParamConfig.h"

@implementation GSBasePlatformParamConfig

+ (GSPlatformType)platformType
{
    return GSPlatformTypeNone;
}

+ (BOOL)isInstalled
{
    return NO;
}

- (void)config:(NSDictionary *)config
{
    
}

@end
