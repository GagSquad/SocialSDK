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
        UIView *logoBG = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - 50) / 2, 8, 50, 50)];
        logoBG.layer.cornerRadius = 25.f;
        logoBG.layer.masksToBounds = YES;
        logoBG.backgroundColor = [UIColor whiteColor];
        
        _logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _logo.center = logoBG.center;
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, logoBG.frame.size.height + logoBG.frame.origin.y + 8, frame.size.width, 16)];
        _name.backgroundColor = [UIColor clearColor];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.font = [UIFont systemFontOfSize:12.f];
        _name.textColor = [UIColor colorWithRed:100/255.f green:100/255.f blue:100/255.f alpha:1.0];
        
//        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:logoBG];

        [self.contentView addSubview:_logo];
        
        [self.contentView addSubview:_name];
        
    }
    return self;
}

- (void)updateUI:(GSLogoReourcesType)reourcesType;
{
    switch (reourcesType) {
        case GSLogoReourcesTypeSina: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"sina"]];
            _name.text = @"新浪";
            break;
        }
        case GSLogoReourcesTypeQQ: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"qq"]];
            _name.text = @"QQ";
            break;
        }
        case GSLogoReourcesTypeQzone: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"qzone"]];
            _name.text = @"QQ空间";
            break;
        }
        case GSLogoReourcesTypeWechatSession: {
            [_logo setImage:[[GSReourcesManager share] logoWithName:@"wechat"]];
            _name.text = @"微信";
            break;
        }
        case GSLogoReourcesTypeWechatTimeLine: {
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
