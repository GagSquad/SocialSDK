//
//  GSLoggerConfig.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSLoggerConfig.h"

@interface GSLoggerConfig ()
{
    BOOL _isLogger;
}

@end

@implementation GSLoggerConfig

+ (instancetype)share
{
    static GSLoggerConfig *s = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s = [[GSLoggerConfig alloc] init];
    });
    return s;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isLogger = NO;
    }
    return self;
}

- (void)openLogger
{
    _isLogger = YES;
}

- (BOOL)isLogger
{
    return _isLogger;
}

@end
