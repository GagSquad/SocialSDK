//
//  GSQQLogin.m
//  SocialSDKDemo
//
//  Created by lvjialin on 2016/12/27.
//  Copyright © 2016年 GagSquad. All rights reserved.
//

#import "GSQQLogin.h"
#import "GSQQPlatformParamConfig.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface GSQQLogin ()<TencentSessionDelegate>
{
    TencentOAuth *_oauth;
}
@end

@implementation GSQQLogin

+ (void)load
{
    [[GSLoginManager share] addChannelWithChannelType:[GSQQLogin channelType] channel:[GSQQLogin class]];
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeQQ;
}

- (void)doLogin
{
    NSArray* permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                            kOPEN_PERMISSION_ADD_ALBUM,
                            kOPEN_PERMISSION_ADD_ONE_BLOG,
                            kOPEN_PERMISSION_ADD_SHARE,
                            kOPEN_PERMISSION_ADD_TOPIC,
                            kOPEN_PERMISSION_CHECK_PAGE_FANS,
                            kOPEN_PERMISSION_GET_INFO,
                            kOPEN_PERMISSION_GET_OTHER_INFO,
                            kOPEN_PERMISSION_LIST_ALBUM,
                            kOPEN_PERMISSION_UPLOAD_PIC,
                            kOPEN_PERMISSION_GET_VIP_INFO,
                            kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                            nil];
    NSDictionary *config = [[GSPlatformParamConfigManager share] getConfigWithPlatformType:GSPlatformTypeQQ];
    _oauth = [[TencentOAuth alloc] initWithAppId:config[@"appID"] andDelegate:nil];
    [_oauth setSessionDelegate:self];
    [_oauth authorize:permissions];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}

- (id<GSLoginResultProtocol>)createResultWithResponse:(APIResponse *)res
{
    GSLoginResult *result = [[GSLoginResult alloc] init];
    result.status = GSLoginResultStatusFailing;
    result.sourceCode = res.retCode;
    if (res.retCode == URLREQUEST_SUCCEED) {
        result.status = GSLoginResultStatusSuccess;
        result.accessToken = _oauth.accessToken;
        result.openid = _oauth.openId;
        result.expiration = _oauth.expirationDate;
        result.gender = [GSQQLogin gender:res.jsonResponse[@"gender"]];
        result.name = res.jsonResponse[@"nickname"];
        result.iconurl = res.jsonResponse[@"figureurl_qq_2"];
        result.originalResponse = res.jsonResponse;
    }
    return result;
}

+ (GSLoginResultGender)gender:(NSString *)gender
{
    GSLoginResultGender res = GSLoginResultGenderNone;
    if (gender && [gender isKindOfClass:[NSString class]]) {
        if ([gender isEqualToString:@"男"]) {
            res = GSLoginResultGenderMale;
        } else if([gender isEqualToString:@"女"]) {
            res = GSLoginResultGenderFemale;
        }
    }
    return res;
}

#pragma mark TencentLoginDelegate
/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
    if (_oauth.accessToken.length > 0) {
        [_oauth getUserInfo];
    }
}
/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    GSLoginResult *res = [[GSLoginResult alloc] init];
    if (cancelled) {
        res.status = GSLoginResultStatusCancel;
        res.sourceCode = kOpenSDKErrorUserCancel;
    } else {
        res.status = GSLoginResultStatusFailing;
        res.sourceCode = URLREQUEST_FAILED;
    }
    [self completionWithResult:res];
}
/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
    GSLoginResult *res = [[GSLoginResult alloc] init];
    res.status = GSLoginResultStatusFailing;
    res.soucreMessage = @"网络异常";
    [self completionWithResult:res];
}
#pragma mark TencentSessionDelegate getUserInfo
- (void)getUserInfoResponse:(APIResponse *)response
{
    [self completionWithResult:[self createResultWithResponse:response]];
}
@end
