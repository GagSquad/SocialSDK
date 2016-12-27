//
//  GSLoginResult.h
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSLoginResultProtocol.h"

@interface GSLoginResult : NSObject<GSLoginResultProtocol>

@property (nonatomic, assign) GSLoginResultStatus status;
@property (nonatomic, assign) NSInteger sourceCode;
@property (nonatomic, copy) NSString *soucreMessage;
@property (nonatomic, copy,) NSString *message;

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *openid;
@property (nonatomic, copy) NSString *refreshToken;
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSDate *expiration;
@property (nonatomic) id originalResponse;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *iconurl;
@property (nonatomic, copy) NSString *gender;

@end
