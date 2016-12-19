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
        _logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        
        _name = [[UILabel alloc] init];
        
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
            break;
        }
        case GSShareChannelTypeQQ: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"qq"]];
            break;
        }
        case GSShareChannelTypeQzone: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"qzone"]];
            break;
        }
        case GSShareChannelTypeWechatSession: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"wechat"]];
            break;
        }
        case GSShareChannelTypeWechatTimeLine: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"wechat_timeline"]];
            break;
        }
        default: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"default"]];
            break;
        }
    }
}

@end
