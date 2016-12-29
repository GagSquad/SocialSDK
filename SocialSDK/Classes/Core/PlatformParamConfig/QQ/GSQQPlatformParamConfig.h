//
//  GSQQPlatformParamConfig.h
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/17.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSBasePlatformParamConfig.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface GSQQPlatformParamConfig : GSBasePlatformParamConfig

- (TencentOAuth *)oauth;

@end
