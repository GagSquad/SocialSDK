//
//  GSLogoReources.m
//  SocialSDKDemo
//
//  Created by lijunjie on 23/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSLogoReources.h"

@implementation GSLogoReources

+ (GSPlatformType)getPlatformTypeWithLogoReourcesType:(GSLogoReourcesType)logoReourcesType
{
    GSPlatformType res = GSPlatformTypeNone;
    switch (logoReourcesType) {
        case GSLogoReourcesTypeSina: {
            res = GSPlatformTypeSina;
            break;
        }
        case GSLogoReourcesTypeQQ:
        case GSLogoReourcesTypeQzone: {
            res = GSPlatformTypeQQ;
            break;
        }
        case GSLogoReourcesTypeWechatSession:
        case GSLogoReourcesTypeWechatTimeLine: {
            res = GSPlatformTypeWeChat;
            break;
        }
        default:
            break;
    }
    return res;
}

@end
