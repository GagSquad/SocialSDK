//
//  GSSinaLogin.m
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSSinaLogin.h"
#import "GSLoginManager.h"
#import "GSLogger.h"
#import "WeiboSDK.h"
#import "GSPlatformParamConfigManager.h"
#import "GSLoginResult.h"
#import "WeiboUser.h"

@interface GSSinaLogin () <WeiboSDKDelegate>

@end

@implementation GSSinaLogin

+ (void)load
{
    [[GSLoginManager share] addChannelWithChannelType:[GSSinaLogin channelType] channel:[GSSinaLogin class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeSina;
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeSina;
}

- (void)doLogin
{
    GSLogger(@"新浪登录");
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = [[GSPlatformParamConfigManager share] getConfigWithPlatformType:GSPlatformTypeSina][@"redirectURI"];
    request.scope = @"all";
    [WeiboSDK sendRequest:request];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

#pragma mark - WeiboSDKDelegate

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    ;
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    __block GSLoginResult *res = [[GSLoginResult alloc] init];
    res.status = GSLoginResultStatusFailing;
    res.sourceCode = response.statusCode;
    res.soucreMessage = @"";

    switch (response.statusCode) {
        case WeiboSDKResponseStatusCodeSuccess:{
            WBAuthorizeResponse *auth = (WBAuthorizeResponse *)response;
            
            res.status = GSLoginResultStatusSuccess;
            res.accessToken = auth.accessToken;
            res.uid = auth.userID;
            res.refreshToken = auth.refreshToken;
            res.expiration = auth.expirationDate;
            
            __weak GSSinaLogin *weakSelf = self;
            [WBHttpRequest requestForUserProfile:auth.userID withAccessToken:auth.accessToken andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {
                if (error) {
                    [weakSelf completionWithResult:res];
                } else {
                    WeiboUser *user = (WeiboUser *)result;
                    res.name = user.name;
                    res.iconurl = user.profileImageUrl;
                    res.gender = [GSSinaLogin gender:user.gender];
                    [weakSelf completionWithResult:res];
                }
            }];
            break;
        }
        case WeiboSDKResponseStatusCodeUserCancel: {
            res.status = GSLoginResultStatusCancel;
            [self completionWithResult:res];
            break;
        }
        default: {
            [self completionWithResult:res];
            break;
        }
    }
}

+ (GSLoginResultGender)gender:(NSString *)gender
{
    GSLoginResultGender res = GSLoginResultGenderNone;
    if (gender && [gender isKindOfClass:[NSString class]]) {
        if ([gender isEqualToString:@"m"]) {
            res = GSLoginResultGenderMale;
        } else if ([gender isEqualToString:@"f"]) {
            res = GSLoginResultGenderFemale;
        }
    }
    return res;
}

@end
