//
//  GSSocialManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 30/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSHandleProtocol.h"

@interface GSSocialManager : NSObject <GSHandleProtocol>

+ (instancetype)share;

- (void)setHandle:(id<GSHandleProtocol>)handle;

- (void)clearHandle;

@end
