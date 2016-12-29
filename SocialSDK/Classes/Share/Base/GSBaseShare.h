//
//  GSBaseShare.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareProtocol.h"
#import "GSPlatformParamConfigManager.h"
#import "GSShareManager.h"
#import "GSPlatformType.h"
#import "GSShareResult.h"

@interface GSBaseShare : NSObject <GSShareProtocol>

- (void)completionWithResult:(id<GSShareResultProtocol>)result;

@end
