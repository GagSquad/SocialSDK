//
//  GSBaseLogin.h
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSLoginProtocol.h"
#import "GSLoginManager.h"

@interface GSBaseLogin : NSObject<GSLoginProtocol>

- (void)completionWithResult:(id<GSLoginResultProtocol>)result;

@end
