//
//  GSShareChannelType.h
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#ifndef GSShareChannelType_h
#define GSShareChannelType_h

//分享支持的渠道
typedef enum : NSUInteger {
    GSShareChannelTypeNone,//未定义渠道
    GSShareChannelTypeSina,//新浪分享
    GSShareChannelTypeQQ,//QQ聊天分享
    GSShareChannelTypeQzone,//QQ空间分享
    GSShareChannelTypeWechatSession,//微信聊天分享
    GSShareChannelTypeWechatTimeLine//微信朋友圈分享
} GSShareChannelType;

#endif /* GSShareChannelType_h */
