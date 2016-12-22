//
//  GSViewController.m
//  SocialSDKDemo
//
//  Created by lijunjie on 16/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSViewController.h"

@import SocialSDK;

@interface GSViewController ()

@end

@implementation GSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)selectSharePlan:(id)sender
{
    [GSShareView showShareViewWithChannels:@[
                                             @(GSShareChannelTypeSina),
                                             @(GSShareChannelTypeQQ),
                                             @(GSShareChannelTypeQzone),
                                             @(GSShareChannelTypeWechatSession),
                                             @(GSShareChannelTypeWechatTimeLine)
                                             ]
                           completionBlock:^(BOOL isCancel, GSShareChannelType channelType) {
                               if (isCancel) {
                                   NSLog(@"用户点击了取消分享");
                               } else {
                                   id<GSShareProtocol> share = [[GSShareManager share] getShareProtocolWithChannelType:channelType];
                                   [share setShareCompletionBlock:^(id<GSShareResultProtocol> result) {
                                       NSLog(@"%@", result.message);
                                   }];
                                   //分享纯文本
//                                   [share shareSimpleText:@"测试分享"];
                                   //分享图片
//                                   [share shareSingleImage:[UIImage imageNamed:@"default"] title:@"分享图片title" description:@"分享图片description"];
                                   //分享url
//                                   [share shareURL:@"https://github.com/GagSquad/SocialSDK" title:@"分享链接title" description:@"分享链接description" thumbnail:[UIImage imageNamed:@"default"]];
                                   [share shareMusicURL:@"http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT"
                                        musicLowBandURL:nil
                                           musicDataURL:nil
                                    musicLowBandDataURL:nil
                                                  title:@"Wish You Were Here"
                                            description:@"Avril Lavigne"
                                              thumbnail:[UIImage imageNamed:@"default"]];
                               }
    }];
}

@end
