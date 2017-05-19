//
//  GSSelectViewProtocol.h
//  SocialSDKDemo
//
//  Created by lijunjie on 19/05/2017.
//  Copyright © 2017 GagSquad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSLogoReourcesType.h"

typedef void (^GSSelectViewCompletionBlock) (BOOL isCancel, GSLogoReourcesType reourcesType);

@protocol GSSelectViewProtocol <NSObject>

+ (void)showShareViewWithChannels:(NSArray <NSNumber *> *)channels completionBlock:(GSSelectViewCompletionBlock)completionBlock;
@end
