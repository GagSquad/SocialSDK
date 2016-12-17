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
#import "GSPlatformType.h"

@interface GSBaseShare : NSObject <GSShareProtocol>
{
    GSShareCompletionBlock _completionBlock;
}

@property (nonatomic, strong) GSShareCompletionBlock completionBlock;

@end
