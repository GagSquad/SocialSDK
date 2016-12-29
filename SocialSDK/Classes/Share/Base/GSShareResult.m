//
//  GSShareResult.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSShareResult.h"

@implementation GSShareResult

- (BOOL)isSuccess
{
    return (_status == GSShareResultStatusSuccess);
}

- (NSString *)message
{
    NSString *res = _message;
    if (res == nil) {
        switch (_status) {
            case GSShareResultStatusSuccess: {
                res = @"分享成功";
                break;
            }
            case GSShareResultStatusFailing: {
                res = @"分享失败";
                break;
            }
            case GSShareResultStatusCancel: {
                res = @"取消分享";
                break;
            }
            default:
                break;
        }
    }
    return res;
}

@end
