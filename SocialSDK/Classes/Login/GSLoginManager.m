//
//  GSLoginManager.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSLoginManager.h"

@implementation GSLoginManager

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static GSLoginManager *share = nil;
    dispatch_once(&onceToken, ^{
        share = [[GSLoginManager alloc] init];
    });
    return share;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    BOOL res = NO;
    
    return res;
}

@end
