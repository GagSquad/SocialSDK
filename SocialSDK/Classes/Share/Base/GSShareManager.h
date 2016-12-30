//
//  GSShareManager.h
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSShareChannelType.h"
#import "GSPlatformType.h"
#import "GSShareProtocol.h"
#import "GSLogoReourcesType.h"

/**
 分享管理类
 */
@interface GSShareManager : NSObject

/**
 创建单例

 @return 返回 GSShareManager 实例
 */
+ (instancetype)share;

/**
 根据UI选中的类型获得分享渠道类型

 @param reourcesType UI选中的类型
 @return 渠道类型
 */
+ (GSShareChannelType)getShareChannelTypeWithLogoReourcesType:(GSLogoReourcesType)reourcesType;

/**
 根据 GSShareChannelType 获取 GSShareProtocol 接口

 @param channelType channelType
 @return 返回GSShareProtocol实现类
 */
- (id<GSShareProtocol>)getShareProtocolWithChannelType:(GSShareChannelType)channelType;

/**
 根据 channelType 和 channel 添加分享渠道

 @param channelType channelType
 @param channel channel
 */
- (void)addChannelWithChannelType:(GSShareChannelType)channelType channel:(Class)channel;

/**
 清除Channel，释放内存
 */
- (void)cleanChannel;

@end
