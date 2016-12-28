//
//  GSWeChatLogin.m
//  SocialSDKDemo
//
//  Created by lijunjie on 27/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSWeChatLogin.h"
#import "GSLogger.h"
#import "WXApi.h"

@interface GSWeChatLogin () <WXApiDelegate>
{
    GSLoginResult *_result;
}

@property (nonatomic, strong) GSLoginResult *result;

@end

@implementation GSWeChatLogin
+ (void)load
{
    [[GSLoginManager share] addChannelWithChannelType:[GSWeChatLogin channelType] channel:[GSWeChatLogin class]];
}

+ (GSPlatformType)platformType
{
    return GSPlatformTypeWeChat;
}

+ (GSLoginChannelType)channelType
{
    return GSLoginChannelTypeWeChat;
}

- (void)doLogin
{
    GSLogger(@"微信登录");
    //构造SendAuthReq结构体
    SendAuthReq* req = [[SendAuthReq alloc ] init];
    req.scope = @"snsapi_userinfo,snsapi_base";
    req.state = @"123";
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WXApiDelegate

- (void)onResp:(BaseResp *)resp
{
    SendAuthResp *response = (SendAuthResp *)resp;
    int errCode = response.errCode;
    _result = [[GSLoginResult alloc] init];
    _result.sourceCode = errCode;
    _result.soucreMessage = @"";
    _result.status = GSLoginResultStatusFailing;
    
    switch (errCode) {
        case WXSuccess: {
            _result.status = GSLoginResultStatusSuccess;
            break;
        }
        case WXErrCodeUserCancel: {
            _result.status = GSLoginResultStatusCancel;
            break;
        }
        default:
            break;
    }
    
    if (_result.status == GSLoginResultStatusSuccess) {
        [self getAccessToken:response];
    } else {
        [self completionWithResult:_result];
    }
    
}

- (void)getAccessToken:(SendAuthResp *)resp
{
    NSString *access_token = @"https://api.weixin.qq.com/sns/oauth2/access_token";
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?appid=%@&secret=%@&code=%@&grant_type=authorization_code",
                                       access_token,
                                       [[GSPlatformParamConfigManager share] getConfigWithPlatformType:GSPlatformTypeWeChat][@"appID"],
                                       [[GSPlatformParamConfigManager share] getConfigWithPlatformType:GSPlatformTypeWeChat][@"secret"],
                                       resp.code
                                       ]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak GSWeChatLogin *weakSelf = self;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if (error) {
                                          [weakSelf completionWithResult:weakSelf.result];
                                      } else {
//                                          {
//                                              "access_token" = "XjYO-HAz4AIudA2gKoFsYusdBQ8q6zzmnNMrchNfpcX8KX5X9QIUGt3jFRjpHAvX55qFBQzc7Wj7kSay8uJsygIuYfwx7F_2WQzHpe-gCSU";
//                                              "expires_in" = 7200;
//                                              openid = osZJNv2OhV8hXlEdW5y6I0sAreVw;
//                                              "refresh_token" = "VIiAW8Q6wjEv1A97yu1zU3kQFj78W36QCvnityRD4hHBSUaUOO-G5M8Igze_XeURQKAv9cOw44CzO6HLohAR7AjbmJliFJ9xWQZTVzcXDNI";
//                                              scope = "snsapi_userinfo";
//                                              unionid = olAHivvqIv0bGq3w1xVmGv8xVP60;
//                                          }
                                          NSString *JSON = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          NSDictionary *dic = [GSWeChatLogin dictionaryFromJSONString:JSON];
                                          weakSelf.result.accessToken = dic[@"access_token"];
                                          weakSelf.result.openid = dic[@"openid"];
                                          weakSelf.result.refreshToken = dic[@"refresh_token"];
                                          weakSelf.result.expiration = dic[@"expires_in"];
                                          
                                          [weakSelf getUserInfo:dic[@"access_token"]];
                                      }
                                  }];
    [task resume];
}

- (void)getUserInfo:(NSString *)accessToken
{
    NSString *userinfo = @"https://api.weixin.qq.com/sns/userinfo";
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?access_token=%@&openid=%@", userinfo, accessToken, [[GSPlatformParamConfigManager share] getConfigWithPlatformType:GSPlatformTypeWeChat][@"appID"]]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak GSWeChatLogin *weakSelf = self;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if (error) {
                                          [weakSelf completionWithResult:weakSelf.result];
                                      } else {
//                                          {
//                                              city = Changping;
//                                              country = CN;
//                                              headimgurl = "http://wx.qlogo.cn/mmopen/VrMQ8SAxE43xKfotLVvYfsga3xHaoibLPU6UdTahzC2BzGgBmJ3W4uiaTroM3ZerKaRq82hDBCx2ZzibxXDD8VqYn6K2pxAPuic5/0";
//                                              language = "zh_CN";
//                                              nickname = ljj;
//                                              openid = osZJNv2OhV8hXlEdW5y6I0sAreVw;
//                                              privilege =     (
//                                              );
//                                              province = Beijing;
//                                              sex = 1;
//                                              unionid = olAHivvqIv0bGq3w1xVmGv8xVP60;
//                                          }
                                          NSString *JSON = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          NSDictionary *dic = [GSWeChatLogin dictionaryFromJSONString:JSON];
                                          
                                          weakSelf.result.name = dic[@"nickname"];
                                          weakSelf.result.iconurl = dic[@"headimgurl"];
                                          weakSelf.result.gender = dic[@"sex"];
                                          
                                          [weakSelf completionWithResult:weakSelf.result];
                                      }
                                  }];
    [task resume];
}

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)str
{
    NSDictionary *res = nil;
    if (str && [str isKindOfClass:[NSString class]]) {
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        id obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (!error) {
            res = obj;
        }
    }
    return res;
}

@end
