//
//  GSShareResultProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    GSShareResultStatusSuccess,
    GSShareResultStatusFailing,
    GSShareResultStatusCancel,
} GSShareResultStatus;

@protocol GSShareResultProtocol <NSObject>

- (BOOL)isSuccess;
- (GSShareResultStatus)status;
- (NSInteger)sourceCode;
- (NSString *)soucreMessage;
- (NSString *)message;

@end
