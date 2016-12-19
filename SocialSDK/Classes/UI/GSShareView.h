//
//  GSShareView.h
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSShareChannelType.h"

typedef void (^GSShareViewCompletionBlock) (BOOL isCancel, GSShareChannelType channelType);

/**
 选择分享渠道UI
 */
@interface GSShareView : UIView

+ (void)showShareViewWithChannels:(NSArray *)channels completionBlock:(GSShareViewCompletionBlock)completionBlock;

@end
