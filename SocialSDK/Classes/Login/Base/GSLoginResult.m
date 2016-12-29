//
//  GSLoginResult.m
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSLoginResult.h"

@implementation GSLoginResult

- (BOOL)isSuccess
{
    return (_status == GSLoginResultStatusSuccess);
}

- (NSString *)message
{
    NSString *res = _message;
    if (res == nil) {
        switch (_status) {
            case GSLoginResultStatusSuccess: {
                res = @"登陆成功";
                break;
            }
            case GSLoginResultStatusFailing: {
                res = @"登陆失败";
                break;
            }
            case GSLoginResultStatusCancel: {
                res = @"登录取消";
                break;
            }
            default:
                break;
        }
    }
    return res;
}

@end
