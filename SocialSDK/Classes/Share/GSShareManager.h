//
//  GSShareManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSPlatformType.h"

@interface GSShareManager : NSObject

+ (instancetype)share;

- (void)shareSimpleText:(NSString *)text platformType:(GSPlatformType)platformType;

- (BOOL)handleOpenURL:(NSURL *)url;

@end
