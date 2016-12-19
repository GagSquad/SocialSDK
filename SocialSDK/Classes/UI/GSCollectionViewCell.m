//
//  GSCollectionViewCell.m
//  SocialSDKDemo
//
//  Created by lijunjie on 19/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "GSCollectionViewCell.h"
#import "GSReourcesManager.h"

@interface GSCollectionViewCell ()
{
    UIImageView *_logo;
    UILabel *_name;
}

@end

@implementation GSCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _logo = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, 5, 50, 50)];
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, _logo.frame.size.height + _logo.frame.origin.y + 5, frame.size.width, 16)];
        _name.backgroundColor = [UIColor clearColor];
        _name.textAlignment = NSTextAlignmentCenter;
        
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
        [self.contentView addSubview:_logo];
        
        [self.contentView addSubview:_name];
        
    }
    return self;
}

- (void)updateUI:(GSShareChannelType)channelType
{
    switch (channelType) {
        case GSShareChannelTypeSina: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"sina"]];
            _name.text = @"新浪";
            break;
        }
        case GSShareChannelTypeQQ: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"qq"]];
            _name.text = @"QQ好友";
            break;
        }
        case GSShareChannelTypeQzone: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"qzone"]];
            _name.text = @"QQ空间";
            break;
        }
        case GSShareChannelTypeWechatSession: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"wechat"]];
            _name.text = @"微信好友";
            break;
        }
        case GSShareChannelTypeWechatTimeLine: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"wechat_timeline"]];
            _name.text = @"微信朋友圈";
            break;
        }
        default: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"default"]];
            _name.text = @"分享";
            break;
        }
    }
}

@end
