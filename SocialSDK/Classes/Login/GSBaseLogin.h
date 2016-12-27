//
//  GSBaseLogin.h
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSLoginProtocol.h"
#import "GSLoginManager.h"
#import "GSPlatformParamConfigManager.h"
#import "GSLoginResult.h"

@interface GSBaseLogin : NSObject<GSLoginProtocol>

- (void)completionWithResult:(id<GSLoginResultProtocol>)result;

@end
