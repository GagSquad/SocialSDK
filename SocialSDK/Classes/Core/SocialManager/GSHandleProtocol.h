//
//  GSHandleProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 30/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GSHandleProtocol <NSObject>
    
- (BOOL)handleOpenURL:(NSURL *)url;

@end
