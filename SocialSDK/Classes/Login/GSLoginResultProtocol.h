//
//  GSLoginResultProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GSLoginResultStatus) {
    GSLoginResultStatusSuccess,
    GSLoginResultStatusFailing,
    GSLoginResultStatusCancel
};

typedef enum : NSUInteger {
    GSLoginResultGenderNone,//未定义
    GSLoginResultGenderMale,//男
    GSLoginResultGenderFemale,//女
} GSLoginResultGender;

@protocol GSLoginResultProtocol <NSObject>

- (BOOL)isSuccess;
- (GSLoginResultStatus)status;
- (NSInteger)sourceCode;
- (NSString *)soucreMessage;
- (NSString *)message;

- (NSString *)uid;
- (NSString *)openid;
- (NSString *)refreshToken;
- (NSString *)accessToken;
- (NSDate *)expiration;
- (id)originalResponse; //第三方原始数据

- (NSString *)name;
- (NSString *)iconurl;
- (GSLoginResultGender)gender;

@end
