//
//  GSShareManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareChannelType.h"
#import "GSShareProtocol.h"

@interface GSShareManager : NSObject

+ (instancetype)share;

- (id<GSShareProtocol>)getShareProtocolWithChannelType:(GSShareChannelType)channelType;

- (void)addChannelWithChannelType:(GSShareChannelType)channelType channel:(id<GSShareProtocol>)channel;

- (BOOL)handleOpenURL:(NSURL *)url;

@end
