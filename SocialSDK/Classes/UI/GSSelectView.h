//
//  GSSelectView.h
//  SocialSDKDemo
//
//  Created by lijunjie on 17/12/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSLogoReourcesType.h"

typedef void (^GSSelectViewCompletionBlock) (BOOL isCancel, GSLogoReourcesType reourcesType);

/**
 选择分享渠道UI
 */
@interface GSSelectView : UIWindow

+ (void)showShareViewWithChannels:(NSArray <NSNumber *> *)channels completionBlock:(GSSelectViewCompletionBlock)completionBlock;

@end
