//
//  GSShareManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareManager.h"

@interface GSShareManager ()

@end

@implementation GSShareManager

+ (instancetype)share
{
    static GSShareManager *res = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        res = [[GSShareManager alloc] init];
    });
    return res;
}

@end
