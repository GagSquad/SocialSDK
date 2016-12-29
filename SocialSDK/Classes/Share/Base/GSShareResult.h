//
//  GSShareResult.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareResultProtocol.h"

@interface GSShareResult : NSObject <GSShareResultProtocol>

@property (nonatomic, assign) GSShareResultStatus status;
@property (nonatomic, assign) NSInteger sourceCode;
@property (nonatomic, copy) NSString *soucreMessage;
@property (nonatomic, copy) NSString *message;

@end
