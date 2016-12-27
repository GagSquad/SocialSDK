//
//  GSLoginManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 登录管理类
 */
@interface GSLoginManager : NSObject

/**
 创建单例
 
 @return 返回 GSLoginManager 实例
 */
+ (instancetype)share;

/**
 openURL回调
 
 @param url url
 @return 返回是否处理了当前url 处理了返回YES，否则返回NO
 */
- (BOOL)handleOpenURL:(NSURL *)url;

@end
