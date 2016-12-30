//
//  GSLoginManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSLoginChannelType.h"
#import "GSPlatformType.h"
#import "GSLogoReourcesType.h"
#import "GSLoginProtocol.h"

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
 根据UI选中的类型获得登录渠道类型
 
 @param reourcesType UI选中的类型
 @return 渠道类型
 */
+ (GSLoginChannelType)getShareChannelTypeWithLogoReourcesType:(GSLogoReourcesType)reourcesType;

/**
 根据 GSLoginChannelType 获取 GSShareProtocol 接口
 
 @param channelType channelType
 @return 返回GSLoginProtocol实现类
 */
- (id<GSLoginProtocol>)getShareProtocolWithChannelType:(GSLoginChannelType)channelType;

/**
 根据 channelType 和 channel 添加登录渠道
 
 @param channelType channelType
 @param channel channel
 */
- (void)addChannelWithChannelType:(GSLoginChannelType)channelType channel:(Class)channel;

/**
 清除Channel，释放内存
 */
- (void)cleanChannel;

@end
